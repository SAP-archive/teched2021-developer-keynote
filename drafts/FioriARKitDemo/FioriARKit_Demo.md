For me as a native iOS Developer, I am always excited about the release of new features and technologies.
Working mainly on business apps I try to incorporate new ideas into my projects. I’ve found this amazing Open Source framework by SAP which provides an easy to use API to build business AR experiences.

<img width="3008" alt="Repo" src="https://user-images.githubusercontent.com/9074514/135086394-0394f895-8b6d-48b0-8e2e-622717cce495.png">

The SAP Fiori for iOS ARKit Open Source project lets me use a Swift Package which can be used via the Swift Package Manager within my Xcode project so I can access the APIs super easy and fast.

Before I get started implementing my AR logic I need to create a Reality Scene using the Reality Composer app provided by Apple.

<img width="2520" alt="RealityComposer" src="https://user-images.githubusercontent.com/9074514/135086384-efa8f6de-ec75-4077-bbe4-8c66940a5802.png">

I have already prepared this and you can see I’ve set an Image Anchor as the AR anchor and placed these spheres around the Image Anchor which will later appear on the screen as little nodes for me to display so called AR Cards provided by the SAP Fiori for iOS ARKit package following the SAP Fiori for iOS Design Guidelines. 

Using the provided Model protocol CardItemModel it is easy to create the needed struct to provide a model to my ARCards.

<img width="910" alt="StringIdentifyingCardItem" src="https://user-images.githubusercontent.com/9074514/135086401-9a5a4784-9b09-49b9-a4eb-f285ba3cabf7.png">

Now I want to define what the cards will look like. The provided API allows me to use a predefined Card View, but for this project I want to provide my own Views. Fortunately I can use the SwiftUI ViewBuilder approach to define my Card Views super easy.

Using the ContentView I will define the AR Model as well as the logic for providing the different Card Views depending on which of them the user requests. This can be done in the body of the ContentView via the SingleImageARCardView and the distinction of the needed card by ID.

Through the constructor of the SingleImageARCardView I can provide the AR Model as well as the  Anchor Image to my Custom Card Views and on appearance of the view, load the initial Data.

The initial Data is our mock data, the anchor image and most importantly the loading strategy of the AR Experience.

The SAP Fiori for iOS ARKit provides us with different strategies depending on our needs. Because I am using a RCProject I will instantiate the RCProjectStrategy and provide the Mock Data, Anchor Image and the file information to it. 

In the end I simply tell the AR Model to use my defined loading Strategy and we’re done!

<img width="1171" alt="ContentView" src="https://user-images.githubusercontent.com/9074514/135086374-f5efe2a4-3dfb-410c-9d42-5a67c19ee65b.png">

Scanning the Anchor Image in Real Life will cause the API to display the defined nodes as well as the corresponding Cards in Augmented Reality. The SAP Fiori for iOS SDK ARKit API gives me interaction with the nodes out of the box and highlights the respective card. Tapping on one of the cards opens up the SAP TechEd Website.

You can see it is real easy to implement an AR experience with SAP.

![App](https://user-images.githubusercontent.com/9074514/135087180-3a8d66cb-c93a-4f71-b02e-daeb2414e017.jpeg)
