import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'package:my_app/cubits/change_theme_cubit/change_theme_cubit_states.dart';
import 'package:my_app/widgets/dark_mode_theme_button.dart';
import 'package:my_app/widgets/light_mode_theme_button.dart';
import 'package:my_app/widgets/themes/themes.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ThemeStates>(
      builder: (context, state) {
        ChangeThemeCubit changeThemeCubit =
            BlocProvider.of<ChangeThemeCubit>(context);
        return changeThemeCubit.theme == MyThemes.lightTheme
            ? const LightModeThemeButton()
            : const DarkModeThemeButton();
      },
    );
  }
}
