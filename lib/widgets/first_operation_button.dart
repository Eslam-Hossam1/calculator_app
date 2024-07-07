import 'package:flutter/material.dart';

class FirstOperationButton extends StatelessWidget {
  const FirstOperationButton({super.key, this.onTap, required this.text});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  offset: const Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.shade500,
                  Colors.grey.shade600,
                ])),
        child: Card(
          elevation: 30,
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
