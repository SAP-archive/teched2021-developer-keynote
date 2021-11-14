# ABAP Extensibility with Embedded Steampunk

SAP S/4HANA Cloud customers and partners need a way to extend SAP functionality in a cloud-ready way while continuing to keep the core clean.  One way to achieve this is to employ a side-by-side scenario, and leveraging the SAP BTP, ABAP Environment also known as Steampunk. Now there is another way, Embedded Steampunk, which now allows developers to create custom code directly in the SAP S/4HANA Cloud system.  In this demo, I have implemented the Purchase Requisition CHECK BAdI, which allows me to create custom code at a specific enhancement spot in the main codeline. In this example, I retrieve additional material master data via the exposed CDS views I_PRODUCTSUPPLYPLANNING and join that with the importing parameter which contains the pruchase requisition line items.  I then check the order quantity against the minimum lot size quantity in the material master and issue an error.

```abap
    
CLASS zcl_mm_pur_s4_pr_check DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mm_pur_s4_pr_check .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_mm_pur_s4_pr_check IMPLEMENTATION.

  METHOD if_mm_pur_s4_pr_check~check.    
    
    DATA ls_message TYPE mmpur_s_messages.

    SELECT purreq~material, purreq~plant, purreq~orderedquantity, prodsupply~minimumlotsizequantity
             FROM @purchaserequisitionitem_table AS purreq
                      INNER JOIN i_productsupplyplanning AS prodsupply
                           ON purreq~material =  prodsupply~product
                          AND purreq~plant    =  prodsupply~plant
                                           INTO TABLE @DATA(lt_plantdata).

    LOOP AT lt_plantdata REFERENCE INTO DATA(lr_plantdata).
      IF lr_plantdata->orderedquantity < lr_plantdata->minimumlotsizequantity.
        ls_message-messageid        = 'DUMMY'.           "Message ID
        ls_message-messagetype      = 'E'.             "Type of Message
        ls_message-messagenumber    = '001'.         "Message Number
        ls_message-messagevariable1 = | Quanity for material { lr_plantdata->material }  must >= minimum lot size quanity |.
        APPEND ls_message TO messages.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

```

