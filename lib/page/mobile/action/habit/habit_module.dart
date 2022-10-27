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
    '反省自己',
    '早睡',
    '阅读',
    '锻炼身体',
    '吃水果',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MobileModule(
        title: '日常习惯',
        onPressed: () {
          Routers.go(Routers.habit);
        },
        child: show
            ? Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(12),
                //   color: Colors.white,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SPHelper.getHeightBox(16),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                      child: Text(
                        '养成这些习惯，让生活变得有意义',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SPHelper.getHeightBox(8),
                    ChipsChoice.single(
                      value: tags,
                      spacing: 14,
                      runSpacing: 14,
                      choiceStyle: const C2ChipStyle(
                        height: 42,
                        backgroundColor: Colors.white,
                        backgroundOpacity: 1,
                      ),
                      wrapped: true,
                      onChanged: (_) {
                        print(_);
                      },
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options,
                        value: (i, v) => v,
                        label: (i, v) => v,
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
