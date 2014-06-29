{if $searchresult_tooShort or $searchresult_error or $searchresult_noEntries or $searchresult_results}
    <p class="search-msg"><b>{$CONST.QUICKSEARCH}:</b> {$content_message}</p>
{elseif $content_message}
    <p class="content-msg">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
