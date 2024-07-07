import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/change_theme_cubit/change_theme_cubit.dart';

class LightModeThemeButton extends StatelessWidget {
  const LightModeThemeButton({
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
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.3),
                offset: const Offset(2, 2),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          image: const DecorationImage(
              image: AssetImage("assets/istockphoto-1282788290-612x612.jpg"),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
            onPressed: () {
              changeThemeCubit.changeTheme();
            },
            icon: const Icon(
              Icons.sunny,
              color: Colors.yellow,
            )),
      ),
    );
  }
}
