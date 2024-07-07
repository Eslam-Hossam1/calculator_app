import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/change_theme_cubit/change_theme_cubit_states.dart';
import 'package:my_app/widgets/themes/themes.dart';

class ChangeThemeCubit extends Cubit<ThemeStates> {
  late ThemeData theme;

  ChangeThemeCubit() : super(InitialState()) {
    bool isDarkMode =
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    if (isDarkMode) {
      theme = MyThemes.darkTheme;
    } else {
      theme = MyThemes.lightTheme;
    }
  }
  void changeTheme() {
    // if (theme == null) {
    //   if (isDarkMode) {
    //     theme = MyThemes.darkTheme;
    //   } else {
    //     theme = MyThemes.lightTheme;
    //   }
    //} else {
    theme == MyThemes.darkTheme
        ? theme = MyThemes.lightTheme
        : theme = MyThemes.darkTheme;
    emit(ChangeThemeState());
    //  }
  }
}
