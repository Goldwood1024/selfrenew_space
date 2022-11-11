import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/model/habit_underway.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitModule extends StatefulWidget {
  const HabitModule({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HabitModuleState();
}

class _HabitModuleState extends State<HabitModule> {
  @override
  void initState() {
    super.initState();

    // 加载数据
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HabitProvider>(context, listen: false).reloadHabitUnderway();
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSettingProvider appSettingProvider = Provider.of(context);

    HabitProvider habitProvider = Provider.of(context);
    return appSettingProvider.hasModule('habit')
        ? MobileModule(
            title: '习惯',
            onPressed: () {
              Routers.push(Routers.habit);
            },
            child: habitProvider.hasUnderway()
                ? const HabitActionDataList()
                : const HabitActionEmpty(),
          )
        : SPHelper.empty;
  }
}

class HabitActionEmpty extends StatefulWidget {
  const HabitActionEmpty({super.key});

  @override
  State<StatefulWidget> createState() => _HabitActionEmptyState();
}

class _HabitActionEmptyState extends State<HabitActionEmpty> {
  List<String> tags = [];
  List<TipChip> options = [
    TipChip('1', '吃啥', 'assets/icons/出差.png'),
    TipChip('3', '喝水水', 'assets/icons/算盘.png'),
    TipChip('5', '喝水水喝水', 'assets/icons/算盘.png'),
    TipChip('4', '喝水喝水', 'assets/icons/算盘.png'),
    TipChip('2', '喝水喝水喝水', 'assets/icons/算盘.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SPHelper.getHeightBox(SPHelper.gapDp16),
          Padding(
            padding: EdgeInsets.zero,
            child: Text(
              '养成这些习惯，让生活变得有意义。',
              style: TextStyleMode.tipTextStyle(context),
            ),
          ),
          ChipEmpty(
            options: options,
            onPressed: (_) {
              TipChip chip = options
                  .firstWhere((element) => element.value == _.toString());
              Routers.pushParams(Routers.habitForm, {
                "key": chip.value,
                "title": chip.title,
              });
            },
          )
        ],
      ),
    );
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
    HabitProvider habitProvider = Provider.of(context);
    final List<HabitUnderway> data = habitProvider.getHabitUnderway();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return HabitTile(
          title: data[index].title,
          topRadius: index == 0,
          bottomRadius: index == data.length - 1,
          leading: data[index].icons.icon,
          color: data[index].icons.color,
          // trailing: SleekCounter(
          //   min: data[index].sleeks[data[index].sleeks.length - 2].min,
          //   max: data[index].sleeks[data[index].sleeks.length - 2].max,
          //   value: data[index].sleeks[data[index].sleeks.length - 2].value,
          //   fail: data[index].sleeks[data[index].sleeks.length - 2].fail,
          // ),
        );
      },
    );
  }
}
