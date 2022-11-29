import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<StatefulWidget> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      InstallUpdateAppProvider installUpdateAppProvider =
          Provider.of(context, listen: false);
      await installUpdateAppProvider.updateUpdate(ConstPool.appVersion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomButtonColor: Theme.of(context).primaryColor,
      onPressedOnLastPage: () {
        Navigator.of(context).pop();
      },
      bottomButtonChild: const Text('继续'),
      pages: [
        WhatsNewPage(
          title: Text(
            "最近更新",
            style: TextStyle(
              color: Theme.of(context).textTheme.labelSmall!.color,
            ),
          ),
          features: [
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.timelapse,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: Text(
                '专注模式',
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
              ),
              description: Text(
                '专注模式有番茄钟、正计时、倒计时',
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .color!
                      .withOpacity(.5),
                ),
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.shield_lefthalf_fill,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: Text(
                '多主题',
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
              ),
              description: Text(
                "浅色、深色主题模式，支持主题色切换",
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .color!
                      .withOpacity(.5),
                ),
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.ellipsis,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: Text(
                '更多特性',
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
              ),
              description: Text(
                "新的功能正在开发中，敬请期待",
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .color!
                      .withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
