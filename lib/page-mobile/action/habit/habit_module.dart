import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitModule extends StatefulWidget {
  const HabitModule({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HabitModuleState();
}

class _HabitModuleState extends State<HabitModule> {
  late bool _showModule = false;
  late bool _isEmpty = false;

  @override
  void initState() {
    super.initState();

    _showModule = true;
    _isEmpty = true;
  }

  @override
  Widget build(BuildContext context) {
    AppSettingProvider appSettingProvider = Provider.of(context);
    return appSettingProvider.getModule('habit')
        ? MobileModule(
            title: '习惯',
            onPressed: () {
              Routers.go(Routers.habit);
            },
            child: _isEmpty
                ? const HabitActionEmpty()
                : const HabitActionDataList(),
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
              print(_);
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
