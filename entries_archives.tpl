{serendipity_hookPlugin hook="entries_header"}
<article id="archives" class="clearfix">
    <h2>{$CONST.ARCHIVES}</h2>

{foreach from=$archives item="archive"}
    <section class="clearfix {cycle values="odd,even"} year">
        <h3>{$archive.year}</h3>

        <ul class="plainList">
        {foreach from=$archive.months item="month"}
            <li class="month">
                <span class="archives_date">{if $month.entry_count}<a href="{$month.link}" title="{$CONST.VIEW_FULL}">{/if}{$month.date|@formatTime:"%B"}{if $month.entry_count}</a>{/if}:</span>
                <span class="archives_count">{if $month.entry_count}<a href="{$month.link_summary}" title="{$CONST.VIEW_TOPICS}">{/if}{$month.entry_count} {$CONST.ENTRIES}{if $month.entry_count}</a>{/if}</span>
            </li>
        {/foreach}
        </ul>
    </section>
{/foreach}
</article>
{serendipity_hookPlugin hook="entries_footer"}
