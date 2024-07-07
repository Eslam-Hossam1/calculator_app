import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/calculations_cubit.dart/calculations_cubit.dart';
import 'package:my_app/cubits/calculations_cubit.dart/calculations_cubit_states.dart';

class MathInput extends StatelessWidget {
  const MathInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<CalculationsCubit, CalculationsStates>(
                builder: (context, state) {
                  CalculationsCubit calculationsCubit =
                      BlocProvider.of<CalculationsCubit>(context);
                  if (state is SuccessState) {
                    return Text(
                      calculationsCubit.inputText,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 32),
                    );
                  } else if (state is EqualButtonPressedState) {
                    return Text(
                      calculationsCubit.inputText,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 32),
                    );
                  } else {
                    return Text(
                      calculationsCubit.inputText,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 32),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
