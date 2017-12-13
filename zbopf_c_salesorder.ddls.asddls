@AbapCatalog.sqlViewName: 'zddl_c_so20'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZBOPF_C_SALESORDER'
@Search.searchable: true

@OData.publish: true

@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.semanticKey: 'SalesOrderID'
@ObjectModel.representativeKey: 'SalesOrderID'
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true

@UI.headerInfo.typeName: 'Sales Order'
@UI.headerInfo.title.value: 'SalesOrderID'

define view ZBOPF_C_SALESORDER
  as select from zbopf_i_salesorder
  association [0..*] to ZBOPF_C_SALESORDER_ITEM as _Item on $projection.SalesOrderID = _Item.SalesOrderID
{
      key zbopf_i_salesorder.db_key as DB_KEY,
     
      @UI.lineItem.position: 10
      @UI.lineItem: [
         { type: #FOR_ACTION, position: 1, dataAction: 'BOPF:SET_LIFECYCLE_STATUS_TO_PAID', label: 'Set to Paid' }
       ]
      @Search.defaultSearchElement: true
      @UI.identification: {position: 10, importance: #HIGH}
      @UI.selectionField: {position: 10}
      zbopf_i_salesorder.SalesOrderID,

      @Search.defaultSearchElement: true
      @UI.identification: {position: 20, importance: #HIGH}
      @UI.lineItem: {position: 20, importance: #HIGH}
      @UI.selectionField: {position: 20}
      zbopf_i_salesorder.BusinessPartnerID,

      @UI.identification: {position: 30, importance: #HIGH}
      @UI.lineItem: {position: 30, importance: #HIGH}
      zbopf_i_salesorder.CurrencyCode,

      @UI.identification: {position: 40, importance: #HIGH}
      @UI.lineItem: {position: 40, importance: #HIGH}
      @UI.dataPoint: {title: 'GrossAmount'}
      zbopf_i_salesorder.GrossAmount,

      @UI.lineItem: {position: 50, importance: #HIGH}
      @UI.dataPoint: {title: 'NetAmount'}
      zbopf_i_salesorder.NetAmount,

      @UI.lineItem: {position: 60, importance: #HIGH}
      @UI.dataPoint: {title: 'TaxAmount'}
      zbopf_i_salesorder.TaxAmount,

      @UI.lineItem: {position: 70, importance: #HIGH}
      @UI.dataPoint: {title: 'LifecycleStatus'}
      zbopf_i_salesorder.LifecycleStatus,

      @UI.fieldGroup: [{qualifier: 'Item', groupLabel: 'Item', position: 40, importance: #HIGH}]
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Item
}  
 