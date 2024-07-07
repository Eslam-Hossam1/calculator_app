import 'package:flutter/material.dart';
import 'package:my_app/helper/add_space.dart';
import 'package:my_app/widgets/bottom_buttons_row.dart';
import 'package:my_app/widgets/main_numbers_and_operations_buttons_grid_view.dart';

class MathKeyBoard extends StatelessWidget {
  const MathKeyBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 360,
          width: double.infinity,
          child: MainNumbersAndOperationsButtonsGridView(),
        ),
        addHieghtSpace(8),
        const BottomButtonsRow()
      ],
    );
  }
}
