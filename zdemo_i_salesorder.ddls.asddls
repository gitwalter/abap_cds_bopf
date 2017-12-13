@AbapCatalog.sqlViewName: 'ZDDL_I_SO16'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZDEMO_I_SALESORDER'

@Search.searchable: true

@ObjectModel: {
                compositionRoot: true,
                transactionalProcessingEnabled: true,
                writeActivePersistence: 'ZPROTO_SO_A',
                semanticKey: 'SalesOrderID',
                representativeKey: 'SalesOrderID',
                createEnabled: true,
                updateEnabled: true,
                deleteEnabled: true
}

define view ZDEMO_I_SALESORDER as select from zproto_so_a as SalesOrder
   association [0..*] to Zdemo_I__Salesorder_Item as _Item on $projection.SalesOrderID = _Item.SalesOrderID {
    
    @Search.defaultSearchElement: true
    key SalesOrder.salesorderid as SalesOrderID,
    
    @Search.defaultSearchElement: true
    SalesOrder.businesspartnerid as BusinessPartnerID,
    
    SalesOrder.currencycode as CurrencyCode,
    SalesOrder.grossamount as GrossAmount,
    SalesOrder.netamount as NetAmount,
    SalesOrder.taxamount as TaxAmount,
    SalesOrder.lifecyclestatus as LifecycleStatus,
    
    @ObjectModel.association.type: #TO_COMPOSITION_CHILD
    _Item    
} 
 