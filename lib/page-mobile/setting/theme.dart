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
    "#165DFF",
    "#F4AA11",
    "#303C7B",
    "#144E5A",
    "#CC0033",
    "#8B8B7A",
    "#458B00",
  ];

  @override
  void initState() {
    super.initState();
    systemThemes = false;
  }

  @override
  Widget build(BuildContext context) {
    AppSettingProvider appSettingProvider = Provider.of(context);
    AppSettingProvider appSettingProviderUpdate =
        Provider.of(context, listen: false);

    return ScaffoldGradientBackground(
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
            SimpleTile(
              leading: Icon(
                CupertinoIcons.dial,
                size: SPHelper.settingIconSize,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
              topRadius: true,
              title: '跟随系统',
              showArrow: false,
              onPressed: () {
                appSettingProviderUpdate.updateThemeMode(ThemeMode.system.name);
              },
              trailing: ThemeModeCheck(
                selected: ThemeMode.system == appSettingProvider.getThemeMode(),
              ),
            ),
            SimpleTile(
              leading: Icon(
                CupertinoIcons.sun_dust,
                size: SPHelper.settingIconSize,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
              title: '浅色',
              showArrow: false,
              onPressed: () {
                appSettingProviderUpdate.updateThemeMode(ThemeMode.light.name);
              },
              trailing: ThemeModeCheck(
                selected: ThemeMode.light == appSettingProvider.getThemeMode(),
              ),
            ),
            SimpleTile(
              leading: Icon(
                CupertinoIcons.sun_dust_fill,
                size: SPHelper.settingIconSize,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
              bottomRadius: true,
              showDivider: false,
              title: '深色',
              showArrow: false,
              onPressed: () {
                appSettingProviderUpdate.updateThemeMode(ThemeMode.dark.name);
              },
              trailing: ThemeModeCheck(
                selected: ThemeMode.dark == appSettingProvider.getThemeMode(),
              ),
            ),
            SPHelper.getDefaultHeightBox(),
            FormCard(
              title: '强调色',
              titleTrailing: SPHelper.empty,
              fontWeight: FontWeight.normal,
              child: SizedBox(
                height: SPHelper.height(SPHelper.gapDp32),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (_, i) {
                    return AccentColor(
                      onChange: (color) {
                        appSettingProviderUpdate.updateAccentColor(color);
                      },
                      selected:
                          colors[i] == appSettingProvider.getAccentColor(),
                      color: colors[i],
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
