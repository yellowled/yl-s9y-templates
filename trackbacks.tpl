{foreach from=$trackbacks item=trackback}
    <article id="c{$trackback.id}" class="clearfix serendipity_trackback">
        <h4><cite>{$trackback.author|@default:$CONST.ANONYMOUS}</cite> {$CONST.ON} <time datetime="{$trackback.timestamp|@serendipity_html5time}" pubdate>{$trackback.timestamp|@formatTime:"%d.%m.%Y"}</time>: <a href="{$trackback.url|@strip_tags}">{$trackback.title}</a></h4>
	{if $trackback.body == ''}
		<span class="visuallyhidden">{$CONST.NO_ENTRIES_TO_PRINT}</span>
	{else}
        <details>
            <summary>{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$trackback.title}</summary>
            <div class="content serendipity_commentBody">{$trackback.body|@strip_tags|@escape:all}</div>
        </details>
    {/if}
    </article>
{foreachelse}
    <p class="nocontent">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
