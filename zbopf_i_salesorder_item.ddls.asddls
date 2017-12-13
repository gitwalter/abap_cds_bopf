@AbapCatalog.sqlViewName: 'ZDDL_I_SOI20'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZBOPF_I_SALESORDER_ITEM'

@Search.searchable: true

@ObjectModel: {
                writeActivePersistence: 'ZBOPF_SALES_ITEM',
                semanticKey: ['SalesOrderID', 'SalesOrderItemID'],
                representativeKey: 'SalesOrderItemID',
                createEnabled: true,
                updateEnabled: true,
                deleteEnabled: true
}


define view zbopf_i_salesorder_item

    as select from zbopf_sales_item as Item
    /*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
    association [1..1]  to zbopf_i_salesorder as _SalesOrder on $projection.SalesOrderID = _SalesOrder.SalesOrderID
    
    {
    
        key Item.db_key as db_key,
            Item.parent_key as parent_key,
        
        @Search.defaultSearchElement: true
        @ObjectModel.readOnly: true
        Item.so_id as SalesOrderID,
        
        @Search.defaultSearchElement: true
        Item.item_position as SalesOrderItemID,
        
        @Search.defaultSearchElement: true
        Item.productid as ProductID,
        
        Item.currencycode as CurrencyCode,
        Item.grossamount as GrossAmount,
        Item.netamount as NetAmount,
        Item.taxamount as TaxAmount,
        
        @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
        _SalesOrder
     } 
 