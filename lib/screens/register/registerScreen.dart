import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/data/model/user.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/screens/mainScreen/mainScreen.dart';
import 'package:watchstore/screens/register/cubit/register_cubit.dart';
import 'package:watchstore/utils/imageHandler.dart';
import 'package:watchstore/widgets/appTextField.dart';
import 'package:watchstore/widgets/avatar.dart';
import 'package:watchstore/widgets/mainButton.dart';
import 'package:watchstore/widgets/registrationAppBar.dart';

class Registerscreen extends StatefulWidget {
  Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPostalCode = TextEditingController();
  TextEditingController _controllerLocation = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;

  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: RegistrationAppBar(size: size),
      body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => RegisterCubit(),
              child: Column(
                children: [
                  (AppDimens.large * 3).height,
                  Avatar(
                    onTap: () async => await imageHandler
                        .pickAndCropImage(source: ImageSource.gallery)
                        .then((value) => setState(() {})),
                    file: imageHandler.getImage,
                  ),
                  (AppDimens.large * 3).height,
                  AppTextField(
                      label: AppStrings.name,
                      hint: AppStrings.nameHint,
                      controller: _controllerName),
                  AppTextField(
                      label: AppStrings.postalCode,
                      hint: AppStrings.postalCodeHint,
                      controller: _controllerPostalCode),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is LocationPickedState) {
                        if (state.location != null) {
                          _controllerLocation.text =
                              '${state.location!.latitude} - ${state.location!.longitude}';
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;
                        }
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .pickThelocation(context: context);
                        },
                        child: AppTextField(
                          label: AppStrings.location,
                          hint: AppStrings.locationHint,
                          controller: _controllerLocation,
                          icon: const Icon(Icons.add_location_outlined),
                        ),
                      );
                    },
                  ),
                  (AppDimens.large * 3).height,
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is OKResponseState) {
                        Navigator.pushNamed(context, ScreenNames.mainScreen);
                      }else if(state is ErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.error)));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
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
                                size: 55,
                              ),
                            ],
                          ),
                        );
                      } else {
                       return MainButton(
                        text: AppStrings.finish,
                        onPressed: () async {
                          if (imageHandler.getImage == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text( "Please select a profile pic")));
                                  return;
                                }
                          User user = User(
                            name: _controllerName.text,
                            phone: "+98",
                            address: "iran",
                            postalCode: _controllerPostalCode.text,
                            image:await MultipartFile.fromFile(imageHandler.getImage!.path),
                            // MultipartFile.fromString(Assets.png.user.path),  
                            // await MultipartFile.fromFile(imageHandler.getImage!.path),
                            lat: lat,
                            lng: lng);

                          BlocProvider.of<RegisterCubit>(context).register(user: user);
                        },
                      ); 
                      }
                    },
                  ),
                  AppDimens.large.height
                ],
              ),
            ),
          )),
    );
  }
}
