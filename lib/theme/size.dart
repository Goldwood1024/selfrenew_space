import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class SPHelper {
  // 图标大小
  static const double settingIconSize = 24.0;

  // 按钮圆角
  static const double btnRadiusSize = 12.0;
  static const double btnIconSize = 24.0;
  static const double backIconSize = 28.0;
  static const double btnSettingIconSize = 28.0;
  static const double btnFontSize = 16.0;
  static const double btnHeightSize = 42.0;
  static const double btnSmallSize = 62.0;
  static const double btnCircularSize = 80.0;
  static const double leadingWidth = 80.0;

  // 专注番茄大小
  static const double tomatoItemSize = 12.0;
  static const double appBarFontSize = 18.0;

  // 底部导航栏字体大小
  static const double navBarFontSize = 12.0;
  static const double calendarFontSize = 14.0;

  /// 字体大小
  /// 一级大标题
  static const double fontSp26 = 26.0;

  // 二级小标题
  static const double fontSp18 = 18.0;

  // 正文标题
  static const double fontSp16 = 16.0;

  /// 正文副标题
  static const double fontSp14 = 14.0;

  // 内容文字
  static const double fontSp12 = 12.0;

  // 提示文字
  static const double fontSp10 = 10.0;

  // 过渡大小
  static const double fontSp24 = 24.0;
  static const double fontSp20 = 20.0;
  static const double fontSp17 = 17.0;

  static const double gapDp4 = 4;
  static const double gapDp5 = 5;
  static const double gapDp8 = 8;
  static const double gapDp10 = 10;
  static const double gapDp12 = 12;
  static const double gapDp14 = 14.0;
  static const double gapDp15 = 15;
  static const double gapDp16 = 16;
  static const double gapDp18 = 18;
  static const double gapDp20 = 20;
  static const double gapDp24 = 24;
  static const double gapDp28 = 28;
  static const double gapDp32 = 32;
  static const double gapDp38 = 38;
  static const double gapDp40 = 40;
  static const double gapDp44 = 44;
  static const double gapDp48 = 48;
  static const double gapDp50 = 50;
  static const double gapDp52 = 52;
  static const double gapDp56 = 56;
  static const double gapDp58 = 58;
  static const double gapDp62 = 62;
  static const double gapDp64 = 64;
  static const double gapDp68 = 68;
  static const double gapDp80 = 80;
  static const double gapDp120 = 120.0;
  static const double gapDp100 = 100.0;
  static const double gapDp124 = 124.0;
  static const double gapDp132 = 132.0;
  static const double gapDp148 = 148.0;

  static const Widget line = Divider();

  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget empty = SizedBox.shrink();

  /// 水平间隔
  static Widget getWidthBox(double value) {
    return SizedBox(width: width(value));
  }

  // 竖直间隔
  static Widget getHeightBox(double value) {
    return SizedBox(height: height(value));
  }

  static Widget getDefaultHeightBox() {
    return SizedBox(height: height(12));
  }

  static double get divider => height(2);

  /// 页面内边距
  static EdgeInsetsGeometry get pagePadding {
    return EdgeInsets.symmetric(
      horizontal: pageHorizontalPadding(),
      vertical: pageVerticalPadding(),
    );
  }

  static EdgeInsetsGeometry get pagePaddingHorizontal {
    return EdgeInsets.symmetric(
      horizontal: pageHorizontalPadding(),
    );
  }

  static EdgeInsetsGeometry get pagePaddingVertical {
    return EdgeInsets.symmetric(
      vertical: pageVerticalPadding(),
    );
  }

  /// 页面水平内边距
  static pageHorizontalPadding() => width(14);

  /// 页面垂直内边距
  static pageVerticalPadding() => width(12);

  ///列表item水平内边距
  static listHorizontalPadding() => width(14);

  ///列表item垂直内边距
  static listVerticalPadding() => width(8);

  static appBarHeight() => width(46);

  /// 获取 计算后的字体
  static sp(double v, {bool allowFontScalingSelf = false}) {
    return v.sp;
  }

  /// 获取 计算后的高度
  static height(double value) {
    return value.h;
  }

  /// 获取 计算后的宽度
  static width(double value) {
    return value.w;
  }

  /// 圆角
  static radius(double value) {
    return value.r;
  }

  static smallRadius() {
    return 12.r;
  }

  static mediumRadius() {
    return 24.r;
  }

  static bigRadius() {
    return 36.r;
  }

  /// 获取 计算后的屏幕高度
  static double get screenHeight {
    return 1.sh;
  }

  /// 获取 计算后的屏幕高度
  static double get screenWidth {
    return 1.sw;
  }

  static double? get scale {
    return ScreenUtil().pixelRatio;
  }

  static double get textScaleFactor {
    return ScreenUtil().textScaleFactor;
  }

  ///顶部导航栏高度= 状态栏高度 + Appbar高度
  static double get topBarHeight {
    return height(gapDp48);
  }

  static double get topSafeHeight {
    return ScreenUtil().statusBarHeight;
  }

  static double get bottomSafeHeight {
    return ScreenUtil().bottomBarHeight;
  }
}
