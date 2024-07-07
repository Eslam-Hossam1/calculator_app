import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/change_theme_cubit/change_theme_cubit.dart';

class DarkModeThemeButton extends StatelessWidget {
  const DarkModeThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChangeThemeCubit changeThemeCubit =
        BlocProvider.of<ChangeThemeCubit>(context);
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                offset: const Offset(2, 2),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
            onPressed: () {
              changeThemeCubit.changeTheme();
            },
            icon: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            )),
      ),
    );
  }
}
