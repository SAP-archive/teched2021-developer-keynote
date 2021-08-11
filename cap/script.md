# SAP Cloud Application Programming Model 

> Open on Houseguest full screen in the Diary Room

The thing about the Cloud Application Programming Model that my housemates just don't get, is that they only know it as a tool to create services or model data.  What they don't realize is that it has some great functionality to also make it easy to consume services and create service mashups and extensions too. So my task in the house this week was to extend a SuccessFactors Employee Central Personnel API with some new fields. And thanks to CAP, what might have taken me days of coding only took minutes.

> Transition to demo in the main screen and Diary Room with Houseguest in small window in corner. 

To begin, I can go to the SAP API Business Hub, find the SuccessFactors API I need as my starting point and download the EDMX specification file into a new, empty CAP project.

> [SAP SuccessFactors Employee Central Personal Information](https://api.sap.com/api/ECPersonalInformation/overview)

From the command line I can use the CAP CLI to import that external service definition into my project. This converts the specificaition into CSN (Season) or Schema Notation and adjusts my project's package.json with technical configuration to connect to the service.  Heck it allows me to mock the service locally while I develop. 

> cds import .\ECPersonalInformation.edmx
>
> show the [package.json](./package.json) and then test run with the mocking (npm start)

Like most of the APIs you are going to find, they contain a lot of fields. Afterall they have to cover every usage situation. But CAP has this cool mechanims to extend a service and then mashup an existing entity. I'm going to take this entity from the external service and cut it down to just the 5 fields I want and in doing so also change the names of the fields. 

> show [external.cds](./srv/external.cds)

We can then expose this remote service as our own with the reduced fields and even add a new, Middle Name, field that we will persist separately as part of our extension. 

> show [cat-service.cds](./srv/cat-service.cds)

Becuase this is a mashup of external and extended service, the generic service framework can't just serve it out; but with CAP extension handlers and the embedded SAP Cloud SDK; we can make all of that happen in just a few lines of code.

> show [cat-service.js](./srv/cat-service.js)

When someone requests our new mashup/extended service will first will forward that request to the SuccessFactors API.  CAP will take care of translation between OData V2 and V4, the renamed columns; heck it even makes calling the service as easy as writing a SELECT statement and forwarding all the request query parameters right into the remove service.

Then after we have all the remote data we need, we can use a nice parallel operation to lookup the locally persisted Middel Name data to enhance the service. 

To the system calling our extended service they never know that we forwarded their request to a remote SuccessFactors system, or that it is actually OData V2 based or that we reduced the service, renamed the columns or added some of our own extended data to it.  All they see is the final service with all the data they want and need in one place.

> test new mashup service

