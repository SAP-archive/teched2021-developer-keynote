# Introduction

Making Developers' Lives Better

Highlight SAP technologies with a clear focus on features that accelerate the development process, improve the developer experience and increases developer productivity and efficiency when developing end to end solutions or extending existing applications.  
* Several aspects of application development will be represented including:  AI/ML,  ABAP, CAP, Data & Analytics, Low-Code/No-Code.

Deliver this message in a fun and weird way that attempts to grab hold of the viewer’s attention.
* We will parody the concept of “Big Brother”.  This is a globally-known popular reality television show where strangers are brought into a house to live together without any external stimulus.  Confessionals/diary scences will be mechanism for tech topic delivery.  Opening should probably parody Big Brother opening.
* 12 Developers put in a house with no outside access (no Google search) and asked to work together to develop SAP BTP based application

# Open Questions


# Key Players

| Name | Role | Topic Focus | Demo Description | Demo Script | Demo Video |
| --- | ----------- | ----------- | ----------- | ----------- | ----------- |
| TBD | Narrator | | |
| Mamikee | Host | | |
| DJ(Professorial) | House Guest | CLIs for BTP, SAP Graph, etc | With command line tools from SAP I get to operate in the most powerful and flexible environment - the shell. I can build simple tools to script and automate, and have zero friction between me and what I'm using. SAP's cloud-first approach means all the services I'm using and platforms I'm building on are is there directly at my fingertips via the native environment of cloud - the command line. There's CLI tools for SAP Business Technology Platform, SAP Graph, CAP and more. Show some useful features of the btp CLI in the 4 min slot.| [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/CLI_power/)| [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/dja-cli-power.mp4?csf=1&web=1&e=VJIhjB)|
| Josh(Attention Loving) | House Guest | CI/CD and other platform / runtime facilities (e.g. Piper)? | A showcase of CI/CD on BTP (possibly Piper Blue Ocean).  Setup in the BTP cockpit of a user needing to make an application change.  Show how app is running and connected to Kyma.  Kyma would signal CI/CD when a new push of an application change is made by a developer.  Show the visualization of a failure and a success if there is time in the 4 minutes. | [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/kyma_CI-CD) | [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/josh_kyma_devloper_keynote_with_audio.mp4?csf=1&web=1&e=v8DLd2) |
| Kevin(Excitable and Passionate) | House Guest  | iOS/ARKit | A simple ARKit application displaying the new SAP Fiori for iOS ARAnnotation Cards. Show the benefit of using the SAP ARKit package as no 3D modelling is needed to get an AR experience, AR controls are provided by SAP in an Open Source manner through Swift Packages. The API is easy to consume and an AR experience can be achieved with ease.  | [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/FioriARKitDemo/FioriARKit_Demo.md) | [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/DevKeynote_TechEd2021_ARKit.mp4?csf=1&web=1&e=O6dOGW)|
| Katharina(Stoic) | House Guest  | AI/ML | Will showcase how easy it is to get started with the AI Business Services ( DAR, STI, BER ). Show the setup of one of the AI Business Service by using booster and starting with a free plan ( afterwards I'll switch to standard plan). Furthermore I want to show the new AI API and its SDK (new standard API for the AI Capabilities) and will demo of how to use it and how easy you can train a model and do inferences. Today all our AI Business Services have different APIs which makes it not easy to consume, this will change with the new AI API. | [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/FirstStepsAI.md)| [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/dev_keynote_ai_draft.mp4?csf=1&web=1&e=DbtaBq) |
| Marius(Quiet) | House Guest  | UI5 | Let's have a closer look at the recently released [flexible programming model to extend your SAP Fiori elements apps for OData V4](https://blogs.sap.com/2021/08/19/leverage-the-flexible-programming-model-to-extend-your-sap-fiori-elements-apps-for-odata-v4/). My part shall explain the concept behind this model, where to find runnable samples in the [Flexible Programming Model Explorer](https://sapui5.hana.ondemand.com/test-resources/sap/fe/core/fpmExplorer/index.html#/overview/introduction) and include a small demo in which the mentioned is applied to a CAP app (possibly the one created by another house guest).| [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/extendingFioriElements.md)| [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/FioriElementsDeveloperKeynote_draft.mp4?csf=1&web=1&e=8iVSdN)|
| Michelle(Lazy) | House Guest  | UI Technologies | This is the idea I think might be the best to do. It seems more applicable to disciplines and areas outside of just frontend technologies and could reach a larger audience.<ul><li><a href="https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks">Git Commit hooks combined with formatters/linters/import organizers take away a lot of the need for frontend devs to have to run commands on files they use or set up commands to run on save (which can cause other issues). This can be set up on a repo by repo basis</a></li><li><a href="https://docs.volta.sh/guide/">Volta as a way to manage node versions across repos</a></li></ul>This is still a good candidate for another short video.<ul><li><a href="https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens">GitLens extension on VS Code</a></li><li><a href="https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens">Version Lens on VS Code</a></li><li><a href="https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare">Live Share on VS Code for pair programming</a></li><li><a href="https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker">Code Spell Checker on VS Code</a></li><li><a href="https://www.software.com/src/how-to-create-an-extension-pack-for-visual-studio-code">Extension Packs for VS Code in order to give new devs all the helpful extensions on a fresh install of VS code, or to maintain a team wide best practice pack of extensions</a></li></ul>This could also be a candidate for another video but seems less useful for the effort.<ul><li><a href="https://github.tools.sap/ux-consistency/UXCT/wiki">UX Consistency Chrome Extension</a></li></ul>| [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/Git_Commit_Hooks.md)| |
| Rich(Annoyed, Short Fuse) | House Guest | ABAP | Will showcase "Embedded Steampunk".  Show how you can create a BAdI implementation for Purchase Req checks in an S/4HANA Cloud system. | [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/eSteampunk.md) | [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/Developer%20Keynote%20-%20ABAP%20eSteampunk%20BAdI%20-%20Rough%20Demo.mp4?csf=1&web=1&e=7i76HV)|
| Thomas Jung(Doesnt know how to say no)| House Guest  | CAP | One of the following </br> <ul><li>everything is an event, central nervous system connecting sync and async services. Makes my life super easy as I don't have to switch mental contexts or protocols. </li><li>How easy it is to consume a service in CAP. Import the service defintion, generate the proxy, even mock the service with local CSV files </li></ul> | [Script](drafts/CAP_Service_Call_Script.md) | [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/dev_keynote_cap_draft.mp4?csf=1&web=1&e=ZlWk1S) |
| Vitaliy(Dry sence of humor) | House Guest | Data & Anayltics | Ideas:<ul> <li>Data federation (with "big data" in the data lake or an external object store) </li><li>~~Analytics capabilities in the app using SAP BTP, SAC Embedded~~</li><li>~~Predictive on apps data stored in HANA using hana_ml~~ </ul><p> Using GDELT dataset to find and analyse some interesting events| [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/HANACloud.md) | [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/DevKeynote_SAPHANACloudDataLakeFiles_roughdemo.mp4?csf=1&web=1&e=XCEhqG) |
| Thomas Jung(Reaplacing Grassl) | House Guest | Low-Code/No-Code Appgyver | So easy even a manager can use the Low-Code/No Code. Persona wears a tie and carries around a clip board. Shows the new Developer Launch Portal in the BTP Cockipt.  Start in AppGyver to "prototype" the app.  Then using the Launch Portal, switches the project from No Code AppGyver to Low Code in Business Application Studio. Uses the Low code wizards and graphical editors to finish the project (but also could show how you can still get into the coding level as well.| [Script](https://github.com/SAP-samples/teched2021-developer-keynote/blob/main/drafts/Low_No_Code.md) | [Video](https://sap.sharepoint.com/:v:/r/sites/100499/advocates/Shared%20Documents/203-Projects/TechEd%202021/Keynote%20Videos/Rough%20Draft/TechEd_Developer_Keynote_low_no_code_draft.mp4?csf=1&web=1&e=AiKvSi) |

# Script Draft
  
Opening - Mamikee outside of the TechEdhouse opening the show.  Set the mission of the house. Why are we altogether.  We brought these developers together in the TechEdhouse to see how they can make developers lives' better by introducing new tools and techniques to each other and the audience.  Short description of what happened previously?  Now its time for another check in on all the developers as they influence each other by showcasing their demos.   From ABAP to iOS development, the developers will cover a lot of different topics.   I remember when <name> and <name> got in an arguement about <topic1>, now lets show you really want <name> was trying to explain. 
  
1) Throw to DJ demo.  Before leaving confessional, DJ says, gotta go cook dinner for these folks since no one else will do it.  On his way out Vitaliy comes in. 
  
2) Throw to Vitaliy demo.  Starts by saying,  finally DJ is out of here I can show you my demo. Now done with demo,  goes to pantry to see if the beer is restocked, where Michele is just grabbing the last beer and walking out.  Vitaji stares as the last beer walks away. Cut to michele to confession, cracking the beer.
  
3) Throw to Micheles demo.   Sits down and says.. "you gotta be quicker than that", and smiles to the camera.  Starts demo.  Finishes, stands up and says guess I'll go take a nap till dinner is ready. Goes to the bedroom, turns on the light.  Wakes up Kevin in the process. Kevin says, well so much for my nap, leaves to confession.

Cut back to Vitaliy still standing in pantry not finding any more beer.   
  
4) Throw to Kevin demo.  Kevin comes in to confession, groggy and a little annoyed. Goes into his demo.  Leaves confessional and heads gym, where rich is just getting off treadmill,  Kevin says,  oh so someone else can use the treadmill now??  Thanks dude.  Rich says,  well I had to get my 10k in today.
  
5) Throw to Rich demo.   Rich says, can you believe that guy,  I've seen him on the treadmill like twice since we've been here.  Rich goes into demo.  Guess I'll head to the shower before dinner.  Quick life hack.  Grab your own towel cuz no one does any laundry. Passes josh in the hallway, says "so I guess the sink is blue again?".  Cut to shot of Rich at sink which is stained blue. 
  
6) Throw to Josh demo.  Josh sits down and says... They hate me because I'm beautiful. Goes into demo.  Josh goes to the lounge area to show off his newly died beard and is talking loudly which is annoying Marius who is currectly playing a game of chess with Thomas J in the lounge.  Josh says loudly, "if your not busy Tom, could you sweep up the hair someone left on the bathroom floor?  Thomas J stops playing chess with Marius and says sure, I'll take care of it. 
  
Cut back to Vitaliy still looking for beer in the pantry. Arms folded staring. 
 
7) Throw to Tom demo.  Tom enters confessional with a broom and dust pan, a litle annoyed, says " i need to learn how to say no". Goes into demo.  Finishes demo and grabs broom and dust pan and says.  I guess I'll go sweep up before dinner.  Passes marius and says... you wanna finish that game of chess?  Marius says, I can't take anymore of Josh's loud mouth, I need some peace.   
  
8) Throw to  Marius demo.  Says,  so I had to come in here to get some peace and quiet.  That guy talks way too much. Goes into demo.  Marius comes out of the confession as katharina approaches, he asks Katharina if she has seen the loud guy with the blue beard.  She says no, he says ok good, I'll go setup the table for dinner. 
  
9) Throw to Katharinas demo.   "I don't know what his problem is with Josh, he knew he was coming into a house with 9 other developers".   Goes into demo.  Walks passed the laundry area, where she sees Thomas J folding his laundry.  Says to him,  you know, my stuff needs folded too if you have time.  Tom says... well its almost dinner time, but sure I'll take care of it, make sure they leave some dinner for me.  She then goes to the dining area, says,  "hey make sure they save some dinner for other Thomas".  Thomas G shrugs and says "ok".  Katharina continues off set. 

10) Throw to Thomas Grassl demo.  Thomas G sitting in the dining area alone, waiting for dinner time, looking at his watch. the table set, no one is there. Show Grassl as shrugging off annoyance.  Sighs and says.. ok well guess I'll just go with a power bar(as he pulls one from his shirt pocket).  heads to confessional.   Does demo.  Finishes demo, and says... "maybe I'll go see if dinner is ready now"..  sighs and says...  no code, no worries. 
  
Cut back to Vitaliy still looking for beer.

Cut back "outside of house" and Mamikee says.. "This is a good time to recap.... yada yada yada"
  
 
# Cut Scenes

DJ constantly tweaking food, complains when others try and help, and returns items to pantry., chefs hat, towel over shoulder.
  
Tom J constantly cleaning and doing laundry making bed, sweeping. Cleaning blue sink.
  
Rich always on treadmill or working out
  
Michele
  
Katharina
  
Marius
  
Josh looking in the mirror, combing your beard
  
Thomas G relaxing back in chairs and sofa, shrugs at stuff, sunglasses
  
Kevin throwing stuff in air or knocking stuff over that’s in his way
  
Vitaliy constantly looking for beer

