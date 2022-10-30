import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class ThemeSetting extends StatefulWidget {
  const ThemeSetting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  late bool systemThemes;
  static var colors = [
    "#303C7B",
    "#144E5A",
    "#FFA54F",
    "#CC0033",
    "#8B8B7A",
    "#458B00",
    "#4169E1",
  ];

  @override
  void initState() {
    super.initState();
    systemThemes = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        toolbarHeight: SPHelper.appBarHeight(),
        leading: BackBtn(
          title: '设置',
          onPressed: () {
            Routers.pop();
          },
        ),
        leadingWidth: 80,
        title: const AppBarText(
          title: '主题',
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            const SimpleTile(
              leading: Icon(
                CupertinoIcons.dial,
                size: SPHelper.settingIconSize,
              ),
              topRadius: true,
              title: '跟随系统',
              showArrow: false,
            ),
            const SimpleTile(
              leading: Icon(
                CupertinoIcons.sun_dust,
                size: SPHelper.settingIconSize,
              ),
              title: '浅色',
              showArrow: false,
            ),
            SimpleTile(
              leading: const Icon(
                CupertinoIcons.sun_dust_fill,
                size: SPHelper.settingIconSize,
              ),
              bottomRadius: true,
              title: '深色',
              showArrow: false,
              trailing: Icon(
                CupertinoIcons.check_mark_circled,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
            ),
            SPHelper.getDefaultHeightBox(),
            FormCard(
              title: '强调色',
              titleTrailing: SPHelper.empty,
              fontWeight: FontWeight.normal,
              child: SizedBox(
                height: 32,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (_, i) {
                    return AccentColor(
                      selected: true,
                      color: HexColor(colors[i]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
