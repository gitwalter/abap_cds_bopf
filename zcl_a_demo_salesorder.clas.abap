class ZCL_A_DEMO_SALESORDER definition
  public
  inheriting from /BOBF/CL_LIB_A_SUPERCLASS
  final
  create public .

public section.

  methods /BOBF/IF_FRW_ACTION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_A_DEMO_SALESORDER IMPLEMENTATION.


  method /bobf/if_frw_action~execute.
    case is_ctx-act_key.

        "Action - Set overall status
      when zif_demo_i_salesorder_c=>sc_action-zdemo_i_salesorder-set_overall_status_to_paid.
        " Get output structure of Action
        data(lt_sales_order) = value ztdemo_i_salesorder( ).

        "Read UI clicked sale order
        io_read->retrieve(
          exporting
            iv_node                 =  is_ctx-node_key   " BO Node Name
            it_key                  =  it_key            " BO Key
          importing
            et_data                 =  lt_sales_order ).   " Data Return Structure

        "Assuming single instance for a action
        read table lt_sales_order assigning field-symbol(<fs_sales_order>) index 1.
        if sy-subrc = 0.
          "Set the over all status to Paid ie 'P'
          if <fs_sales_order>-lifecyclestatus is initial.
            <fs_sales_order>-lifecyclestatus  = 'P'.
          endif.
        endif.

        "Now update the BO instance
        io_modify->update(
          exporting
            iv_node           = is_ctx-node_key    " Node
            iv_key            = <fs_sales_order>-key    " Key
            iv_root_key       = <fs_sales_order>-root_key     " NodeID
            is_data           = ref #( <fs_sales_order>-node_data )    " Data
            it_changed_fields = value #(
                                ( zif_demo_i_salesorder_c=>sc_node_attribute-zdemo_i_salesorder-lifecyclestatus ) )
                        ).

        et_data = lt_sales_order.

      when others.
        "Nothing

    endcase.
  endmethod.
ENDCLASS.
