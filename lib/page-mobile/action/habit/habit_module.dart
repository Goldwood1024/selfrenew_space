import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/model/habit_underway.dart';
import 'package:selfrenew_space/model/sleek_count.dart';
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
  final List<TipChip> options = Global.getTipChips();

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
          ChipEmptyV2(
            options: options,
            onPressed: (_) {
              TipChip chip = options
                  .firstWhere((element) => element.value == _.toString());
              Routers.pushParams(Routers.habitForm, {
                "key": chip.value,
                "title": chip.title,
              });
            },
          ),
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
  static final HabitRepository habitRepository = HabitRepository();
  final DateTime now = DateTime.now();

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
        final HabitUnderway underway = data[index];
        SleekCount sleekCount = underway.getSleekCount(now);
        return HabitTile(
          title: data[index].title,
          topRadius: index == 0,
          bottomRadius: index == data.length - 1,
          leading: data[index].icons.icon,
          color: data[index].icons.color,
          trailing: SleekCounter(
            onPressed: (_) async {
              await habitRepository.insertHabitClickAndUpdate(
                data[index].targetModel.clickCount,
                DatetimeUtil.getDateYMD(_),
                data[index].id,
              );
            },
            dateTime: now,
            min: data[index].targetModel.min,
            max: data[index].targetModel.max,
            value: sleekCount.value,
            fail: sleekCount.fail,
          ),
        );
      },
    );
  }
}
