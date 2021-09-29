For me as a native iOS Developer, I am always excited about the release of new features and technologies.
Working mainly on business apps I try to incorporate new ideas into my projects. I’ve found this amazing Open Source framework by SAP which provides an easy to use API to build business AR experiences.

<img width="3008" alt="Repo" src="https://user-images.githubusercontent.com/9074514/135086394-0394f895-8b6d-48b0-8e2e-622717cce495.png">

This package can be used via the Swift Package Manager within my Xcode project so I can access the APIs super easy and fast.
Before I get started implementing my AR logic I need to create a Reality Scene using the Reality Composer app provided by Apple.

I have already prepared this:

<img width="2520" alt="RealityComposer" src="https://user-images.githubusercontent.com/9074514/135086384-efa8f6de-ec75-4077-bbe4-8c66940a5802.png">

You can see I’ve set an Image Anchor as the AR anchor and placed these spheres around the Image Anchor which will later appear on the screen as little nodes for me to display so called AR Cards following the SAP Fiori for iOS Design Guidelines.
The rcproject file can be imported into my Xcode project and from there used to create the AR experience.

In my Xcode project I’ve already added the Anchor Image as an asset as well as imported the rcproject file.
The Swift Package dependencies are also added by providing the GitHub repository URL to the Swift Package Manager. As I want to use a broader set of APIs, I’ve added the FioriSwiftUI package which is an umbrella Swift package including the SAP Fiori for iOS ARKit APIs.

<img width="1504" alt="XCodeProject" src="https://user-images.githubusercontent.com/9074514/135086405-315b5746-29e2-412a-b1ae-08aa03385c24.png">

The project is setup and the AR Cards need some models representing the data being displayed later on, also some Mock data would be nice to get a fast result.

I have created a struct with the name StringIdentifyingCardItem to serve as my model for my AR Cards. The name results out of the ID being a String to make easier comparisons later when displaying different cards onto the screen.

<img width="910" alt="StringIdentifyingCardItem" src="https://user-images.githubusercontent.com/9074514/135086401-9a5a4784-9b09-49b9-a4eb-f285ba3cabf7.png">

With the model available, some Mock data would be nice to test the ARCards at a later point. I create a new Swift file and call it TechEdInfo. The Swift file I implement as an Enum containing a static array of the previously created StringIdentifyingCardItems.

I am doing the programmatic approach but you could also provide the models as JSON if you wish to.

<img width="1171" alt="MockData" src="https://user-images.githubusercontent.com/9074514/135086380-17ca4fa8-5e72-42c5-8c52-67c790b4cc47.png">

The SAP Fiori for iOS ARKit package contains a predefined Card View for us to use but I want to make a custom implementation of this card to make each of the cards individual. To do so the API gives us different ways of implementing Card Views. First of all, all Card Views are SwiftUI based, this allows me to use a View Builder approach to define my AR Cards in an easy manner and provide maximum flexibility.

In the CardViews group I create 3 different Card Views, the: WelcomeCardView, ProfileCardView and the ScheduleCardView.

All of these Card Views are generic so they can receive my created CardItemModels. This is not really necessary for what I am doing here but allows me to pass in whatever model I want to in case I want to change the data being displayed.

The WelcomeCard is pretty easy, a background image with a link pointing to the TechEd website as well as some text welcoming the user.

<img width="1171" alt="WelcomeCardView" src="https://user-images.githubusercontent.com/9074514/135086402-2aa45f2b-7f01-45d4-8df0-36c4167cd9b0.png">

The Profile Card View is there to show the users profile image as well as having a link at hand to directly jump to the SAP Community website.

<img width="1171" alt="ProfileCardView" src="https://user-images.githubusercontent.com/9074514/135086382-d6c42b74-44f7-4f9a-aa31-f64680e01c90.png">

And lastly the Schedule Card View which allows me to show the upcoming session for which the user has signed up to. It also displays a timer on when the session will start.

<img width="1176" alt="ScheduleCardView" src="https://user-images.githubusercontent.com/9074514/135086398-392a8e69-e279-497c-b40f-37e9c78f6f5d.png">

Having the model setup, the mock data provided and the Card Views defined, the next step is to tell the ContentView what to display and where to find the Reality Scene for Apple ARKit.

Defining a State Object and initialising the ARAnnotationViewModel, which is our StringIdentifyingCardItem, allows the View to have a binding to the model itself so it gets notified when the model changes.

In the body of the View I initialise a SingleImageARCardView where as the Card Label the different Card Views get displayed. Here we are using the String ID to create a Switch in order to distinct the needed Card View.
Providing the Card Model to the views allows them to display the correct data and behave as we intended to.

A method for the loading the initial data including the Reality Scene helps us to provide all the needed information to the Model and the Card Views.

This Method will be called in the onAppear operator of the View itself.

<img width="1171" alt="ContentView" src="https://user-images.githubusercontent.com/9074514/135086374-f5efe2a4-3dfb-410c-9d42-5a67c19ee65b.png">

The SAP Fiori for iOS ARKit package provides different loading strategies for providing the reality scene to ARKit. In my case I am using the RCProjectStrategy as this represents the file I have created with Reality Composer. The RCProject has the Reality Scene in its belly and we can simply extract this during runtime.

Lastly, I just need to tell the AppDelegate to display the Content View and do some necessary file loading with the help of the FileManager. I’ve written a simple utils class to extend the FileManager to load the RCProject file, extract the reality scene from it and save that to the file system in order for the ContentView to load the scene.

<img width="1171" alt="AppDelegate" src="https://user-images.githubusercontent.com/9074514/135086365-77ff3399-b9ff-435e-82cd-c19cf8d002c1.png">

And voila with that we can scan our Anchor Image and display the different AR Card Views.

![App](https://user-images.githubusercontent.com/9074514/135087180-3a8d66cb-c93a-4f71-b02e-daeb2414e017.jpeg)
