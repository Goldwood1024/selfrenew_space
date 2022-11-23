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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // 加载数据
      Provider.of<FocusProvider>(context, listen: false).reloadFocusModule();
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppSettingProvider appSettingProvider = Provider.of(context);
    final FocusProvider focusProvider = Provider.of(context);

    return Visibility(
      visible: appSettingProvider.hasModule('focus'),
      replacement: SPHelper.empty,
      child: MobileModule(
        title: '专注',
        onPressed: () {
          Routers.push(Routers.focusHome);
        },
        child: Visibility(
          visible: focusProvider.hasModuleUnderway(),
          replacement: const FocusActionEmpty(),
          child: const FocusActionDataList(),
        ),
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
  List<TipChip> options = Global.getFocusChips();

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
              TipChip chip = options.firstWhere(
                (element) => element.value == _.toString(),
              );

              Routers.pushParams(Routers.focusForm, {
                "key": chip.value,
                "title": chip.title,
                "type": chip.type,
              });
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
    List<FocusUnderwayModel> data = focusProvider.getFocusModuleUnderway();

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
          leading: data[index].iconModel.icon,
          color: data[index].iconModel.color,
          trailing: GestureDetector(
            onTap: () {
              SmartDialog.show(builder: (_) {
                return FocusTimer(
                  params: {
                    'id': data[index].id,
                  },
                );
              });
            },
            child: GestureDetector(
              onTap: () {
                SmartDialog.show(
                  alignment: Alignment.bottomCenter,
                  keepSingle: true,
                  useAnimation: true,
                  builder: (_) {
                    return FocusTimer(
                      params: {
                        'id': data[index].id,
                      },
                    );
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
