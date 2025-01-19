// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/widgets/appTextField.dart';
import 'package:watchstore/widgets/mainButton.dart';

// ignore: must_be_immutable, camel_case_types
class SendSMS_Screen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SendSMS_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.watchStoreLogoNoBG.path),
            (AppDimens.large * 4).height,
            AppTextField(
                label: AppStrings.enterYourNumber,
                hint: AppStrings.enterYourNumberHint,
                controller: _controller),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is SentState) {
                  Navigator.pushNamed(
                    context, 
                    ScreenNames.verifyCodeScreen,
                    arguments: state.phoneNumber);
                } else if(state is ErrorState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red,
                      content: Text(AppStrings.error))
                  );
                }
              },
              builder: (context, state) {
                if (state is LodingState) {
                  return const Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor: AlwaysStoppedAnimation<Color>(LightAppColors.primary),
                      ),
                      Icon(
                        Icons.watch,
                        color: LightAppColors.primary,
                        size: 50,
                      ),
                    ],
                  ),
                );
                }
                return MainButton(
                  text: AppStrings.sendRegisterCode,
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).sendSMS(_controller.text);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
