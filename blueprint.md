
# Project Blueprint

## Overview

This document outlines the structure, features, and design of the Flutter application. It serves as a single source of truth for the project's current state and future development plans.

## Style, Design, and Features

The application currently has a basic structure with Firebase integration. The UI consists of several pages for authentication and core app functionality.

**Existing Features:**
* Firebase Authentication (Login, Registration, Forgot Password)
* Home Page
* Journal Page
* Weather Page

## Current Task: Fix Firebase Initialization Issue

### Plan

I am addressing a "black screen" issue, which is likely caused by incorrect Firebase setup on the Android side.

**Steps:**
1.  **Verify `google-services.json`**: Ensure the file exists in the `android/app/` directory.
2.  **Check Gradle Files**:
    *   Verify that the Google Services plugin (`com.google.gms.google-services`) is correctly applied in both the project-level (`android/build.gradle.kts`) and app-level (`android/app/build.gradle.kts`) gradle files.
3.  **Check Android Manifest**:
    *   Ensure the `android.permission.INTERNET` permission is present in `android/app/src/main/AndroidManifest.xml`.
4.  **Add Debug Logging**:
    *   Modify `lib/main.dart` to include print statements around the `Firebase.initializeApp()` call to confirm whether initialization is succeeding or failing.
5.  **Apply Fixes**: Based on the findings, I will apply the necessary corrections to the configuration files.
