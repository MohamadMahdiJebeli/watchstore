import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/widgets/appTextField.dart';
import 'package:watchstore/widgets/mainButton.dart';

class SendOTPScreen extends StatelessWidget {
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
            (AppDimens.large*4).height,
            AppTextField(
              label: AppStrings.enterYourNumber,
              hint: AppStrings.enterYourNumberHint,
              controller: _controller),
              MainButton(
                text: AppStrings.sendRegisterCode,
                onPressed: () => Navigator.pushNamed(context,ScreenNames.getOTPScreen),
                )
          ],
        ),
      ),
    );
  }
}