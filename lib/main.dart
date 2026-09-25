import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payday/features/dashboard/presentation/dashboard_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/landing_screen.dart';
import 'features/auth/presentation/onboarding_screen.dart';
import 'features/auth/presentation/registration_screen.dart';
import 'features/auth/presentation/pin_setup_screen.dart';
import 'features/auth/presentation/account_success_screen.dart';
import 'features/auth/presentation/login_screen.dart';

void main() {
  runApp(const PayDayApp());
}

class PayDayApp extends StatelessWidget {
  const PayDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PayDay',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      path: '/pin-setup',
      builder: (context, state) => const PinSetupScreen(),
    ),
    GoRoute(
      path: '/account-success',
      builder: (context, state) => const AccountSuccessScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);