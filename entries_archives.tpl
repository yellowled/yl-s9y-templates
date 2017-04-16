{serendipity_hookPlugin hook="entries_header"}
<article class="archive archive_overview">
    <h2>{$CONST.ARCHIVES}</h2>
{foreach from=$archives item="archive"}
    <section class="archive_year">
        <h3>{$archive.year}</h3>

        <dl>
        {foreach from=$archive.months item="month"}
            <dt>{if $month.entry_count}<a href="{$month.link}" title="{$CONST.VIEW_FULL}">{/if}{$month.date|formatTime:"%B"}{if $month.entry_count}</a>{/if}:</dt>
            <dd>{if $month.entry_count}<a href="{$month.link_summary}" title="{$CONST.VIEW_TOPICS}">{/if}{$month.entry_count} {$CONST.ENTRIES}{if $month.entry_count}</a>{/if}</dd>
        {/foreach}
        </dl>
    </section>
{/foreach}
</article>
{serendipity_hookPlugin hook="entries_footer"}