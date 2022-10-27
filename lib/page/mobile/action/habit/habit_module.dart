import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class HabitModule extends StatefulWidget {
  const HabitModule({super.key});

  @override
  State<StatefulWidget> createState() => _HabitModuleState();
}

class _HabitModuleState extends State<HabitModule> {
  final show = true;

  List<String> tags = [];
  List<String> options = [
    '喝水',
    '锻炼身体',
    '早睡',
    '吃水果',
    '阅读',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MobileModule(
        title: '习惯',
        onPressed: () {
          Routers.go(Routers.habit);
        },
        child: show
            ? Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SPHelper.getHeightBox(16),
                    const Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        '养成这些习惯，让生活变得有意义',
                        style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    SPHelper.getHeightBox(14),
                    ChipsChoice.single(
                      padding: EdgeInsets.zero,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      value: tags,
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
                  HabitTile(
                    topRadius: true,
                    title: '冥想22333',
                    leading: SvgPicture.asset(
                      'assets/icons/浴盆.svg',
                      width: 24,
                      height: 24,
                    ),
                    trailing: const SleekCounter(
                      min: 0,
                      max: 10,
                      value: 2,
                      fail: false,
                    ),
                  ),
                  HabitTile(
                    bottomRadius: true,
                    title: '喝一杯水',
                    leading: SvgPicture.asset(
                      'assets/icons/浴盆.svg',
                      width: 24,
                      height: 24,
                    ),
                    trailing: const SleekCounter(
                      min: 0,
                      max: 10,
                      value: 22,
                      fail: false,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
