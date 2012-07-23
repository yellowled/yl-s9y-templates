{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    <article id="post_{$entry.id}" class="clearfix serendipity_entry{if $dategroup.is_sticky} sticky{/if}">
        <header class="clearfix">
            <h2><a href="{$entry.link}">{$entry.title}</a></h2>

            <span class="serendipity_byline">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {$CONST.ON} <time datetime="{$entry.timestamp|@serendipity_html5time}" pubdate>{$entry.timestamp|@formatTime:"%d.%m.%Y"}</time></span>
        </header>

        <div class="clearfix content serendipity_entry_body">
        {if $entry.categories}{foreach from=$entry.categories item="entry_category"}{if $entry_category.category_icon}<a href="{$entry_category.category_link}"><img class="serendipity_entryIcon" title="{$entry_category.category_name|@escape}{$entry_category.category_description|@emptyPrefix}" alt="{$entry_category.category_name|@escape}" src="{$entry_category.category_icon}"></a>{/if}{/foreach}{/if}
        {$entry.body}
        {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
        <a class="block-link" href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a>
        {/if}
        </div>
        {if $entry.is_extended}
        <div id="extended" class="clearfix content">
        {$entry.extended}
        </div>
        {/if}

        <footer class="clearfix">
        {if $entry.categories}
            <span class="visuallyhidden">{$CONST.CATEGORIES}: </span>{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}
        {/if}
        {if $entry.categories and $entry.has_comments} | {/if}
        {if ($entry.has_comments}
            <a href="{$entry.link}#comments" title="{$entry.comments} {$entry.label_comments}{if $entry.has_trackbacks}, {$entry.trackbacks} {$entry.label_trackbacks}{/if}">{$entry.comments} {$entry.label_comments}</a>
        {/if}
            <div class="clearfix">
            {$entry.add_footer}
            {$entry.plugin_display_dat}
            </div>
        </footer>
        <!--
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                 xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
                 xmlns:dc="http://purl.org/dc/elements/1.1/">
        <rdf:Description
                 rdf:about="{$entry.link_rdf}"
                 trackback:ping="{$entry.link_trackback}"
                 dc:title="{$entry.title_rdf|@default:$entry.title}"
                 dc:identifier="{$entry.rdf_ident}" />
        </rdf:RDF>
        -->
{if $is_single_entry and not $use_popups and not $is_preview}
    {if $CONST.DATA_UNSUBSCRIBED}
        <p class="serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</p>
    {/if}
    {if $CONST.DATA_TRACKBACK_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</p>
    {/if}
    {if $CONST.DATA_TRACKBACK_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</p>
    {/if}
    {if $CONST.DATA_COMMENT_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</p>
    {/if}
    {if $CONST.DATA_COMMENT_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</p>
    {/if}
    <section id="trackbacks" class="serendipity_section_trackbacks">
        <h3>{$CONST.TRACKBACKS}</h3>

        <a class="block-link" rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
        {serendipity_printTrackbacks entry=$entry.id}
    </section>
{/if}
{if $is_single_entry and not $is_preview}
    <section id="comments" class="serendipity_section_comments">
        <h3>{$CONST.COMMENTS}</h3>

        <span class="comment_view">{$CONST.DISPLAY_COMMENTS_AS} {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}{$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>{else}<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED}{/if}</span>
        {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
    {if $entry.is_entry_owner}
        {if $entry.allow_comments}
        <a class="block-link" href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>
        {else}
        <a class="block-link" href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>
        {/if}
    {/if}
    </section>

    <a id="feedback"></a>
    {foreach from=$comments_messagestack item="message"}
    <p class="serendipity_msg_important">{$message}</p>
    {/foreach}
    {if $is_comment_added}
    <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
    {elseif $is_comment_moderate}
    <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}{$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
    {elseif not $entry.allow_comments}
    <p class="serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
    {else}
    <section id="reply" class="serendipity_section_commentform">
        <h3>{$CONST.ADD_COMMENT}</h3>
        {$COMMENTFORM}
	</section>
    {/if}
{/if}
    {$entry.backend_preview}
    </article>
    {/foreach}
{foreachelse}
    {if not $plugin_clean_page}
    <p class="nocontent">{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/foreach}
{if $footer_prev_page or $footer_next_page}
    <nav class="serendipity_pagination">
        <h2{if not $footer_info} class="visuallyhidden"{/if}>{$footer_info}</h2>

        <ul class="clearfix">
            <li class="prev">{if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}{$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}</li>
            <li class="next">{if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE}{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}</li>
        </ul>
    </nav>
{/if}
{serendipity_hookPlugin hook="entries_footer"}
