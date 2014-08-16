{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
	<section class="widget {$item.class}">
    {if $item.title != ""}
    	<h3>{$item.title}</h3>
	{/if}
        <div class="widget-body">
    	{$item.content}
    	</div>
    </section>
{/foreach}
{if $is_raw_mode}
</div>
{/if}
