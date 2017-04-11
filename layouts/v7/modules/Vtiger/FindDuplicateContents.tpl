{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
{* modules/Vtiger/views/FindDuplicates.php *}

{* START YOUR IMPLEMENTATION FROM BELOW. Use {debug} for information *}
<div>
    {include file="FindDuplicateHeader.tpl"|vtemplate_path:$MODULE}
</div>
<div id="findDuplicateContents" class="container-fluid" style="padding-top:5px;">
     <div class="row">
        <div class="col-lg-12">
        <input type="hidden" id="listViewEntriesCount" value="{$LISTVIEW_ENTRIES_COUNT}" />
        <input type="hidden" id="pageStartRange" value="{$PAGING_MODEL->getRecordStartRange()}" />
        <input type="hidden" id="pageEndRange" value="{$PAGING_MODEL->getRecordEndRange()}" />
        <input type="hidden" id="previousPageExist" value="{$PAGING_MODEL->isPrevPageExists()}" />
        <input type="hidden" id="nextPageExist" value="{$PAGING_MODEL->isNextPageExists()}" />
        <input type="hidden" id="pageNumber" value= "{$PAGE_NUMBER}"/>
        <input type="hidden" id="pageLimit" value= "{$PAGING_MODEL->getPageLimit()}" />
        <input type="hidden" id="noOfEntries" value= "{$LISTVIEW_ENTRIES_COUNT}" />
        <input type="hidden" id="duplicateSearchFields" value={Zend_Json::encode($DUPLICATE_SEARCH_FIELDS)} />
        <input type="hidden" id="viewName" value="{$VIEW_NAME}" />
        <input type="hidden" id="totalCount" value="{$TOTAL_COUNT}" />
        <input type='hidden' id='ignoreEmpty' value="{$IGNORE_EMPTY}" />
        <input type="hidden" id="mergeSelectedIds" />
        <table id="listview-table"  class="listview-table table table-bordered">
            <thead>
                <tr class="listViewContentHeader">
                    <th>
                        <center><input type="checkbox" class="listViewEntriesMainCheckBox" /></center> 
                    </th>
                    {foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
                        <th>
                            <center>{vtranslate($LISTVIEW_HEADER->get('label'), $MODULE)}</center>
                        </th>
                    {/foreach}
                    <th> <center>{vtranslate('LBL_MERGE_SELECT', $MODULE)}</center></th>
                    <th> <center>{vtranslate('LBL_ACTION', $MODULE)}</center></th>
                </tr>   
             </thead>
            {foreach item=LISTVIEW_ENTRY key=GROUP_NAME from=$LISTVIEW_ENTRIES}
                {assign var=groupCount value=$LISTVIEW_ENTRY|@sizeof}
                {assign var=recordCount value=0}
                {foreach item=RECORD from=$LISTVIEW_ENTRY name=listview}
                    <tr class="listViewEntries" data-id='{$RECORD.recordid}' id="{$MODULE}_listView_row_{$smarty.foreach.listview.index+1}">
                        <td>
                            <center><input type="checkbox" value="{$RECORD.recordid}" class="listViewEntriesCheckBox"/></center>
                        </td>
                        {assign var=sameRowValues value=true}
                        {foreach item=LISTVIEW_HEADER from=$LISTVIEW_HEADERS}
                        {if $LISTVIEW_HEADER->get('name') eq 'recordid'}
                            <td nowrap>
                                <center><a href="{$MODULE_MODEL->getDetailViewUrl($RECORD.recordid)}">{$RECORD[$LISTVIEW_HEADER->get('name')]}</a></center>
                            </td>
                        {else}
                            <td name="{$LISTVIEW_HEADER->get('name')}" nowrap style='border-bottom:1px solid #DDD;' data-value="{strip_tags($LISTVIEW_HEADER->getDisplayValue($RECORD[$LISTVIEW_HEADER->get('column')], $RECORD.recordid))}">
                                <center>{$LISTVIEW_HEADER->getDisplayValue($RECORD[$LISTVIEW_HEADER->get('column')], $RECORD.recordid)}</center>
                            </td>
                        {/if}
                        {/foreach}
                        <td>
                            <center><input type="checkbox" data-id='{$RECORD.recordid}' name="mergeRecord" data-group="{$GROUP_NAME}"/></center>
                        </td>
                        {if $recordCount eq 0}
                        <td rowspan="{$groupCount}" style="vertical-align: middle;">
                            <center><input type="button" value="{vtranslate('Merge', $MODULE)}" name="merge" class="btn btn-success" data-group="{$GROUP_NAME}"></center>
                        </td>
                        {/if}
                        {assign var=recordCount value=$recordCount+1}
                    </tr>
                {/foreach}
            {/foreach}
         </table>
         </div>
     </div>
</div>