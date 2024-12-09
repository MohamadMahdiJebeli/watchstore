import 'package:flutter/material.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({
    super.key,
    required this.child,
  });

  final child;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.fromLTRB(AppDimens.medium, AppDimens.medium, AppDimens.medium, 0),      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.large),
        color: LightAppColors.surface
      ),
      child: child,
    );
  }
}