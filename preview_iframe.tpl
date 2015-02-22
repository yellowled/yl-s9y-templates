{if $is_embedded != true}
<!doctype html>
<!--[if IE 8 ]>    <html class="no-js lt-ie9" lang="{$lang}"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="{$lang}"> <!--<![endif]-->
<head>
    <meta charset="{$head_charset}">
    <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{$serendipityHTTPPath}{$serendipityRewritePrefix}serendipity.css">
<!--[if lte IE 8]>
    <link rel="stylesheet" href="{serendipity_getFile file="oldie.css"}">
<![endif]-->
    <script src="{serendipity_getFile file="scripts/modernizr/modernizr.js"}"></script>
{serendipity_hookPlugin hook="backend_header" hookAll="true"}
    <script src="{serendipity_getFile file='admin/js/plugins.js'}"></script>
    <script src="{serendipity_getFile file='admin/serendipity_editor.js'}"></script>
<script type="text/javascript">
window.onload = function() {ldelim}
    parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('main').offsetHeight
                                                                      + parseInt(document.getElementById('main').style.marginTop)
                                                                      + parseInt(document.getElementById('main').style.marginBottom)
                                                                      + 'px';
    parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
    parent.document.getElementById('serendipity_iframe').style.border = 0;
{rdelim}
</script>
</head>
<body style="padding: 0; margin: 0;">
    <div id="main" style="padding: 0; margin: 0 auto; width: 98%;">
        <main>
        {$preview}
        </main>
    </div>

    <script src="{serendipity_getFile file="scripts/master.js"}"></script>
</body>
</html>
