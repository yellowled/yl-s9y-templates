{if $is_embedded != true}
<!doctype html>
<!--[if IE 7 ]>    <html class="no-js lt-ie9 lt-ie8" lang="{$lang}"> <![endif]-->
<!--[if IE 8 ]>    <html class="no-js lt-ie9" lang="{$lang}"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="{$lang}"> <!--<![endif]-->
<head>
    <meta charset="{$head_charset}">
    <title>{$head_title|@default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
    <meta name="generator" content="Serendipity v.{$head_version}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--[if lte IE 8]>
    <script src="scripts/helpers/main-shiv.js"></script>
    <link rel="stylesheet" href="{serendipity_getFile file="oldie.css"}">
<![endif]-->
<!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="{$head_link_stylesheet}">
<!--<![endif]-->
    <script src="{serendipity_getFile file="scripts/vendor/modernizr-2.6.2.min.js"}"></script>
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
    <header>
        <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
        <span>{$blogDescription}</span>
    </header>

    <div class="clearfix">
        <main>
        {$CONTENT}
        </main>

        <aside>
        {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
        {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
        </aside>
    </div>

    <footer>
        <p><span class="powered">Betrieben mit <a href="http://s9y.org"><span lang="en">Serendipity</span></a>.</span>
           <span class="credit"><span lang="en">Template</span>: <a href="http://netzgestaltung.net">Matthias Mees</a>.</span></p>
    </footer>

    <script src="{serendipity_getFile file="scripts/master.js"}"></script>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
