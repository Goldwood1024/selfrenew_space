import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class FocusModule extends StatefulWidget {
  const FocusModule({super.key});

  @override
  State<StatefulWidget> createState() => _FocusModuleState();
}

class _FocusModuleState extends State<FocusModule> {
  final show = true;

  List<String> tags = [];
  List<TipChip> options = [
    TipChip('2', '喝水喝水喝水', 'assets/icons/算盘.png'),
    TipChip('1', '吃啥', 'assets/icons/用药.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MobileModule(
        title: '专注',
        onPressed: () {
          Routers.go(Routers.focusHome);
        },
        child: show
            ? Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SPHelper.getHeightBox(16),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Text(
                        '用专注和活力来激励自己',
                        style: TextStyleMode.tipTextStyle(context),
                      ),
                    ),
                    SPHelper.getHeightBox(14),
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
                          color: CupertinoColors.systemGrey,
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
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  FocusTile(
                    topRadius: true,
                    bottomRadius: true,
                    title: '专注一下',
                    leading: Container(
                      child: SvgPicture.asset(
                        'assets/icons/浴盆.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
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
                  ),
                ],
              ),
      ),
    );
  }
}
