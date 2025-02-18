/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCoursesGen {
  const $AssetsCoursesGen();

  /// File path: assets/courses/3d.png
  AssetGenImage get a3d => const AssetGenImage('assets/courses/3d.png');

  /// File path: assets/courses/3d_icons.png
  AssetGenImage get a3dIcons =>
      const AssetGenImage('assets/courses/3d_icons.png');

  /// File path: assets/courses/blender.png
  AssetGenImage get blender =>
      const AssetGenImage('assets/courses/blender.png');

  /// File path: assets/courses/crm.png
  AssetGenImage get crm => const AssetGenImage('assets/courses/crm.png');

  /// File path: assets/courses/flutter.png
  AssetGenImage get flutter =>
      const AssetGenImage('assets/courses/flutter.png');

  /// File path: assets/courses/pearsona.png
  AssetGenImage get pearsona =>
      const AssetGenImage('assets/courses/pearsona.png');

  /// File path: assets/courses/ui.png
  AssetGenImage get ui => const AssetGenImage('assets/courses/ui.png');

  /// File path: assets/courses/wordpress.png
  AssetGenImage get wordpress =>
      const AssetGenImage('assets/courses/wordpress.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    a3d,
    a3dIcons,
    blender,
    crm,
    flutter,
    pearsona,
    ui,
    wordpress,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_back.png
  AssetGenImage get arrowBack =>
      const AssetGenImage('assets/icons/arrow_back.png');

  /// File path: assets/icons/full_screen.png
  AssetGenImage get fullScreen =>
      const AssetGenImage('assets/icons/full_screen.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// File path: assets/icons/more.png
  AssetGenImage get more => const AssetGenImage('assets/icons/more.png');

  /// File path: assets/icons/play.png
  AssetGenImage get play => const AssetGenImage('assets/icons/play.png');

  /// File path: assets/icons/search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/search.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    arrowBack,
    fullScreen,
    home,
    lock,
    logo,
    more,
    play,
    search,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/full_screen.png
  AssetGenImage get fullScreen =>
      const AssetGenImage('assets/images/full_screen.png');

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/review.png
  AssetGenImage get review => const AssetGenImage('assets/images/review.png');

  /// List of all assets
  List<AssetGenImage> get values => [fullScreen, img, logo, review];
}

class Assets {
  const Assets._();

  static const $AssetsCoursesGen courses = $AssetsCoursesGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
