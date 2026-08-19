library;

import 'dart:ui' show FlutterView;

import 'package:flutter/widgets.dart';

enum DeviceType { phone, tablet, largeTablet }

const double kTabletBreakpoint = 520;
const double kLargeTabletBreakpoint = 840;

const double kExpandedWidthBreakpoint = 840;

DeviceType deviceTypeFromShortestSide(double shortestSide) {
  if (shortestSide >= kLargeTabletBreakpoint) return DeviceType.largeTablet;
  if (shortestSide >= kTabletBreakpoint) return DeviceType.tablet;
  return DeviceType.phone;
}

DeviceType deviceTypeOf(BuildContext context) {
  final display = View.of(context).display;
  final shortestSide =
      (display.size / display.devicePixelRatio).shortestSide;
  return deviceTypeFromShortestSide(shortestSide);
}

bool isPhoneView(FlutterView view) {
  final display = view.display;
  final size = display.size / display.devicePixelRatio;
  if (size.isEmpty) return true;
  return size.shortestSide < kTabletBreakpoint;
}

extension ResponsiveContext on BuildContext {
  DeviceType get deviceType => deviceTypeOf(this);
  bool get isPhone => deviceType == DeviceType.phone;
  bool get isTablet => deviceType != DeviceType.phone;
  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  bool get isExpandedWidth =>
      MediaQuery.sizeOf(this).width >= kExpandedWidthBreakpoint;

  bool get useTwoPane => isTablet && isExpandedWidth;

  T responsive<T>({required T phone, T? tablet, T? largeTablet}) {
    switch (deviceType) {
      case DeviceType.largeTablet:
        return largeTablet ?? tablet ?? phone;
      case DeviceType.tablet:
        return tablet ?? phone;
      case DeviceType.phone:
        return phone;
    }
  }
}

class ResponsiveDesign {
  const ResponsiveDesign._();

  static const Size phone = Size(375, 812);
  static const Size tablet = Size(600, 960);
  static const Size largeTablet = Size(720, 1024);

  static Size _baseFor(double shortestSide) {
    switch (deviceTypeFromShortestSide(shortestSide)) {
      case DeviceType.largeTablet:
        return largeTablet;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.phone:
        return phone;
    }
  }

  static Size designSizeFor(Size size) {
    final base = _baseFor(size.shortestSide);
    return size.width >= size.height
        ? Size(base.height, base.width)
        : base;
  }
}

int gridColumnsFor(
  BuildContext context, {
  int phone = 2,
  int? tablet,
  int? largeTablet,
}) {
  return context.responsive(
    phone: phone,
    tablet: tablet ?? phone * 2,
    largeTablet: largeTablet ?? phone * 2 + 1,
  );
}
