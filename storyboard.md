# Introduction

Making Developers' Lives Better

Highlight SAP technologies with a clear focus on features that accelerate the development process, improve the developer experience and increases developer productivity and efficiency when developing end to end solutions or extending existing applications.  
* Several aspects of application development will be represented including:  AI/ML,  ABAP, CAP, Data & Analytics, Low-Code/No-Code.

Deliver this message in a fun and weird way that attempts to grab hold of the viewer’s attention.
* We will parody the concept of “Big Brother”.  This is a globally-known popular reality television show where strangers are brought into a house to live together without any external stimulus.  Confessionals/diary scences will be mechanism for tech topic delivery.  Opening should probably parody Big Brother opening.
* 12 Developers put in a house with no outside access (no Google search) and asked to work together to develop SAP BTP based application

# Open Questions


# Key Players

| Name | Role | Topic Focus | Demo Description |
| --- | ----------- | ----------- | ----------- |
| TBD | Narrator | | |
| TBD | Host | | |
| DJ | House Guest | CLIs for BTP, SAP Graph, etc | With command line tools from SAP I get to operate in the most powerful and flexible environment - the shell. I can build simple tools to script and automate, and have zero friction between me and what I'm using. SAP's cloud-first approach means all the services I'm using and platforms I'm building on are is there directly at my fingertips via the native environment of cloud - the command line. There's CLI tools for SAP Business Technology Platform, SAP Graph, CAP and more. In addition, show the Cloud Foundry and K8s CLI tools, and do it all in the Business Application Studio terminal.|
| Josh | House Guest | CI/CD and other platform / runtime facilities (e.g. Piper)? | A showcase of CI/CD on BTP (possibly Piper Blue Ocean).  Setup in the BTP cockpit of a user needing to make an application change.  Show how app is running and connected to Kyma.  Kyma would signal CI/CD when a new push of an application change is made by a developer.  Show the visualization of a failure and a success if there is time in the 4 minutes. |
| Kevin | House Guest  | iOS/ARKit | A simple ARKit application displaying the new SAP Fiori for iOS ARAnnotation Cards. The scenario could be using facial recognization to identify a Big Brother House Guest and displaying an AR Data Sheet of that person. The data is in an HANA Cloud DB exposed over a CAP Service and consumed over SAP BTP Mobile Services via the iOS iPad app. A House Guest could say "Who is this new House Guest?" And I pull up my fancy iPad showing the Data Sheet. |
| Katharina | House Guest  | AI/ML | |
| Marius | House Guest  | UI5 | The main thing I want to show is that the managed approuter (i.e. developers don't need to host the approuter themselves) can now be used for multi-tenant apps. This is a long-awaited feature that I often see questions about, and it makes developer's lives easier as they won't need to host an approuter any longer (and it won't have a TCO footprint). <br /> For the show, I could imagine one of these scenarios:<br /> <ul> <li>Someone asks impatiently for the managed approuter, and someone says, "Oh, don't you know? It's available now! Let me show you..."<li>Someone is excited that the managed approuter is available but complains that this requires some ugly boilerplate code in the mta.yaml. Another house guest could then show how to add this code easily with the SAP Business Application Studio.<li/><ul/>Optional: Try to make all of this run on Kyma once Hana Cloud becomes natively available there. |
| Michelle | House Guest  | UI Technologies | Just a short list of things I found recently. Likely could be greatly expanded.<br /><ul><li><a href="https://github.tools.sap/ux-consistency/UXCT/wiki">UX Consistency Chrome Extension</a></li><li><a href="https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks">Git Commit hooks combined with formatters/linters/import organizers take away a lot of the need for frontend devs to have to run commands on files they use or set up commands to run on save (which can cause other issues). This can be set up on a repo by repo basis</a></li><li><a href="https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens">GitLens extension on VS Code</a></li><li><a href="https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens">Version Lens on VS Code</a></li><li><a href="https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare">Live Share on VS Code for pair programming</a></li><li><a href="https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker">Code Spell Checker on VS Code</a></li><li><a href="https://www.software.com/src/how-to-create-an-extension-pack-for-visual-studio-code">Extension Packs for VS Code in order to give new devs all the helpful extensions on a fresh install of VS code, or to maintain a team wide best practice pack of extensions</a></li><li><a href="https://docs.volta.sh/guide/">Volta as a way to manage node versions across repos</a></li></ul>If this is the route we want to go, it can also be extended to other IDEs/browser frontend devs use (for example, Atom or Firefox). |
| Rich | House Guest | ABAP | Will showcase "Embedded Steampunk".  First show how to access S4/HANA data from steampunk using the side-car approach.  Then show how to access the same data with a simple SELECT statement leveraging "Embedded Steampunk" within the S4/HANA system |
| Thomas Jung | House Guest  | CAP | One of the following </br> <ul><li>everything is an event, central nervous system connecting sync and async services. Makes my life super easy as I don't have to switch mental contexts or protocols. </li><li>How easy it is to consume a service in CAP. Import the service defintion, generate the proxy, even mock the service with local CSV files </li></ul> |
| Vitaliy | House Guest | Data & Anayltics | Ideas:<ul> <li>Data federation (with "big data" in the data lake or an external object store, </li><li> Analytics capabilities in the app using SAP BTP, SAC Embedded, </li><li> Predictive on apps data stored in HANA using hana_ml |
| Thomas Grassl/Thomas Jung | House Guest | Low-Code/No-Code Appgyver | So easy even a manager can use the Low-Code/No Code. Persona wears a tie and carries around a clip board. Shows the new Developer Launch Portal in the BTP Cockipt.  Start in AppGyver to "prototype" the app.  Then using the Launch Portal, switches the project from No Code AppGyver to Low Code in Business Application Studio. Uses the Low code wizards and graphical editors to finish the project (but also could show how you can still get into the coding level as well.|

# Script Draft

# Big Brother Research

* No phones, no internet, no comms to outside world. (can we play on this aspects - like how can developers possibly code without access to Google Search?)  (<-- use the built-in `man` pages on the command line, obvs ;-))
* 16 House Guests(HG)
* 94 Cameras
* 100 ish mics
* Host on stage outside of house, once HGs are in the house, seems like the host stays out and only interacts over voice over.
* Narrator
* House Guests play for cash prize
* Transistions from shot to shot seem to be a lot of "flash" or "starburst"

Show Flow S23E01 - Watch [here!](https://www.cbs.com/shows/big_brother/video/Lz8gWBWdDN83XFX9Xm_A7d0tT_iBPPqp/big-brother-episode-1/)
* First 4 men finds keys to the house during some personal activity at home.  This is followed by a short bio.  Then the first 4 men are shown 
standing on the stage outside of the house with the host with some short chatting as they enter the house. Once inside the house, they are told
to go to the "Backyard" for the first challenge.  During this time, each guest breaks off to a short confessional style shot where they are talking
about their stradegy.  Once in the backyard they are presented with a challenge, and the winner becomes elidgable to compete to become head of household(HOH).
This process is repeated another 3 times, with the first 4 woomen, then the second set of 4 men, and the second set of 4 women.  The winners of the 4 seperate
are now reveiled to be the team captians, 4 teams of 4.  As cards and/or casino games seem to be a theme here, the teams are named for card suites,  Jokers, Aces,
Kings, and Queens.  Each captain now drafts his/her team members based on the BB slot machine which offers two choices to the captains. Now that the teams are set,
the HOH compedition takes place where the winner and his team are awarded ammunity from eviction for that week. Last place becomes the "have-nots" where they are 
punished with cold showers, lame food, lame rooms, etc.

* This year is different (higher prize of $750k instead of $500k last 22 years). ALso the 4 member teams is a new twist.  It will only last until people voted off make the other teams so small they have to consolidate.  Producers do stuff like this to cause inter-team spying and alliances that may or may not last.  Anyway, a new twist but that is what keeps people interested year after year.  

* Some things to think about when watching a clique of like minded people form is how can we poke fun at developers or code in a way that a group of houseguest would poke fun at one another.  We can't cross a line but we can say someone is on team ABAP and they always leave the seat up in the bathroom or don't lock the door to the bathroom, cause they aren't focused on security...  Team Kyma could always be looking to gather support or intel to win a competition because they beliieve in being open and having community involement.  Another code group or indivdual like Appgyver/low code is claiming the kitchen as their space cause they have the best recipes to make meals following simple step by step templates and meals that could be put in a box and mailed to a non-chef.  


Show Flow S23E02 - Watch [here!](https://www.cbs.com/shows/big_brother/video/eqdH0tKoFGhrwTwEtHnkS1_fJx_ngdJI/big-brother-episode-2/)

* First scene shows all 16 exploring the house and engaging with each other. Random confessionals(diary room) shots mixed in.  Everyone sits down on couch and they do a round robin, who they are where they are from, etc.  At one point,  HOH talks directly to one of the “Hidden” cameras(this is not part of a confessional).  Have-nots are shown their bedroom, beds are  trailer, jetski, etc.  Shown that they will eat BB slop for the week.  Various scenes of HOH talking with the house guests in small groups or one-on-one, promising them that they are safe form eviction this week.  HOH sits down with one of the men that he wants to put up with eviction and has a heart to heart with him.  After talking with him, HOH changes his mind about putting him up for eviction.   HOH explains the wildcard competition.  Each week 3 teams(HOH team is safe) elect one person to compete.   Winner can guarantee safety for him/her.   Teams start to discuss who will compete, confessionals breaking in at times as well.  House guests regroup and the players are announced.  Players have to search a trashed room for keys, wallet, and phone in shortest amount of time.   Players are dressed in 80s club gear?  They have to be quiet, and are penalized points if too loud. Breaks to confessional while player is shown doing the task.   Back to the group where HOH goes over the scoring and timing. Winner is announced.  Winner now spins a wheel to determine how many of his/her team is safe this week.  Winner picks which member of his team will be safe.  HOH primary target for eviction is now safe, and HOH doesn’t know what to do with his nominations now. Shown wondering around the house.  HOH sits down with various house guests and asked if anyone has been approach about an alliance.  Next, is the nomination ceremony, group comes together around a table.  HOH nominates 2 guests for eviction.  
