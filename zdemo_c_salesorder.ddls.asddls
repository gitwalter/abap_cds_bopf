@AbapCatalog.sqlViewName: 'zddl_c_so16'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZDEMO_C_SALESORDER'
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

define view ZDEMO_C_SALESORDER
  as select from ZDEMO_I_SALESORDER
  association [0..*] to Zdemo_C_Salesorder_Item as _Item on $projection.SalesOrderID = _Item.SalesOrderID
{
      @UI.lineItem.position: 10
      @UI.lineItem: [
         { type: #FOR_ACTION, position: 1, dataAction: 'BOPF:SET_LIFECYCLE_STATUS_TO_PAID', label: 'Set to Paid' }
       ]
      @Search.defaultSearchElement: true
      @UI.identification: {position: 10, importance: #HIGH}
      @UI.selectionField: {position: 10}
  key ZDEMO_I_SALESORDER.SalesOrderID,

      @Search.defaultSearchElement: true
      @UI.identification: {position: 20, importance: #HIGH}
      @UI.lineItem: {position: 20, importance: #HIGH}
      @UI.selectionField: {position: 20}
      ZDEMO_I_SALESORDER.BusinessPartnerID,

      @UI.identification: {position: 30, importance: #HIGH}
      @UI.lineItem: {position: 30, importance: #HIGH}
      ZDEMO_I_SALESORDER.CurrencyCode,

      @UI.identification: {position: 40, importance: #HIGH}
      @UI.lineItem: {position: 40, importance: #HIGH}
      @UI.dataPoint: {title: 'GrossAmount'}
      ZDEMO_I_SALESORDER.GrossAmount,

      @UI.lineItem: {position: 50, importance: #HIGH}
      @UI.dataPoint: {title: 'NetAmount'}
      ZDEMO_I_SALESORDER.NetAmount,

      @UI.lineItem: {position: 60, importance: #HIGH}
      @UI.dataPoint: {title: 'TaxAmount'}
      ZDEMO_I_SALESORDER.TaxAmount,

      @UI.lineItem: {position: 70, importance: #HIGH}
      @UI.dataPoint: {title: 'LifecycleStatus'}
      ZDEMO_I_SALESORDER.LifecycleStatus,

      @UI.fieldGroup: [{qualifier: 'Item', groupLabel: 'Item', position: 40, importance: #HIGH}]
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Item
} 
 