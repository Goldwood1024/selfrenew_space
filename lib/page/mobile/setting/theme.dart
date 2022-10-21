import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

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
          leading: const BackBtn(
            title: '设置',
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
                ),
              ),
            ],
          ),
        )
        // body: SafeArea(
        //   bottom: false,
        //   child: SettingsList(
        //     lightTheme: const SettingsThemeData(
        //       settingsListBackground: Colors.transparent,
        //     ),
        //     darkTheme: const SettingsThemeData(
        //       settingsListBackground: Colors.transparent,
        //     ),
        //     sections: [
        //       SettingsSection(
        //         title: const Text('系统主题'),
        //         tiles: <SettingsTile>[
        //           SettingsTile.navigation(
        //             leading: const Icon(
        //               CupertinoIcons.check_mark,
        //               size: SizeHelper.settingIconSize,
        //             ),
        //             title: const Text('跟随系统'),
        //             onPressed: (context) {},
        //             trailing: Container(),
        //           ),
        //           SettingsTile.navigation(
        //             leading: const Icon(
        //               CupertinoIcons.check_mark,
        //               size: SizeHelper.settingIconSize,
        //             ),
        //             title: const Text('浅色'),
        //             onPressed: (context) {},
        //             trailing: Container(),
        //           ),
        //           SettingsTile.navigation(
        //             leading: const Icon(
        //               CupertinoIcons.check_mark,
        //               size: SizeHelper.settingIconSize,
        //             ),
        //             title: const Text('深色'),
        //             onPressed: (context) {},
        //             trailing: Container(),
        //           )
        //         ],
        //       ),
        //       SettingsSection(
        //         title: const Text('主题色'),
        //         tiles: <SettingsTile>[
        //           SettingsTile.switchTile(
        //             title: SizedBox(
        //               child: Row(
        //                 children: List.generate(
        //                   colors.length,
        //                   (index) => ItemColor(
        //                     color: colors[index],
        //                     selected: true,
        //                     onTap: () {},
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             initialValue: false,
        //             onToggle: (bool value) {},
        //             trailing: Container(),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
