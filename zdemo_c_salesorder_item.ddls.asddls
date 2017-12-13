@AbapCatalog.sqlViewName: 'ZDDL_C_SOI16'
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


define view Zdemo_C_Salesorder_Item
  as select from Zdemo_I__Salesorder_Item
  association [1..1] to ZDEMO_C_SALESORDER as _SalesOrder on $projection.SalesOrderID = _SalesOrder.SalesOrderID
{
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: {position: 10, importance: #HIGH}
      @UI.lineItem: {position: 10, importance: #HIGH}
  key Zdemo_I__Salesorder_Item.SalesOrderID,
  
      @Search.defaultSearchElement: true
      @ObjectModel.readOnly: true
      @UI.identification: {position: 20, importance: #HIGH}
      @UI.lineItem: {position: 20, importance: #HIGH}
  key Zdemo_I__Salesorder_Item.SalesOrderItemID,

      @UI.identification: {position: 70, importance: #HIGH}
      @UI.lineItem: {position: 70, importance: #HIGH}
      Zdemo_I__Salesorder_Item.CurrencyCode,

      @UI.identification: {position: 80, importance: #HIGH}
      @UI.lineItem: {position: 80, importance: #HIGH}
      Zdemo_I__Salesorder_Item.GrossAmount,

      @UI.identification: {position: 90, importance: #HIGH}
      @UI.lineItem: {position: 90, importance: #HIGH}
      Zdemo_I__Salesorder_Item.NetAmount,

      @UI.identification: {position: 100, importance: #HIGH}
      @UI.lineItem: {position: 100, importance: #HIGH}
      Zdemo_I__Salesorder_Item.TaxAmount,

      @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
      _SalesOrder
} 
 