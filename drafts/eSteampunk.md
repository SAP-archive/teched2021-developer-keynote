# BADI Implementation within SAP S/4HANA Cloud leveraging Embedded Steampunk 

[Video Draft](https://sap.sharepoint.com/sites/100499/advocates/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2F100499%2Fadvocates%2FShared%20Documents%2F203%2DProjects%2FTechEd%202021%2FKeynote%20Videos%2FDeveloper%20Keynote%20%2D%20ABAP%20eSteampunk%20BAdI%20%2D%20Rough%20Demo%2Emp4&parent=%2Fsites%2F100499%2Fadvocates%2FShared%20Documents%2F203%2DProjects%2FTechEd%202021%2FKeynote%20Videos)

> Open on Houseguest full screen in the Diary Room

I can remember when programming was so much less complicated, you opened an editor, you wrote some code, you activated it.  That’s it, that’s all you needed to do to run your application.  That’s why I love ABAP, for its power and simplicity.

> Transition to demo in the main screen and Diary Room with Houseguest in small window in corner. 

SAP S/4HANA Cloud customers and partners need a way to extend SAP functionality in a cloud-ready way while continuing to keep the core clean.  One way to achieve this is to employ a side-by-side scenario, and leveraging the SAP BTP, ABAP Environment also known as steampunk. Now there is another way, Embedded Steampunk, which now allows developers  to create custom code directly in the SAP S/4HANA Cloud system. 

> Open by showing the Purchase Req management screen, show that when editing a line item, I can freely enter any quantity that I want.

Lets take the purchase requisition management application for example, I’ve already created a purchase requisition with a single line item and I can freely change the order quantity to whatever I want.  What if I wanted to implement some custom code that would check the order quantity against some value in an SAP standard table, such as the material master table MARC. 

> Go to ADT, show that we are in an eSteampunk system, and that there are released objects available for me to leverage

Lets go to ABAP Developer Tools, or ADT.   Here I’m logged into an S/4HANA Cloud system which includes Embedded Steampunk.  There are a large number of released objects available for me to use in my custom code from several S/4HANA modules. That is the key here, with embedded steampunk, you must access the data via released APIs, such as CDS views. 

> Browse to the BADI definition, and show how to create an implementation for the CHECK BADI

Business Ad-ins or BAdIs are also available for developers to implement at key enhancement spots within the main code line. In this case I want to implement the CHECK BAdI for purchase requisition management.  Lets jump directly to the BAdI implementation class that I’ve already created.   In the CHECK method, I need to implement my own custom code to perform the check.

> Talk through the code, first show that you can not SELECT against MARC directly, then show the copied code and show that we are SELECTing against a released view.

But first, I need to get some data from the material master. I need to get the minimum lot size quantity so that I can compare that to the order quantity.  I can’t do a SELECT against the MARC table directly, this is not allowed in embedded steampunk.  I have to go through release objects such as the CDS view, I_PRODUCTSUPPLYPLANNING which contains the minimum lot size field that I need.  Here I do a SELECT INNER JOIN between the importing table parameter of the CHECK method, which contains the purchase requisition item data, and the I_PRODUCTSUPPLYPLANNING CDS view on the material master.   Then I loop through the result set and check the order quantity of each line item against the minimum lot size quantity in the material master. If the order quantity is less than the minimum lot size quantity, then I issue an error message for that line item.    

> Return to the Purchase Req management screen, and show that now we have an error message if the order quantity is less than the minimum lot size quantity in the material master

I’ll go ahead and save and activate this BAdI implementation. Now if I return to the purchase requisition management application and change the order quantity, you can see that my check logic from my BAdI Implementation is being executed and that I am getting the error message that I issued in that IF statement block.  

> Finally show that you of course debug the code in this scearnio as well.

But that’s not all,  you can also debug your custom code in embedded steampunk. I can set my break point as usual, return to the application and trigger the debug session, and now I can step through my custom code and check values as needed.  

> Closing

So as you can see, its now really easy to implement custom code in your S/4HANA Cloud system leveraging the embedded steampunk  functionality.  Not only can you implement BADIs, but you can also code full blown business applications in S/4HANA Cloud, not with classic ABAP, but in an upgrade stable, cloud ready way, and leveraging the ABAP RESTful Application Programming Model. 



