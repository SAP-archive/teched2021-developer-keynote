# Demo flow

## Screen capture

<https://sap-my.sharepoint.com/:v:/p/marius_obert/EWQ0trzo3rVPnE7ziFX9t88B90nJNjeaUIk5xmTQY0eWCA?e=fE9DYd>

## Intro


Tom built a really nice OData v4 service with CAP that is based on an OData v2 from an SAP system. But he doesn't realize that he won't be able to win this week with it.
In the end, this is just a neat API that no business user will ever see. The business users want to see a delightful UI that implements established UX standards and best practices that they already know from other business apps. I get that, the predefined floorplans can sometimes appear a bit boring and might only bring 95% of the features that business users actually need. For me, a lazy developer, this is still great news as I won't have to reimplement the same application repeatedly - and neither do I need to maintain it nor fix bugs. The best code is no code.

This week, it was my task to implement this remaining 5% of such an application, and I'm confident that I'll win the challenge with the help of the new flexible programming model for SAP Fiori elements apps!

## Add a basic SAP Fiori elements list report

So first, I add some basic SAP Fiori annotations in the CDS model. Then I'll use the SAP Fiori tools for VS Code to integrate an SAP Fiori element List Report application into Tom's existing CAP project.
But this is probably nothing new to you.

## Extend the list report page

Here, you can see a standard list report app that displays a few columns of the service that Tom created. Let's modify this app a bit to make it easier to use and change the default configuration to load all entries initially. This saves the user from having to hit the "go" button. Then, let's make the report a little bit more colorful; I'll add the "Nationality" field to this service and add a new column for this field. But it'd be boring to display each Nationality's name, so let's use a custom formatter to display the respective country's flag here.

For this, I need to add a new fragment ….. Next, I'll add the formatter file …. And eventually, I reference the fragment in the manifest as well.

## Explore the SAP Fiori elements Flexible Programming Model Explorer

If you need some inspiration about all the options you got to extend the Fiori Elements floorplans, check out the explorer here. This is a cool new web app that contains live samples that you can modify!

This section here, for example, shows you know to add new sections to object pages. And here's the link to the documentation that explains how you can build all of this in your project.


## Extend the object page

But, there's also a remarkable feature in the SAP Fiori tools that do all of that for you. To use it, you just need to open the Page Map, click on the details section, hit the plus to add a new fragment and tadaaaa. There you go. It creates you a JS file and a fragment file that you can then adapt to your needs. For now, let's just trigger a message toast when the user hits the button.

## Closing

And with just these few minor and quick modifications, we build a beautiful UI for our business users with little to no effort. I'm sure that I'll win with this or have you ever developed such a powerful web app in less than 4 minutes? 



Optional: Add Google Maps or Wikipedia via html embedding here.
