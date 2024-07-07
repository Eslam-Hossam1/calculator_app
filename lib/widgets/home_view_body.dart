import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/helper/add_space.dart';
import 'package:my_app/widgets/cutome_change_theme_button.dart';
import 'package:my_app/widgets/math_input.dart';
import 'package:my_app/widgets/math_keyboard.dart';
import 'package:my_app/widgets/math_output.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        const ChangeThemeButton(),
        addHieghtSpace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const MathInput(),
        ),
        addHieghtSpace(32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const MathOutput(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            color: Colors.grey.shade600,
            thickness: .3,
          ),
        ),
        addHieghtSpace(24),
        const Padding(
          padding: EdgeInsets.only(
            right: 40,
            left: 40,
          ),
          child: MathKeyBoard(),
        ),
        const Spacer()
      ],
    );
  }
}
