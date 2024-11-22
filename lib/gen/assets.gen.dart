/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/doosan.svg
  SvgGenImage get doosan => const SvgGenImage('assets/images/doosan.svg');

  /// File path: assets/images/hanwha.svg
  SvgGenImage get hanwha => const SvgGenImage('assets/images/hanwha.svg');

  /// File path: assets/images/kia.svg
  SvgGenImage get kia => const SvgGenImage('assets/images/kia.svg');

  /// File path: assets/images/kiwoom.svg
  SvgGenImage get kiwoom => const SvgGenImage('assets/images/kiwoom.svg');

  /// File path: assets/images/kt.svg
  SvgGenImage get kt => const SvgGenImage('assets/images/kt.svg');

  /// File path: assets/images/lg.svg
  SvgGenImage get lg => const SvgGenImage('assets/images/lg.svg');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/lotte.svg
  SvgGenImage get lotte => const SvgGenImage('assets/images/lotte.svg');

  /// File path: assets/images/nc.svg
  SvgGenImage get nc => const SvgGenImage('assets/images/nc.svg');

  /// File path: assets/images/samsung.svg
  SvgGenImage get samsung => const SvgGenImage('assets/images/samsung.svg');

  /// File path: assets/images/ssg.svg
  SvgGenImage get ssg => const SvgGenImage('assets/images/ssg.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [doosan, hanwha, kia, kiwoom, kt, lg, logo, lotte, nc, samsung, ssg];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
