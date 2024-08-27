import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  void toggleTheme() {
    emit(state.themeMode == ThemeMode.light
        ? const ThemeState(themeMode: ThemeMode.dark)
        : const ThemeState(themeMode: ThemeMode.light));
  }

  void setTheme(ThemeMode themeMode) {
    emit(ThemeState(themeMode: themeMode));
  }
}
