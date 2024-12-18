**E-COMMERCE APPLICATION 🚀**

A Flutter-based application for buying, selling, and managing products—both new and used.
The app provides features for sellers to post items and buyers to browse, add to cart, and purchase items.
It uses Firebase Firestore for data management and real-time updates.
It is integrated with api for login and sign up validations.

**Table of Contents :** 
1. Features
2. Screenshots
3. Onboarding
4. Login Screen
5. Signup Screen
6. Home Screen
7. Add Post Screen
8. Cart Screen
9. Drawer Screen
10. Product Info Screen
11. Project Structure
12. Setup and Installation
13. Assets
14. Dependencies
15. Contribution Guidelines
16. Contact

--------------------------------------------------------------------------------------------------------------------------

**Features 🌟**

1. Post Products: Sellers can add products (new or used) with images, descriptions, and prices.
2. Real-Time Updates: View products added by other sellers in real-time.
3. Cart Management: Buyers can add items to their cart and manage purchases.
4. User Authentication: Secure sign-up and login functionality.
5. Seller Management: Sellers can edit or delete their posts.
6. Responsive UI: Beautiful and adaptive UI for all screen sizes.

---------------------------------------------------------------------------------------------------------------------------

**Screenshots 📸**

_ONBOARDING_
![Onboarding]([assets/images/onBoardingScreen.png](https://github.com/AnasNasr-afk/galsa_trial2/blob/ac496895a9528585d8a4a9c69c87acf294cc05bf/onBoardingScreen.png))

_Login Screen_
https://github.com/AnasNasr-afk/galsa_trial2/blob/8f16991b1a4e7fb1e5a311f1fa4661896845e9e7/loginScreen.png

_Signup Screen_
[![Signup Screen](assets/images/signUpScreen.png)](https://github.com/AnasNasr-afk/galsa_trial2/blob/0bb2cebae3e5bdf2c178480471c2486a58fa2b82/signUpScreen.png)

_Home Screen_
![Home Screen](assets/images/homePageScreen.png)

_Add Post Screen_
![Add Post Screen](assets/images/addPostScreen.png)

_Cart Screen_
![Cart Screen](assets/images/cartScreen.png)

_Drawer Screen_
![Drawer Screen](assets/images/drawerScreen.png)

_Product Info Screen_
![Product Info Screen](assets/images/productInfoScreen.png)

---------------------------------------------------------------------------------------------------------------------------

**Project Structure 📂**

galsa_trial2/
│── android/                       # Android native files
│── ios/                           # iOS native files
│── assets/                        # Assets directory
│   ├── images/                    # PNG, JPG images
│   │   ├── Screenshot1.png
│   │   ├── Screenshot2.png
│   ├── svgs/                      # SVG icons
│       ├── icon_add_post.svg
│       └── icon_cart.svg
│── lib/                           # Flutter app source code
│   ├── core/                      # Core utilities and shared components
│   │   ├── authentication/        # User authentication logic
│   │   ├── components/            # Shared UI components
│   │   ├── constants/             # App constants
│   │   ├── di/                    # Dependency Injection
│   │   ├── helpers/               # Helper functions
│   │   ├── networking/            # API calls and networking
│   │   ├── routing/               # App navigation
│   │   ├── theming/               # Theme configuration
│   │   └── widgets/               # Reusable widgets
│   ├── features/                  # App features
│   │   ├── add_post_screen/       # Add new product screen
│   │   ├── add_to_cart_screen/    # Manage cart items
│   │   ├── home_screen/           # Home screen with products list
│   │   ├── login_screen/          # Login and authentication
│   │   ├── onboarding_screen/     # Introductory onboarding screens
│   │   ├── post_details_screen/   # View product details
│   │   └── signup_screen/         # User registration screen
│   ├── firebase_options.dart      # Firebase setup
│   ├── main.dart                  # Entry point of the app
│   └── shop_app.dart              # App root widget
│── linux/                         # Linux support files
│── pubspec.yaml                   # Dependencies and asset registration
│── README.md                      # Documentation
└── build/                         # Build outputs

---------------------------------------------------------------------------------------------------------------------------

**Setup and Installation 🔧**

_Prerequisites_
Flutter SDK: Install Flutter.
Firebase: Set up Firebase Firestore and authentication.
Steps to Run the Project

_Clone the Repository:_
git clone https://github.com/AnasNasr-afk/galsa_trial2.git
cd galsa_trial2

_Install Dependencies:_
flutter pub get
Add Firebase Configuration Files:
Add google-services.json to android/app/.
Add GoogleService-Info.plist to ios/Runner/.



_Verify pubspec.yaml includes:_
name: galsa_trial2
description: "A new Flutter project for buying, selling, and managing products."

publish_to: 'none' # Prevents accidental publishing to pub.dev

version: 1.0.0+1

environment:
sdk: ^3.5.3

dependencies:
bloc: ^8.1.4
flutter_bloc: ^8.1.4
dio: ^5.5.0+1
conditional_builder_null_safety: ^0.0.6
smooth_page_indicator: ^1.2.0+3
shared_preferences: ^2.2.3
image_picker: ^1.1.2
webview_flutter: ^4.9.0
fluttertoast: ^8.2.6
flutter_advanced_segment: ^3.0.2
intl: ^0.19.0
freezed: ^2.5.7
freezed_annotation: ^2.4.4
get_it: ^7.7.0
json_serializable: ^6.8.0
json_annotation: ^4.9.0
retrofit: ^4.2.0
retrofit_generator: ^8.2.0
pretty_dio_logger: ^1.4.0
easy_localization: ^3.0.7
flutter_native_splash: ^2.4.1
flutter_svg: ^2.0.10+1
flutter_screenutil: ^5.9.3
firebase_core: ^3.6.0
firebase_auth: ^5.3.1
google_sign_in: ^6.2.1
firebase_storage: ^12.3.4
cloud_firestore: ^5.4.4
awesome_dialog: ^3.2.1
rive: ^0.13.15
sign_in_button: ^3.2.0

dev_dependencies:
flutter_test:
sdk: flutter
flutter_lints: ^4.0.0
build_runner: ^2.4.6 # For code generation with retrofit_generator, json_serializable

flutter:
uses-material-design: true

# Asset configuration
assets:
- assets/images/
- assets/svgs/

_Run the App:_
flutter run

---------------------------------------------------------------------------------------------

**Assets 🎨**

Images
All images and screenshots are stored in the assets/images/ folder.

SVG Icons
SVG icons for buttons and UI components are located in the assets/svgs/ folder.

Usage Example:

Image.asset('assets/images/Screenshot1.png');
SvgPicture.asset('assets/svgs/icon_add_post.svg');

-------------------------------------------------------------------------------------------

**Dependencies 📦**

Dependency	Description
flutter_bloc	State management using BLoC.
firebase_core	Firebase core integration.
cloud_firestore	Firestore database for products.
firebase_auth	User authentication.
flutter_svg	For rendering SVG assets.
image_picker	Image selection for posts.
shared_preferences	Local storage for user sessions.

Install all dependencies using:

flutter pub get

-------------------------------------------------------------------------------------------


**Contact 📬**

If you have any questions, feel free to reach out:

GitHub: AnasNasr-afk
Enjoy using our app! 🚀
