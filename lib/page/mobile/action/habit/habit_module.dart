import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class HabitModule extends StatefulWidget {
  const HabitModule({super.key});

  @override
  State<StatefulWidget> createState() => _HabitModuleState();
}

class _HabitModuleState extends State<HabitModule> {
  late bool _showModule = false;
  late bool _isEmpty = false;

  List<String> tags = [];
  List<String> options = [
    '喝水',
    '锻炼身体',
    '早睡',
    '吃水果',
    '阅读',
  ];

  @override
  void initState() {
    super.initState();

    _showModule = true;
    _isEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    return _showModule
        ? MobileModule(
            title: '习惯',
            onPressed: () {
              Routers.go(Routers.habit);
            },
            child: _isEmpty
                ? Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SPHelper.getHeightBox(16),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Text(
                            '养成这些习惯，让生活变得有意义',
                            style: TextStyleMode.tipTextStyle(context),
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
                : const HabitActionDataList(),
          )
        : SPHelper.empty;
  }
}

class HabitActionDataList extends StatefulWidget {
  const HabitActionDataList({super.key});

  @override
  State<StatefulWidget> createState() => _HabitActionDataListState();
}

class _HabitActionDataListState extends State<HabitActionDataList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return HabitTile(
            title: '喝一杯水',
            topRadius: index == 0,
            bottomRadius: index == 0,
            leading: 'assets/icons/浴盆.svg',
            trailing: const SleekCounter(
              min: 0,
              max: 4,
              value: 1,
              fail: false,
            ),
          );
        },
      ),
    );
  }
}
