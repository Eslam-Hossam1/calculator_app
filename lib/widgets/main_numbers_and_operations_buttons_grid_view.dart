import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/calculations_cubit.dart/calculations_cubit.dart';
import 'package:my_app/widgets/custome_number_button.dart';
import 'package:my_app/widgets/first_operation_button.dart';
import 'package:my_app/widgets/second_operation_button.dart';

class MainNumbersAndOperationsButtonsGridView extends StatelessWidget {
  const MainNumbersAndOperationsButtonsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 12, crossAxisSpacing: 12),
      children: [
        FirstOperationButton(
          text: "C",
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context).clear();
          },
        ),
        FirstOperationButton(
          text: "<-",
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context).deleteNumber();
          },
        ),
        FirstOperationButton(
          text: "%",
          onTap: () {
            //something missing here
            BlocProvider.of<CalculationsCubit>(context)
                .addOperation(opertion: '%');
          },
        ),
        SecondOperationButton(
          text: "/",
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context)
                .addOperation(opertion: '/');
          },
        ),
        const CustomeNumberButton(text: '1'),
        const CustomeNumberButton(text: '2'),
        const CustomeNumberButton(text: '3'),
        SecondOperationButton(
          text: "*",
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context)
                .addOperation(opertion: '*');
          },
        ),
        const CustomeNumberButton(text: '4'),
        const CustomeNumberButton(text: '5'),
        const CustomeNumberButton(text: '6'),
        SecondOperationButton(
          text: "-",
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context)
                .addOperation(opertion: '-');
          },
        ),
        const CustomeNumberButton(text: '7'),
        const CustomeNumberButton(text: '8'),
        const CustomeNumberButton(text: '9'),
        SecondOperationButton(
          text: "+",
          onTap: () {
            BlocProvider.of<CalculationsCubit>(context)
                .addOperation(opertion: '+');
          },
        ),
      ],
    );
  }
}
