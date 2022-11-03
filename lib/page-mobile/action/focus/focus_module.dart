import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusModule extends StatefulWidget {
  const FocusModule({super.key});

  @override
  State<StatefulWidget> createState() => _FocusModuleState();
}

class _FocusModuleState extends State<FocusModule> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSettingProvider appSettingProvider = Provider.of(context);
    FocusProvider focusProvider = Provider.of(context);

    return appSettingProvider.hasModule('focus')
        ? MobileModule(
            title: '专注',
            onPressed: () {
              Routers.push(Routers.focusHome);
            },
            child: focusProvider.hasUnderway()
                ? const FocusActionDataList()
                : const FocusActionEmpty(),
          )
        : SPHelper.empty;
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
    TipChip('5', '喝水水喝水', 'assets/icons/算盘.png'),
    TipChip('4', '喝水喝水', 'assets/icons/算盘.png'),
    TipChip('1', '吃啥', 'assets/icons/出差.png'),
    TipChip('3', '喝水水', 'assets/icons/算盘.png'),
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

class FocusActionDataList extends StatefulWidget {
  const FocusActionDataList({super.key});

  @override
  State<StatefulWidget> createState() => _FocusActionDataListState();
}

class _FocusActionDataListState extends State<FocusActionDataList> {
  @override
  Widget build(BuildContext context) {
    FocusProvider focusProvider = Provider.of(context);
    List<FocusUnderwayModel> data = focusProvider.getFocusUnderway();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FocusTile(
          topRadius: index == 0,
          bottomRadius: index == data.length - 1,
          title: data[index].title,
          leading: data[index].imagePath,
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
              child: SvgColorLoader(
                path: 'assets/icons/start.svg',
                size: SPHelper.sp(SPHelper.gapDp28),
              ),
            ),
          ),
        );
      },
    );
  }
}
