@AbapCatalog.sqlViewName: 'zddl_c_soi20'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZDEMO_C_SALESORDER_ITEM'

@Search.searchable: true
@UI.headerInfo.typeName: 'Sales Order Item'
@UI.headerInfo.title.value: 'SalesOrderItemID'

@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.semanticKey: [ 'SalesOrderID', 'SalesOrderItemID' ]
@ObjectModel.representativeKey: 'SalesOrderItemID'
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true


define view ZBOPF_C_SALESORDER_ITEM
  as select from zbopf_i_salesorder_item
  association [1..1] to ZBOPF_C_SALESORDER as _SalesOrder on $projection.SalesOrderID = _SalesOrder.SalesOrderID
{
  key zbopf_i_salesorder_item.db_key as db_key,
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: {position: 10, importance: #HIGH}
      @UI.lineItem: {position: 10, importance: #HIGH}
  key zbopf_i_salesorder_item.SalesOrderID,
  
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: {position: 20, importance: #HIGH}
      @UI.lineItem: {position: 20, importance: #HIGH}
  key zbopf_i_salesorder_item.SalesOrderItemID,

      @UI.identification: {position: 70, importance: #HIGH}
      @UI.lineItem: {position: 70, importance: #HIGH}
      zbopf_i_salesorder_item.CurrencyCode,

      @UI.identification: {position: 80, importance: #HIGH}
      @UI.lineItem: {position: 80, importance: #HIGH}
      zbopf_i_salesorder_item.GrossAmount,

      @UI.identification: {position: 90, importance: #HIGH}
      @UI.lineItem: {position: 90, importance: #HIGH}
      zbopf_i_salesorder_item.NetAmount,

      @UI.identification: {position: 100, importance: #HIGH}
      @UI.lineItem: {position: 100, importance: #HIGH}
      zbopf_i_salesorder_item.TaxAmount,

      @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
      _SalesOrder
} 
 