import 'package:get/get.dart';

class AppSizes {
  // text sizes
  static const double lightTextSize = 10.0;
  static const double smallTextSize = 12.0;
  static const double mediumTextSize = 14.0;
  static const double largeTextSize = 16.0;
  static const double heavyTextSize = 18.0;
  static const double const20pxTextSize = 20.0;
  static const double const21pxTextSize = 21.0;

  // screen padding for phone
  static const double horizontalScreenPaddingPhone = 20.0;
  static const double verticalScreenPaddingPhone = 22.0;
  static const double contentPaddingPhone = 8.0;

  // screen padding for web
  static const double horizontalScreenPaddingWeb = 20.0;
  static const double verticalScreenPaddingWeb = 22.0;
  static const double contentPaddingWeb = 8.0;

  // web drawer specific screen padding
  // static const double headerMenuHeightWeb = 100;
  static const double headerMenuHeightWeb = 0;

  static const double masterScreenLeftPaddingWeb = 160;
  // static const double masterScreenTopPaddingWeb = 120;
  static const double masterScreenTopPaddingWeb = 20;

  static const double leftDrawerScreenPaddingWeb = 100;
  static const double candidateDashboardScreenLeftPadding = 60;

  static const double bodyText1SizePhone = 10.0;
  static const double bodySmallTextSizePhone = 12.0;
  static const double bodyMediumTextSizePhone = 14.0;
  static const double bodyLargeTextSizePhone = 16.0;
  static const double headLineLargeTextSizePhone = 18.0;

  static const double screenPaddingWeb = 18.0;

  // static const double contentPaddingWeb = 6.0;
  static const double bodyText1SizeWeb = 10.0;
  static const double bodySmallTextSizeWeb = 12.0;
  static const double bodyMediumTextSizeWeb = 14.0;
  static const double bodyLargeTextSizeWeb = 16.0;
  static const double headLineLargeTextSizeWeb = 18.0;

  static const double const22PxTextSizeWeb = 22.0;
  static const double const30PxTextSizeWeb = 30.0;



  static double getPhoneSize(double size) {
    return size * (Get.width / 428);
  }

  static double getWebSize(double size) {
    return size * (Get.width / 1920);
  }
}
