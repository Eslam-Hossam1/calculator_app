import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubits/calculations_cubit.dart/calculations_cubit.dart';

class CustomeNumberButton extends StatelessWidget {
  const CustomeNumberButton({
    super.key,
    required this.text,
    this.width,
    this.onTap,
  });
  final double? width;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            BlocProvider.of<CalculationsCubit>(context).addNumber(num: text);
          },
      child: Container(
        height: 70,
        width: width ?? 70,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  offset: const Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 57, 60, 68),
                  Color.fromARGB(255, 70, 71, 78),
                ])),
        child: Card(
          elevation: 10,
          color: Colors.transparent,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
