import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/theme_cubit/theme_cubit.dart';
import '../../logic/cubits/theme_cubit/theme_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Dark Mode'),
              trailing: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Switch(
                    value: state.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: const Text('Account Settings'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Account Settings Screen
              },
            ),
            ListTile(
              title: const Text('Notification Preferences'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Notification Preferences Screen
              },
            ),
            ListTile(
              title: const Text('Privacy & Security'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Privacy & Security Screen
              },
            ),
            ListTile(
              title: const Text('About'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to About Screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
