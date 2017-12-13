@AbapCatalog.sqlViewName: 'ZDDL_I_SO20'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZBOPF_I_SALESORDER'

@Search.searchable: true

@ObjectModel: {
                compositionRoot: true,
                transactionalProcessingEnabled: true,
                writeActivePersistence: 'ZBOPF_SALES_HDR',
                semanticKey: 'SalesOrderID',
                representativeKey: 'SalesOrderID',
                createEnabled: true,
                updateEnabled: true,
                deleteEnabled: true
}

define view zbopf_i_salesorder as select from zbopf_sales_hdr as SalesOrder
   association [0..*] to zbopf_i_salesorder_item as _Item on $projection.SalesOrderID = _Item.SalesOrderID {
    
    key SalesOrder.db_key as db_key,    
    
    @Search.defaultSearchElement: true
    SalesOrder.so_id as SalesOrderID,
    
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
 