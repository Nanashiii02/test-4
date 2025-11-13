# Project Blueprint

## Overview

This is a Flutter application with Firebase authentication and several features including a journal, weather, and presence tracking. The application uses `go_router` for navigation and is structured with a clear separation of concerns.

## Style and Design

The application uses a standard Material Design theme with a blue primary swatch.

## Features

* **Authentication:**
    * Login, registration, and password reset functionality.
    * `AuthGate` to manage user authentication state and redirect to the appropriate screen.
* **Home Screen:** The main landing page after a user logs in.
* **Journal:** A feature for users to write and store journal entries.
* **Weather:** A feature to display weather information.
* **Presence:** A service to track user presence.

## Architecture

* **State Management:** The application uses `StreamBuilder` in the `AuthGate` for reactive authentication state management.
* **Routing:** Navigation is handled by `go_router` with the following routes:
    * `/` (initial route, handled by `AuthGate`)
    * `/login`
    * `/register`
    * `/forgot-password`
    * `/home`
    * `/journal`
    * `/weather`
* **Services:**
    * `AuthService`: Likely handles authentication logic.
    * `PresenceService`: Likely handles user presence tracking.

## Current Plan

1.  Run the application to verify that the reconstructed `main.dart` and routing are working correctly.
