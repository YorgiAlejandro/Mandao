##Mandao App

#Mandao App is a food delivery application designed to make it easy for users to find and order food from various restaurants in different provinces. The app allows users to select their location and view personalized offers, banners, restaurant categories, and a complete list of available businesses in their area.

Features

Province Selection: Users can select their province to view offers and services specific to their area.
Banners View: Displays promotions and highlighted offers in the app.
Restaurant Categories: Allows users to explore different types of food and restaurant categories.
Business List: Provides a detailed list of restaurants and businesses available in the selected province, along with their ratings and other relevant information.
Technologies Used

SwiftUI: For designing the user interface.
Alamofire: For network requests and API handling.
MVVM (Model-View-ViewModel): Architecture used to separate responsibilities and facilitate scalability and maintainability of the code.
CocoaPods: For dependency management.
Project Structure

The project is structured as follows:

sql
Copy code
MandaoApp/
├── Model/
│   ├── City.swift
│   ├── Banner.swift
│   ├── Category.swift
│   ├── Store.swift
│   └── AppState.swift
├── ViewModel/
│   ├── CityViewModel.swift
│   ├── BannerViewModel.swift
│   ├── CategoryViewModel.swift
│   ├── StoreViewModel.swift
├── View/
│   ├── LoginView.swift
│   ├── TopBarView.swift
│   ├── BannerListView.swift
│   ├── CategoryListView.swift
│   ├── BusinessListView.swift
│   ├── StoreCard.swift
│   └── HomeView.swift
├── Assets/
│   └── Images/
└── MandaoApp.swift
Installation

To run this project locally, follow these steps:

Clone the repository:

bash
Copy code
git clone https://github.com/YorgiAlejandro/mandao-app.git
cd mandao-app
Install the dependencies with CocoaPods:

bash
Copy code
pod install
Open the project in Xcode using the .xcworkspace file.

Run the project on the simulator or a physical device.

Usage

Login:

Open the app and select your province from the login screen.
Press the "Confirm" button to continue to the main screen.
Navigation:

Use the top bar to change the province and view offers specific to that area.
Explore the banners, restaurant categories, and the list of available businesses.
Exploring Restaurants:

Select a category to view available restaurants.
Browse the business list to see additional details and ratings.
Contribution

Contributions are welcome. To contribute, please:

Fork the repository.
Create a branch with your feature (git checkout -b feature/new-feature).
Commit your changes (git commit -m 'Add new feature').
Push the branch (git push origin feature/new-feature).
Open a Pull Request.
License

This project is licensed under the MIT License. See the LICENSE file for more information.

Contact

For any inquiries, please contact yorgialejandro6@gmail.com.

