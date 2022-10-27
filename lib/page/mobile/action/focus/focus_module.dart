import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusModule extends StatefulWidget {
  const FocusModule({super.key});

  @override
  State<StatefulWidget> createState() => _FocusModuleState();
}

class _FocusModuleState extends State<FocusModule> {
  final show = true;

  List<String> tags = [];
  List<String> options = [
    '阅读',
    '深度工作',
    '冥想',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MobileModule(
        title: '专注',
        onPressed: () {
          Routers.go(Routers.focusHome);
        },
        child: show
            ? Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SPHelper.getHeightBox(16),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        '用专注和活力来激励自己',
                        style: TextStyleMode.tipTextStyle(context),
                      ),
                    ),
                    SPHelper.getHeightBox(14),
                    ChipsChoice.single(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      value: tags,
                      padding: EdgeInsets.zero,
                      spacing: 14,
                      runSpacing: 14,
                      choiceStyle: const C2ChipStyle(
                        height: 46,
                        backgroundColor: Colors.white,
                        backgroundOpacity: 1,
                        foregroundStyle: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.systemGrey,
                        ),
                        avatarBackgroundColor: Colors.white,
                        avatarForegroundColor: Colors.white,
                        avatarSize: Size(24, 23),
                        iconColor: Colors.white,
                        borderColor: Colors.white,
                        checkmarkColor: Colors.white,
                      ),
                      wrapped: true,
                      onChanged: (_) {
                        print(_);
                      },
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options,
                        value: (i, v) => v,
                        label: (i, v) => v,
                        avatarImage: (i, v) =>
                            const AssetImage('assets/icons/用药.png'),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  FocusTile(
                    topRadius: true,
                    bottomRadius: true,
                    title: '专注一下',
                    leading: Container(
                      child: SvgPicture.asset(
                        'assets/icons/浴盆.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        SmartDialog.show(builder: (_) {
                          return const FocusTimer();
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          SmartDialog.show(
                            alignment: Alignment.bottomCenter,
                            keepSingle: true,
                            useAnimation: true,
                            builder: (_) {
                              return const FocusTimer();
                            },
                          );
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Icon(
                          CupertinoIcons.play_circle_fill,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
