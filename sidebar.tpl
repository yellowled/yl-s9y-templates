{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
	<section class="sidebar_widget {$item.class}">
    {if $item.title != ""}
    	<h3>{$item.title}</h3>
	{/if}
        <div class="sidebar_content">
    	{$item.content}
    	</div>
    </section>
{/foreach}
{if $is_raw_mode}
</div>
{/if}
