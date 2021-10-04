# BADI Implementation within SAP S/4HANA Cloud leveraging Embedded Steampunk 

[Video Draft](https://sap.sharepoint.com/sites/100499/advocates/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2F100499%2Fadvocates%2FShared%20Documents%2F203%2DProjects%2FTechEd%202021%2FKeynote%20Videos%2FDeveloper%20Keynote%20%2D%20ABAP%20eSteampunk%20BAdI%20%2D%20Rough%20Demo%2Emp4&parent=%2Fsites%2F100499%2Fadvocates%2FShared%20Documents%2F203%2DProjects%2FTechEd%202021%2FKeynote%20Videos)

> Open on Houseguest full screen in the Diary Room

I can remember when programming was so much less complicated, you opened an editor, wrote some code and activated it.  That's it, all you needed to do was run it. That's why I love ABAP, for its power and simplicity. 

> Transition to demo in the main screen and Diary Room with Houseguest in small window in corner. 

SAP S/4HANA Cloud customers and partners need a way to extend SAP functionality in a cloud-ready way, while continuing to keep the core clean.  One way to acheive this is to employ the side-by-side scenario and leveraging SAP BTP, ABAP Environment aka steampunk.  Now there is another way, Embedded Steampunk, which now allows developers to create custom code directly in the SAP S/4HANA Cloud system.

> Open by showing the Purchase Req management screen, show that when editing a line item, I can freely enter any quantity that I want.

Lets take the Purchase Requisition management application for example, I've already created a purchase req with a single line item and I can freely change the order quantity to whatever I want. But what if I wanted to implement some custom code that would check the order quantity against some value.

> Go to ADT, show that we are in an eSteampunk system, and that there are released objects available for me to leverage

Lets go to ADT, here I am in an embedded steampunk system, and there a large number of released objects available for me to use in my custom code.  That is the key here, in Embedded steampunk  you must access the data via released APIs, such as CDS views. 

> Browse to the BADI definition, and show how to create an implementation for the CHECK BADI

BADIs are also available for us to implement at key enhancement spots within the main codeline.  In this case, I want to implement the CHECK BADI for purchase req management. 

> Talk through the code, first show that you can not SELECT against MARC directly, then show the copied code and show that we are SELECTing against a released view.

So I need to get some data from the material master. I need the minimum lot size quality so that I can compare that to the order quality.  I can't do a SELECT directly aganist the MARC table, its not allowed.  I have to go through released objects, such as the CDS view I_PRODUCTSUPPLYPLANNING.   Here I do a SELECT interjoin between the importing table parameter containing the item data, and the I_PRODUCTSUPPLYPLANNING CDS view on the masterial master.  Then looping through that result set and checking the order quantity of each line item against the minimum lot size qty in the material master.  If the order qty is less than the min lot size qty, then I will issue an error message for that line item.   

> Return to the Purchase Req management screen, and show that now we have an error message if the order quantity is less than the minimum lot size quantity in the material master

Ill save and activate this BADI implemtation and return to the purchase req management screen, where now if I change the qty, I can see that my check is now executed, and it issues the error message to the application. 

> Finally show that you of course debug the code in this scearnio as well.

But that's not all,  you can also debug your custom code with embedded steampunk, I can set my breakpoints as usual, and step through my code with no problem. 

> Closing

So as you can see, it is now really easy to implement custom code in your S4HANA Cloud systems leveraging the Embedded Steampunk functionality. 



