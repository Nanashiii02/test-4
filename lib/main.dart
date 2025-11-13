import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_gate.dart';
import 'firebase_options.dart';
import 'forgot_password_page.dart';
import 'home_page.dart';
import 'journal_page.dart';
import 'login_page.dart';
import 'presence_service.dart';
import 'registration_page.dart';
import 'weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Starting Firebase initialization...");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Firebase initialized successfully!");
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthGate(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: 'registration',
          builder: (context, state) => const RegistrationPage(),
        ),
        GoRoute(
          path: 'forgot-password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: 'journal',
          builder: (context, state) => const JournalPage(),
        ),
        GoRoute(
          path: 'weather',
          builder: (context, state) => const WeatherPage(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final PresenceService _presenceService = PresenceService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _presenceService.initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _presenceService.goOnline();
    } else if (state == AppLifecycleState.paused) {
      _presenceService.goOffline();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
