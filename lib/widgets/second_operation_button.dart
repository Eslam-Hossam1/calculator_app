import 'package:flutter/material.dart';

class SecondOperationButton extends StatelessWidget {
  const SecondOperationButton({
    super.key,
    this.onTap,
    required this.text,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 71,
        width: 71,
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
                  Color.fromARGB(255, 220, 98, 22),
                  Color.fromRGBO(237, 132, 28, 1),
                ])),
        child: Card(
          elevation: 0,
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
