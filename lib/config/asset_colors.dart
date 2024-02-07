import 'dart:ui';

class AssetColors {
  static const Color inkLighter = Color(0XFF72777A);
  static const Color inkLight = Color(0xFF6C7072);
  static const Color inkBase = Color(0XFF404446);
  static const Color inkDark = Color(0XFF303437);
  static const Color inkDarker = Color(0XFF202325);
  static const Color inkDarkest = Color(0xFF131214);

  static const Color skyLightest = Color(0XFFF7F9FA);
  static const Color skyLighter = Color(0XFFF2F4F5);
  static const Color skyLight = Color(0XFFE3E5E5);
  static const Color skyBase = Color(0XFFCDCFD0);
  static const Color skyDark = Color(0XFF979C9E);

  static const Color primaryLightest = Color(0XFFE7E7FF);
  static const Color primaryLighter = Color(0xFFC6C4FF);
  static const Color primaryLight = Color(0xFF9990FF);
  static const Color primaryBase = Color(0XFF6B4EFF);
  static const Color primaryDarkest = Color(0XFF5538EE);

  static const Color redLightest = Color(0XFFFFE5E5);
  static const Color redLighter = Color(0xFFFF9898);
  static const Color redLight = Color(0xFFFF6D6D);
  static const Color redBase = Color(0XFFFF5247);
  static const Color redDarkest = Color(0XFFD3180C);

  static const Color greenLightest = Color(0XFFECFCE5);
  static const Color greenLighter = Color(0xFF7DDE86);
  static const Color greenLight = Color(0xFF4CD471);
  static const Color greenBase = Color(0XFF23C16B);
  static const Color greenDarkest = Color(0XFF198155);

  static const Color yellowLightest = Color(0XFFFFEFD7);
  static const Color yellowLighter = Color(0xFFFFD188);
  static const Color yellowLight = Color(0xFFFFC462);
  static const Color yellowBase = Color(0XFFFFB323);
  static const Color yellowDarkest = Color(0XFFA05E03);

  static const Color blueLightest = Color(0XFFC9F0FF);
  static const Color blueLighter = Color(0xFF9BDCFD);
  static const Color blueLight = Color(0xFF6EC2FB);
  static const Color blueBase = Color(0XFF48A7F8);
  static const Color blueDarkest = Color(0XFF0065D0);

  static const Color facebookBase = Color(0XFF0078FF);
  static const Color facebookDark = Color(0XFF0067DB);

  static const Color twitterBase = Color(0XFF1DA1F2);
  static const Color twitterDark = Color(0XFF0C90E1);

  static const Color primaryColor = Color(0XFF6B4EFF);
  static const Color secondaryColor = Color(0xFF898D8F);
  static const Color mutedColor = Color(0xFF6E7375);
  static const Color borderColor = Color(0xFFE6E9EB);

  static const Color redButton = Color(0XFFD85751);
  static const Color skyWhite = Color(0XFFFFFFFF);
  static const Color bgSecondary = Color(0XFFDAE2EB);
  static const Color textGrey = Color(0XFFAFBCCB);
  static const Color bgHighLight = Color(0XFFECF0F3);

  static const Color pinkLightColor = Color.fromRGBO(255, 0, 123, 1);
  static const Color cyanColor = Color.fromRGBO(0, 161, 255, 1);
}

enum ColorKey {
  primary10,
  primary20,
  primary30,
  primary40,
  primary50,
  primary60,
  primary70,
  primary80,
  primary90,
  primary100,
  grey10,
  grey20,
  grey30,
  grey40,
  grey50,
  grey60,
  grey70,
  grey80,
  grey90,
  grey100,
  pastelBlue,
}

bool darkMode = false;

class AppColors {
  static Color getColor(ColorKey colorKey) {
    return darkMode
        ? DarkColors.getColor(enumToString(colorKey)) ??
            LightColors.getColor(enumToString(colorKey))
        : LightColors.getColor(enumToString(colorKey));
  }

  static String enumToString(Object enumValue) {
    return enumValue.toString().split('.').last;
  }
}

class LightColors {
  static const Map<String, Color> colors = {
    // primary colors
    'primary10': Color(0XFFF6F5FF),
    'primary20': Color(0XFFF0EDFF),
    'primary30': Color(0XFFDBD4FF),
    'primary40': Color(0XFFB4A6FF),
    'primary50': Color(0XFF907AFF),
    'primary60': Color(0XFF7257FF),
    'primary70': Color(0XFF5336E2),
    'primary80': Color(0XFF34228F),
    'primary90': Color(0XFF291F61),
    'primary100': Color(0XFF130D33),

    // neutral colors
    'grey10': Color(0XFFF4F6F7),
    'grey20': Color(0XFFE6E9EB),
    'grey30': Color(0XFFDADDDE),
    'grey40': Color(0XFFC1C4C6),
    'grey50': Color(0XFF898D8F),
    'grey60': Color(0XFF6E7375),
    'grey70': Color(0XFF53575A),
    'grey80': Color(0XFF2F3133),
    'grey90': Color(0XFF1F2224),
    'grey100': Color(0XFF131214),

    // other colors
    'pastelBlue': Color(0XFFAFBCCB),
  };

  static Color getColor(String colorKey) {
    return colors[colorKey] ?? const Color(0XFF000000);
  }
}

class DarkColors {
  static const Map<String, Color> colors = {
    'primary20': Color(0XFF291F61),
    'primary30': Color(0XFF34228F),
    'primary40': Color(0XFF5336E2),
    'primary60': Color(0XFF7257FF),
    'primary70': Color(0XFFB4A6FF),
    'primary80': Color(0XFFDBD4FF),
    'primary90': Color(0XFFF0EDFF),
  };

  static Color? getColor(String colorKey) {
    return colors[colorKey];
  }
}
