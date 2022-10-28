import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/model/tip_chip.dart';

class HabitModule extends StatefulWidget {
  const HabitModule({super.key});

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
    return _showModule
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
              '养成这些习惯，让生活变得有意义',
              style: TextStyleMode.tipTextStyle(context),
            ),
          ),
          SPHelper.getHeightBox(SPHelper.gapDp20),
          ChipsChoice.single(
            padding: EdgeInsets.zero,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            value: tags,
            spacing: SPHelper.width(SPHelper.gapDp14),
            runSpacing: SPHelper.width(SPHelper.gapDp14),
            choiceStyle: C2ChipStyle(
              height: SPHelper.height(SPHelper.gapDp48),
              backgroundColor: Colors.white,
              backgroundOpacity: 1,
              overlayColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.fromLTRB(
                  SPHelper.width(SPHelper.gapDp14), 0, 0, 0),
              foregroundSpacing: SPHelper.width(SPHelper.gapDp14),
              foregroundStyle: TextStyle(
                fontSize: SPHelper.sp(SPHelper.fontSp18),
                fontWeight: FontWeight.w500,
              ),
            ),
            placeholder: '无',
            wrapped: true,
            onChanged: (_) {
              print(_);
            },
            choiceLeadingBuilder: (item, v) {
              return SizedBox(
                width: SPHelper.width(SPHelper.gapDp24),
                height: SPHelper.height(SPHelper.gapDp24),
                child: Image(
                  image: item.avatarImage!,
                ),
              );
            },
            choiceItems: C2Choice.listFrom<String, TipChip>(
              source: options,
              value: (i, v) => v.value,
              label: (i, v) => v.title,
              avatarImage: (i, v) => AssetImage(v.image),
            ),
          ),
          SPHelper.getHeightBox(SPHelper.gapDp20),
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
