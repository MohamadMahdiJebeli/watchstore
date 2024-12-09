import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/widgets/appTextField.dart';
import 'package:watchstore/widgets/mainButton.dart';

class GetOTPScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.watchStoreLogoNoBG.path),
            (AppDimens.large).height,
            Text(AppStrings.otpCodeSendFor.replaceAll(AppStrings.replace, "09393837204"),style: LightAppTextStyle.title,),
            AppDimens.medium.height,
            const Text(AppStrings.wrongNumber,style: TextStyle(color: LightAppColors.wrongNumber),),
            (AppDimens.large*3).height,
            AppTextField(
              label: AppStrings.enterVarificationCode,
              hint: AppStrings.enterVarificationCodeHint,
              controller: _controller,
              textAlign: TextAlign.center,
              prefixLabel: "2:59",
              ),

              MainButton(
                text: AppStrings.next,
                onPressed: ()=> Navigator.pushNamed(context,ScreenNames.registerScreen)
                )
          ],
        ),
      ),
    );
  }
}