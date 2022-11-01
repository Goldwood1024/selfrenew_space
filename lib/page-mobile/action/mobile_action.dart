import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class MobileAction extends StatefulWidget {
  const MobileAction({super.key});

  @override
  State<StatefulWidget> createState() => _MobileActionState();
}

class _MobileActionState extends State<MobileAction> {
  late ScrollController _nestedScrollController;
  late bool _showWeek;

  @override
  void initState() {
    super.initState();

    _nestedScrollController = ScrollController();

    // 显示星期
    _showWeek = false;
    _nestedScrollController.addListener(() {
      if (!_showWeek && _nestedScrollController.offset > SPHelper.gapDp42) {
        setState(() {
          _showWeek = true;
        });
      }

      if (_nestedScrollController.offset <= SPHelper.gapDp42) {
        setState(() {
          _showWeek = false;
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
              backgroundColor: Colors.transparent,
              leading: _showWeek
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
              largeTitle: Text(
                '今日',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.labelSmall?.color,
                ),
              ),
              trailing: ActionIconBtn(
                icon: Icon(
                  Icons.more_horiz_sharp,
                  color: Theme.of(context).textTheme.labelSmall!.color,
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
