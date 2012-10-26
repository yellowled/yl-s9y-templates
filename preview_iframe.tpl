{if $is_embedded != true}
<!doctype html>
<!--[if IE 7 ]>    <html class="no-js lt-ie9 lt-ie8" lang="{$lang}"> <![endif]-->
<!--[if IE 8 ]>    <html class="no-js lt-ie9" lang="{$lang}"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="{$lang}"> <!--<![endif]-->
<head>
    <meta charset="{$head_charset}">
    <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
    <meta name="viewport" content="width=device-width">
<!--[if lte IE 8]>
    <link rel="stylesheet" href="{serendipity_getFile file="oldie.css"}">
<![endif]-->
<!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="{$head_link_stylesheet}">
<!--<![endif]-->
    <script src="{serendipity_getFile file="scripts/vendor/modernizr-2.6.2.min.js"}"></script>
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
    <div id="main" class="clearfix" style="padding: 0; margin: 5px auto; width: 98%;">
        <div id="content" class="clearfix">
        {$preview}
        </div>
    </div>
</body>
</html>
