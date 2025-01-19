// ignore: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/utils/formatTime.dart';
import 'package:watchstore/widgets/appTextField.dart';
import 'package:watchstore/widgets/mainButton.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  
  final TextEditingController _controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    startTimer();
  }
  
  late Timer _timer;
  int _start = 120;

  startTimer(){
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer){
      setState(() {
        if (_start==0) {
          timer.cancel();
          Navigator.of(context).pop();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.watchStoreLogoNoBG.path),
            (AppDimens.large).height,
            Text(
              AppStrings.otpCodeSendFor
                  .replaceAll(AppStrings.replace, mobileRouteArg),
              style: LightAppTextStyle.title,
            ),
            AppDimens.medium.height,
            GestureDetector(
              onTap:() => Navigator.of(context).pop(),
              child: const Text(
                AppStrings.wrongNumber,
                style: TextStyle(color: LightAppColors.wrongNumber),
              ),
            ),
            (AppDimens.large * 3).height,
            AppTextField(
              label: AppStrings.enterVarificationCode,
              hint: AppStrings.enterVarificationCodeHint,
              controller: _controller,
              textAlign: TextAlign.center,
              prefixLabel: formatType(_start),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                _timer.cancel();
                if (state is VerifiedNotRegisterdState) {
                  Navigator.pushNamed(context, ScreenNames.registerScreen);
                } else if(state is VerifiedRegisterdState){
                  Navigator.pushNamed(context, ScreenNames.mainScreen);
                }
              },
              builder: (context, state) {
                if (state is LodingState) {
                  return const Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 6,
                        valueColor: AlwaysStoppedAnimation<Color>(LightAppColors.primary),
                      ),
                      Icon(
                        Icons.watch,
                        color: LightAppColors.primary,
                        size: 55,
                      ),
                    ],
                  ),
                );
                } else {
                 return MainButton(
                    text: AppStrings.next,
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).verifyCode(mobileRouteArg, _controller.text);
                    }); 
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
