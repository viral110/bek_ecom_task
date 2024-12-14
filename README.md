# Bek Ecommerce Application

**Ecommerce App with Riverpod State Management**   

This repository contains a feature-rich Flutter application designed to showcase product listing, user authentication, and state management using Riverpod. The app demonstrates clean architecture, responsive design, and robust functionality for a seamless user experience.

**🚀 Features**  
1. Authentication  
User registration and login using Firebase Authentication.
Persistent sessions to maintain login status until explicitly logged out.
2. Product Listing  
Fetches product data from a public API (https://fakestoreapi.com).
Displays product name, price, and image in a visually appealing, responsive layout.
Enables navigation to a detailed view for individual products, including descriptions.
3. Favorites Management  
Users can mark products as favorites with a heart icon.
Favorites persist across app sessions using SharedPreferences.
A separate "Favorites" screen displays the user’s saved products.
4. Profile Management  
Displays user profile details (e.g., name, email).
Allows users to edit their profile information through editable text fields.
Includes a logout feature that clears user session and local data.
5. State Management  
Utilizes Riverpod for scalable and maintainable state management.
Ensures a clear separation of UI and business logic.
6. Responsive Design
Optimized for both Android and iOS devices with smooth performance.

**Technologies Used :**  

**Flutter**: Cross-platform UI framework.  
**Riverpod**: State management for predictable and testable app behavior.  
**Firebase Authentication**: Secure user authentication and session management.  
**SharedPreferences**: Local storage for persisting user favorites.  
**HTTP**: API integration for product data fetching.  

**Challenges Faced**
1. Persistent State Management  
Managing the state of user favorites across app sessions required careful integration of SharedPreferences with Riverpod. Ensuring data synchronization between local storage and the app state was a key challenge.  
  
2. Firebase Authentication
Integrating Firebase Authentication with Riverpod to handle secure login/logout and session persistence posed initial difficulties, particularly ensuring seamless navigation between authenticated and non-authenticated screens.  

3. Profile Data Handling  
Implementing editable profile fields without losing entered data during widget rebuilds was tricky. This was resolved by using TextEditingController effectively and saving data on explicit user actions.  

4. Navigation & State  
Coordinating navigation between multiple screens while maintaining state consistency required careful planning, especially with deep links and back navigation behavior.  
