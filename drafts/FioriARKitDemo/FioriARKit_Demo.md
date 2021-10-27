The SAP Fiori for iOS ARKit Open Source project lets me use a Swift Package which can be used via the Swift Package Manager within my Xcode project so I can access the APIs super easy and fast.

<img width="3008" alt="Repo" src="https://user-images.githubusercontent.com/9074514/135086394-0394f895-8b6d-48b0-8e2e-622717cce495.png">

Before I get started implementing my AR logic I need to create a Reality Scene using the Reality Composer app provided by Apple.

<img width="2520" alt="RealityComposer" src="https://user-images.githubusercontent.com/9074514/135086384-efa8f6de-ec75-4077-bbe4-8c66940a5802.png">

I have already prepared this and you can see I’ve set an Image as the AR anchor and placed three spheres around the image. These spheres will appear on the screen as little nodes where the User can display so called AR Cards by tapping on them. The cards are provided by the SAP Fiori for iOS ARKit package and they follow the SAP Fiori for iOS Design Guidelines. 

Using the provided Model protocol **CardItemModel**, it is easy to create the needed struct providing a model to my ARCards.

<img width="910" alt="StringIdentifyingCardItem" src="https://user-images.githubusercontent.com/9074514/135086401-9a5a4784-9b09-49b9-a4eb-f285ba3cabf7.png">

Now, I want to define what the cards will look like. The provided API allows me to use a predefined Card View, but for this project I want to create my own SwiftUI Views. Fortunately I can use the SwiftUI ViewBuilder approach to define my Card Views super easy as the SAP Fiori for iOS ARKit APIs support this approach.

The ContentView is the perfect place to define the AR Model as well as the logic for providing the different Card Views depending on the users request. This can be done in the body of the ContentView via the SingleImageARCardView and the distinction of the needed card by its ID.

Through the constructor of the SingleImageARCardView it is possible to provide the AR Model as well as the Anchor Image to the Custom Card Views. On appearance of the view, I load the initial Data.

The initial Data is the defined mock data, the anchor image and most importantly the loading strategy of the AR Experience.

The SAP Fiori for iOS ARKit provides me with different strategies depending on what I need. Because I am using an RCProject, I will instantiate the RCProjectStrategy and provide the Mock Data, Anchor Image and the file information to it.

In the end I simply tell the AR Model to use my defined loading Strategy and the SAP Fiori for iOS ARKit does the rest for me!

<img width="1171" alt="ContentView" src="https://user-images.githubusercontent.com/9074514/135086374-f5efe2a4-3dfb-410c-9d42-5a67c19ee65b.png">

Scanning the Anchor Image in Real Life will cause the API to display the defined nodes as well as the corresponding Cards in Augmented Reality. The SAP Fiori for iOS SDK ARKit API gives me interaction with the nodes out of the box and highlights the respective card automatically. Tapping on one of the cards opens up the SAP TechEd Website. Of course all sort of different actions are possible to implement. Imagination is the limit.

![App](https://user-images.githubusercontent.com/9074514/135087180-3a8d66cb-c93a-4f71-b02e-daeb2414e017.jpeg)
