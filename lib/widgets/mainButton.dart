import 'package:flutter/material.dart';
import 'package:watchstore/components/buttonStyle.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  final String text;
  void Function() onPressed;

  MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height*.06,
      width: size.width*.75,

      child: ElevatedButton(
        style: AppButtonstyles.mainButtonStyle,
        onPressed: onPressed,
        child: Text(text)),
    );
  }
}