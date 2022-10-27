import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  late ScrollController _nestedScrollController;
  late bool showWeek;

  @override
  void initState() {
    super.initState();

    _nestedScrollController = ScrollController();

    // 显示星期
    showWeek = false;
    _nestedScrollController.addListener(() {
      if (!showWeek && _nestedScrollController.offset > SPHelper.gapDp42) {
        setState(() {
          showWeek = true;
        });
      }

      if (_nestedScrollController.offset <= SPHelper.gapDp42) {
        setState(() {
          showWeek = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _nestedScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: ExtendedNestedScrollView(
        controller: _nestedScrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CupertinoSliverNavigationBar(
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              // border: const Border(
              //   bottom: BorderSide(
              //     color: Colors.transparent,
              //     width: 0.0,
              //   ),
              // ),
              leading: showWeek
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(
                        SPHelper.width(SPHelper.gapDp2),
                        SPHelper.width(SPHelper.gapDp10),
                        SPHelper.zero(),
                        SPHelper.zero(),
                      ),
                      child: Text(
                        DatetimeUtil.weekday(context),
                        style: TextStyleMode.leadingTextStyle(context),
                      ),
                    )
                  : SPHelper.empty,
              largeTitle: const Text(
                '今日',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: ActionIconBtn(
                icon: const Icon(
                  Icons.more_horiz_sharp,
                ),
                onPressed: () {
                  BottomDialog.showModalBottomSheet(
                    context,
                    const MobileActionBottom(),
                  );
                },
              ),
            )
          ];
        },
        body: Padding(
          padding: SPHelper.pagePaddingHorizontal,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              HabitModule(),
              FocusModule(),
            ],
          ),
        ),
      ),
    );
  }
}
