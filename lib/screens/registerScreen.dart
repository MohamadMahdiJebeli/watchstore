import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/screens/mainScreen/mainScreen.dart';
import 'package:watchstore/widgets/appTextField.dart';
import 'package:watchstore/widgets/avatar.dart';
import 'package:watchstore/widgets/mainButton.dart';
import 'package:watchstore/widgets/registrationAppBar.dart';

class Registerscreen extends StatelessWidget {
  Registerscreen({super.key});
  TextEditingController _controllerName = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: RegistrationAppBar(size: size),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              (AppDimens.large*3).height,
              const Avatar(),
              (AppDimens.large*3).height,
              AppTextField(
                label: AppStrings.name,
                hint: AppStrings.nameHint,
                controller: _controllerName
                ),
                AppTextField(
                label: AppStrings.postalCode,
                hint: AppStrings.postalCodeHint,
                controller: _controllerName
                ),
                AppTextField(
                label: AppStrings.location,
                hint: AppStrings.locationHint,
                controller: _controllerName,
                icon: Icon(Icons.add_location_outlined),
                ),
                (AppDimens.large*3).height,
                MainButton(
                  text: AppStrings.finish,
                  onPressed:() => Navigator.pushNamed(context,ScreenNames.mainScreen),
                  )
            ],
          ),
        )
        ),
    );
  }
}
