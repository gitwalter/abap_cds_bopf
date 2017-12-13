@AbapCatalog.sqlViewName: 'ZDDL_I_SOI16'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZDEMO_I_SALESORDER_ITEM'

@Search.searchable: true

@ObjectModel: {
                writeActivePersistence: 'ZPROTO_SOI_A',
                semanticKey: ['SalesOrderID', 'SalesOrderItemID'],
                representativeKey: 'SalesOrderItemID',
                createEnabled: true,
                updateEnabled: true,
                deleteEnabled: true
}

define view Zdemo_I__Salesorder_Item

    as select from zproto_soi_a as Item
    association [1..1] to ZDEMO_I_SALESORDER as _SalesOrder on $projection.SalesOrderID = _SalesOrder.SalesOrderID
    
    {
        @Search.defaultSearchElement: true
        @ObjectModel.readOnly: true
        key Item.salesorderid as SalesOrderID,
        
        @Search.defaultSearchElement: true
        key Item.salesorderitemid as SalesOrderItemID,
        
        @Search.defaultSearchElement: true
        Item.productid as ProductID,
        
        Item.currencycode as CurrencyCode,
        Item.grossamount as GrossAmount,
        Item.netamount as NetAmount,
        Item.taxamount as TaxAmount,
        
        @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
        _SalesOrder
     } 
 