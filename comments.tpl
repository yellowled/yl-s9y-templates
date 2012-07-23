{foreach from=$comments item=comment name="comments"}
    <article id="c{$comment.id}" class="clearfix serendipity_comment {cycle values="odd, even"} {if $comment.depth > 8}commentlevel-9{else}commentlevel-{$comment.depth}{/if}">
        <h4>{if $comment.url}<a href="{$comment.url}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if} {$CONST.ON} <time datetime="{$comment.timestamp|@serendipity_html5time}" pubdate>{$comment.timestamp|@formatTime:"%d.%m.%Y"}</time>:</h4>

        <div class="serendipity_commentBody clearfix">
        {if $comment.body == 'COMMENT_DELETED'}
            <p>{$CONST.COMMENT_IS_DELETED}</p>
        {else}
            {$comment.body}
        {/if}
        </div>
    {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
        <a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>
        <div id="serendipity_replyform_{$comment.id}"></div>
    {/if}
    </article>
{foreachelse}
    <p class="nocontent">{$CONST.NO_COMMENTS}</p>
{/foreach}
