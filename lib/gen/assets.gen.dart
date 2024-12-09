/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/Apple Watch Series 10.png
  AssetGenImage get appleWatchSeries10 =>
      const AssetGenImage('assets/png/Apple Watch Series 10.png');

  /// File path: assets/png/MJ 21.jpg
  AssetGenImage get mj21 => const AssetGenImage('assets/png/MJ 21.jpg');

  /// File path: assets/png/Watch Store Logo No BG.png
  AssetGenImage get watchStoreLogoNoBG =>
      const AssetGenImage('assets/png/Watch Store Logo No BG.png');

  /// File path: assets/png/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/png/avatar.png');

  /// File path: assets/png/back.png
  AssetGenImage get back => const AssetGenImage('assets/png/back.png');

  /// File path: assets/png/search.png
  AssetGenImage get search => const AssetGenImage('assets/png/search.png');

  /// File path: assets/png/user.png
  AssetGenImage get user => const AssetGenImage('assets/png/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appleWatchSeries10,
        mj21,
        watchStoreLogoNoBG,
        avatar,
        back,
        search,
        user
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/back.svg
  String get back => 'assets/svg/back.svg';

  /// File path: assets/svg/cancelled.svg
  String get cancelled => 'assets/svg/cancelled.svg';

  /// File path: assets/svg/cart.svg
  String get cart => 'assets/svg/cart.svg';

  /// File path: assets/svg/classic.svg
  String get classic => 'assets/svg/classic.svg';

  /// File path: assets/svg/delete.svg
  String get delete => 'assets/svg/delete.svg';

  /// File path: assets/svg/delivered.svg
  String get delivered => 'assets/svg/delivered.svg';

  /// File path: assets/svg/desktop.svg
  String get desktop => 'assets/svg/desktop.svg';

  /// File path: assets/svg/digital.svg
  String get digital => 'assets/svg/digital.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/in_proccess.svg
  String get inProccess => 'assets/svg/in_proccess.svg';

  /// File path: assets/svg/left_arrow.svg
  String get leftArrow => 'assets/svg/left_arrow.svg';

  /// File path: assets/svg/minus.svg
  String get minus => 'assets/svg/minus.svg';

  /// File path: assets/svg/phone.svg
  String get phone => 'assets/svg/phone.svg';

  /// File path: assets/svg/plus.svg
  String get plus => 'assets/svg/plus.svg';

  /// File path: assets/svg/postal_code.svg
  String get postalCode => 'assets/svg/postal_code.svg';

  /// File path: assets/svg/smart.svg
  String get smart => 'assets/svg/smart.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// List of all assets
  List<String> get values => [
        back,
        cancelled,
        cart,
        classic,
        delete,
        delivered,
        desktop,
        digital,
        home,
        inProccess,
        leftArrow,
        minus,
        phone,
        plus,
        postalCode,
        smart,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
