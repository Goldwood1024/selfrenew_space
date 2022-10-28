import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusModule extends StatefulWidget {
  const FocusModule({super.key});

  @override
  State<StatefulWidget> createState() => _FocusModuleState();
}

class _FocusModuleState extends State<FocusModule> {
  late bool show = true;

  List<String> tags = [];
  List<TipChip> options = [
    TipChip('2', '喝水喝水喝水', 'assets/icons/算盘.png'),
    TipChip('1', '吃啥', 'assets/icons/用药.png'),
  ];

  @override
  void initState() {
    super.initState();
    show = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MobileModule(
        title: '专注',
        onPressed: () {
          Routers.go(Routers.focusHome);
        },
        child: show ? const FocusActionEmpty() : const FocusActionDataList(),
      ),
    );
  }
}

class FocusActionEmpty extends StatefulWidget {
  const FocusActionEmpty({super.key});

  @override
  State<StatefulWidget> createState() => _FocusActionEmptyState();
}

class _FocusActionEmptyState extends State<FocusActionEmpty> {
  List<String> tags = [];
  List<TipChip> options = [
    TipChip('1', '吃啥', 'assets/icons/出差.png'),
    TipChip('3', '喝水水', 'assets/icons/算盘.png'),
    TipChip('5', '喝水水喝水', 'assets/icons/算盘.png'),
    TipChip('4', '喝水喝水', 'assets/icons/算盘.png'),
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

class FocusActionDataList extends StatefulWidget {
  const FocusActionDataList({super.key});

  @override
  State<StatefulWidget> createState() => _FocusActionDataListState();
}

class _FocusActionDataListState extends State<FocusActionDataList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return FocusTile(
            topRadius: true,
            bottomRadius: true,
            title: '专注一下',
            leading: 'assets/icons/浴盆.svg',
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
          );
        },
      ),
    );
  }
}
