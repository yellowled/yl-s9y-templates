<?php
if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

if (class_exists('serendipity_event_spamblock')) {
    $required_fieldlist = serendipity_db_query("SELECT value FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%spamblock%required_fields'", true, 'assoc');
} elseif (class_exists('serendipity_event_commentspice')) {
    $required_fieldlist = serendipity_db_query("SELECT value FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%commentspice%required_fields'", true, 'assoc');
}

if (is_array($required_fieldlist)) {
    $required_fields = explode(',', $required_fieldlist['value']);
    $smarty_required_fields = array();

    foreach($required_fields AS $required_field) {
        $required_field = trim($required_field);

        if (empty($required_field)) continue;
            $smarty_required_fields[$required_field] = $required_field;
        }

    $serendipity['smarty']->assign('required_fields', $smarty_required_fields);
}

$template_config = array(
   array(
       'var' => 'use_corenav',
       'name' => 'Navigation einbinden?',
       'type' => 'boolean',
       'default' => true
   )
);

$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $serendipity['smarty_vars']['template_option'], true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if ($_SESSION['serendipityUseTemplate']) {
    $template_loaded_config['use_corenav'] = false;
}
