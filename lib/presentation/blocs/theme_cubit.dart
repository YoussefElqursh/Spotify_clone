import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeCubit extends Cubit<ThemeMode> {

  ThemeCubit() : super(ThemeMode.system);

  void toggleTheme(ThemeMode mode) => emit(mode);

  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }

}