<article id="page-{$staticpage_pagetitle|@makeFilename}" class="clearfix page">
    <h2>{if $staticpage_articleformat}{if $staticpage_articleformattitle}{$staticpage_articleformattitle|@escape}{else}{$staticpage_pagetitle}{/if}{else}{if $staticpage_headline}{$staticpage_headline|@escape}{else}{$staticpage_pagetitle}{/if}{/if}</h2>
{if is_array($staticpage_childpages)}
    <ul id="staticpage_childpages">
    {foreach from=$staticpage_childpages item="childpage"}
        <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
    {/foreach}
    </ul>
{/if}
{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
    <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
    <fieldset>
        <legend>{$CONST.STATICPAGE_PASSWORD_NOTICE}</legend>
        <input name="serendipity[pass]" type="password" value="">
        <input name="submit" type="submit" value="{$CONST.GO}" >
    </fieldset>
    </form>
{else}
    {if $staticpage_precontent}
    <div class="clearfix content preface">
    {$staticpage_precontent}
    </div>
    {/if}
    {if $staticpage_content}
    <div class="clearfix content">
    {$staticpage_content}
    </div>
    {/if}
{/if}
{if $staticpage_author or $staticpage_lastchange}
    <footer class="staticpage_metainfo">
        <small>
        {if $staticpage_author}
            <span class="visuallyhidden">{$CONST.POSTED_BY} </span>{$staticpage_author|@escape}
        {/if}
        {if $staticpage_lastchange}
            | <span class="visuallyhidden">{$CONST.ON} </span><time datetime="{$staticpage_lastchange|@serendipity_html5time}" pubdate>{$staticpage_lastchange|date_format:"%d.%m.%Y"}</time>
        {/if}
        </small>
    </footer>
{/if}
</article>
