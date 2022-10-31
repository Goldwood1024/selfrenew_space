import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:selfrenew_space/util/mail_util.dart';

class MobileSetting extends StatefulWidget {
  const MobileSetting({super.key});

  @override
  State<StatefulWidget> createState() => _MobileSettingState();
}

class _MobileSettingState extends State<MobileSetting> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CupertinoSliverNavigationBar(
              heroTag: const Hero(tag: 'MobileSetting', child: SPHelper.empty),
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              largeTitle: Text(
                '设置',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.labelSmall?.color,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SPHelper.getHeightBox(SPHelper.gapDp12),
              SimpleTile(
                leading: Icon(
                  CupertinoIcons.slowmo,
                  size: SPHelper.settingIconSize,
                  color: Theme.of(context).primaryColor,
                ),
                title: '主题',
                topRadius: true,
                onPressed: () {
                  Routers.go(Routers.themeSetting);
                },
              ),
              SimpleTile(
                leading: Icon(
                  CupertinoIcons.app_badge,
                  size: SPHelper.settingIconSize,
                  color: Theme.of(context).primaryColor,
                ),
                title: '通知',
                onPressed: () {
                  Routers.go(Routers.notification);
                },
              ),
              SimpleTile(
                leading: Icon(
                  CupertinoIcons.ellipsis,
                  size: SPHelper.settingIconSize,
                  color: Theme.of(context).primaryColor,
                ),
                title: '更多',
                bottomRadius: true,
                showDivider: false,
              ),
              SPHelper.getHeightBox(SPHelper.gapDp12),
              SimpleTile(
                leading: const Icon(
                  Icons.mail_outline,
                  size: SPHelper.settingIconSize,
                  color: CupertinoColors.systemYellow,
                ),
                title: '意见反馈',
                topRadius: true,
                onPressed: () {
                  /// 发送邮件
                  MailUtil.sendFeedBack2Developers(context);
                },
              ),
              SimpleTile(
                leading: const Icon(
                  CupertinoIcons.star_circle_fill,
                  size: SPHelper.settingIconSize,
                ),
                title: '给予好评',
                onPressed: () {
                  AppStoreUtil.openAppStore();
                },
              ),
              SimpleTile(
                leading: const Icon(
                  CupertinoIcons.info,
                  size: SPHelper.settingIconSize,
                ),
                title: '关于',
                bottomRadius: true,
                showDivider: false,
                trailing: const Text(
                  '1.0.0',
                  style: TextStyle(
                    fontSize: SPHelper.fontSp18,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                onPressed: () {
                  Routers.go(Routers.about);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
