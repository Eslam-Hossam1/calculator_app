import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/calculations_cubit.dart/calculations_cubit.dart';
import 'package:my_app/helper/add_space.dart';
import 'package:my_app/widgets/custome_number_button.dart';
import 'package:my_app/widgets/second_operation_button.dart';

class BottomButtonsRow extends StatelessWidget {
  const BottomButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context).addNumber(num: '0');
          },
          child: const CustomeNumberButton(
            text: "0",
            width: 148,
          ),
        ),
        addWidthSpace(8),
        const Spacer(
          flex: 1,
        ),
        GestureDetector(
          child: const CustomeNumberButton(text: "."),
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context).addNumber(num: '.');
          },
        ),
        const Spacer(),
        SecondOperationButton(
          text: "=",
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context).equalButton();
          },
        ),
      ],
    );
  }
}
