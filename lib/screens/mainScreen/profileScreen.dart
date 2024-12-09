import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/widgets/customAppBar.dart';
import 'package:watchstore/widgets/surfaceContainer.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppBar(
      child: Column(
        children: [
          (AppDimens.large*1.90).height,
          Text(AppStrings.profile,style: LightAppTextStyle.title.copyWith(fontSize: 17),)
        ],
      ),),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: AppDimens.large*1.90),
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.asset(Assets.png.user.path,height: size.height/10),
                ),
                AppDimens.medium.height,
                const Text("Mohamad Mahdi Jebeli",style: LightAppTextStyle.avatarName,),
                AppDimens.large.height,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.address,style: LightAppTextStyle.title,)),
                  AppDimens.small.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                        "Isfahan",
                        style: LightAppTextStyle.title,
                        softWrap: true,
                        maxLines: 2,
                        )),
                        Transform.rotate(
                          angle: 3.12,
                          child: SvgPicture.asset(Assets.svg.leftArrow))
                    ],
                  )),
                  AppDimens.medium.height,
                  const Divider(),
                ProfileItem(content: "6219861913439948",icon: Assets.svg.postalCode,),
                ProfileItem(content: "09393837204",icon: Assets.svg.phone,),
                AppDimens.large.height,
                const SurfaceContainer(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.large*2,vertical: AppDimens.small),
                  child: Text(AppStrings.privacy),
                )),
                AppDimens.large.height,
                SurfaceContainer(child: 
                Padding(
                  padding: const EdgeInsets.all(AppDimens.large),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(Assets.svg.inProccess),
                          AppDimens.small.height,
                          const Text(AppStrings.inProccess)
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(Assets.svg.cancelled),
                          AppDimens.small.height,
                          const Text(AppStrings.cancelled)
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(Assets.svg.delivered),
                          AppDimens.small.height,
                          const Text(AppStrings.delivered)
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        )
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.content,
    required this.icon
  });

  final content;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            AppDimens.small.width,
            Expanded(
              child: Text(
              content,
              style: LightAppTextStyle.title,
              softWrap: true,
              maxLines: 2,
              )),
          ],
        )),
    );
  }
}