import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/res/dimens.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  TextEditingController controller;
  final Widget icon;
  final TextAlign textAlign;
  TextInputType? inputType;
  final String prefixLabel;

  AppTextField(
    {
       super.key, 
       required this.label,
       required this.hint,
       required this.controller,
       this.icon=const SizedBox(),
       this.textAlign=TextAlign.center,
       this.inputType,
       this.prefixLabel="",
      }
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(padding: EdgeInsets.all(AppDimens.medium),
    child: Column(
      children: [
        SizedBox(
          width: size.width*.75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,style: LightAppTextStyle.title,),
              Text(prefixLabel,style: LightAppTextStyle.title,),
            ],
          ),
        ),
        AppDimens.medium.height,
        SizedBox(
        width: size.width*.75, 
        height: size.height*.07,
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintStyle: LightAppTextStyle.hint,
            hintText: hint,
            suffixIcon: icon,
            prefixIcon: const SizedBox(),
          ),
        ),
      ),
      ]
    ),
    );
  }
}