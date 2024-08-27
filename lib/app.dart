import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubits/theme_cubit/theme_cubit.dart';
import 'logic/cubits/theme_cubit/theme_state.dart';
import 'screens/home/home_screen.dart';
import 'screens/auth/sign_in_screen.dart';
import 'screens/auth/sign_up_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/notifications/notification_screen.dart';
import 'screens/messaging/messaging_screen.dart';
import 'screens/settings/settings_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state.themeMode,
          initialRoute: '/onboarding',
          routes: {
            '/onboarding': (context) => const OnboardingScreen(),
            '/sign-in': (context) => SignInScreen(),
            '/sign-up': (context) => SignUpScreen(),
            '/forgot-password': (context) => ForgotPasswordScreen(),
            '/home': (context) => const HomeScreen(),
            '/profile': (context) => const ProfileScreen(userId: 'exampleUserId'), // Replace with dynamic user ID
            '/search': (context) => const SearchScreen(),
            '/notifications': (context) => const NotificationScreen(userId: 'exampleUserId'), // Replace with dynamic user ID
            '/messaging': (context) => const MessagingScreen(chatId: 'exampleChatId'), // Replace with dynamic chat ID
            '/settings': (context) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
