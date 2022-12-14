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
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
              ),
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
                  Routers.push(Routers.themeSetting);
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
                  Routers.push(Routers.notification);
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
                leading: Icon(
                  Icons.mail,
                  size: SPHelper.settingIconSize,
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
                title: '意见反馈',
                topRadius: true,
                onPressed: () {
                  /// 发送邮件
                  MailUtil.sendFeedBack2Developers(context);
                },
              ),
              SimpleTile(
                leading: Icon(
                  CupertinoIcons.star_circle,
                  size: SPHelper.settingIconSize,
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
                title: '给予好评',
                onPressed: () {
                  AppStoreUtil.openAppStore();
                },
              ),
              SimpleTile(
                leading: Icon(
                  CupertinoIcons.info,
                  size: SPHelper.settingIconSize,
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
                title: '关于',
                bottomRadius: true,
                showDivider: false,
                trailing:  Text(
                  '1.0.0',
                  style: TextStyleMode.trailingTextStyle(context),
                ),
                onPressed: () {
                  Routers.push(Routers.about);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
