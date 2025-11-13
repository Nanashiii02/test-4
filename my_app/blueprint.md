# Project Blueprint

## Overview

This document outlines the design, features, and implementation details of the Flutter application.

## 1. Project Structure

*   **`lib/`**: Main directory for Dart source code.
    *   **`main.dart`**: The entry point of the application.
    *   **`auth_gate.dart`**: Handles authentication state and redirects users accordingly.
    *   **`auth_service.dart`**: Provides authentication services using Firebase.
    *   **`login_page.dart`**: The UI for the login page.
    *   **`registration_page.dart`**: The UI for the registration page.
    *   **`home_page.dart`**: The main screen after a user logs in.
    *   **`weather_page.dart`**: A page to display weather information.
    *   **`journal_page.dart`**: A page for users to write journal entries.
    *   **`forgot_password_page.dart`**: A page for users to reset their password.
    *   **`firebase_options.dart`**: Firebase configuration file.
*   **`pubspec.yaml`**: The project's dependency and configuration file.
*   **`assets/`**: Directory for static assets like images and icons.

## 2. Features

*   **User Authentication**: Users can register and log in using email and password.
*   **Weather**: Users can view the weather for their location.
*   **Journal**: Users can write and save journal entries.
*   **Password Reset**: Users can reset their password if they forget it.

## 3. Design

The application follows the Material Design guidelines. The UI is designed to be simple and intuitive.

## 4. Current Task: Fix Registration and Redesign UI

*   **Fix Registration**: The user registration is not working. The plan is to investigate the issue and fix it.
*   **Redesign UI**: The user has requested a new design for the home page. The new design will be implemented after the registration issue is fixed.
