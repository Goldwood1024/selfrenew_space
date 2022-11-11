import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/model/habit_lib.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:selfrenew_space/theme/global.dart';

class HabitLib extends StatefulWidget {
  final Map<String, dynamic> params;

  const HabitLib({
    super.key,
    required this.params,
  });

  @override
  State<StatefulWidget> createState() => _HabitLibState();
}

class _HabitLibState extends State<HabitLib> {
  late List<HabitLibModel> habits = [];
  late bool good = false;

  @override
  void initState() {
    super.initState();
    good = widget.params['good'] == '1' ? true : false;

    habits = Global.getHabit(good);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.topBarHeight,
        leading: BackBtn(
          title: '习惯',
          onPressed: () {
            Routers.pop();
          },
        ),
        leadingWidth: 80,
        title: AppBarText(
          title: good ? '创建好习惯' : '消灭坏习惯',
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 100),
              child: SmartGridView(
                tileWidth: 150,
                tileHeight: 180,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                children: List.generate(
                  habits.length,
                  (index) => Card(
                    elevation: 0,
                    color: Theme.of(context).backgroundColor,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Routers.pushParams(Routers.habitForm, {
                          "key": habits[index].key,
                        });
                      },
                      child: GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                    child: SvgPicture.asset(
                                      habits[index].iconModel.icon,
                                      width: SPHelper.width(24),
                                      height: SPHelper.height(24),
                                    ),
                                  ),
                                  Text(
                                    habits[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: SPHelper.sp(SPHelper.fontSp18),
                                      color: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SPHelper.empty),
                              Text(
                                habits[index].hearten,
                                style: TextStyle(
                                  fontSize: SPHelper.sp(SPHelper.fontSp14),
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .color,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: SPHelper.height(100),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 12, 12, 32),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Routers.pushParams(
                        Routers.habitForm,
                        {},
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        0,
                      ),
                      width: SPHelper.width(180),
                      height: SPHelper.height(52),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(
                          SPHelper.smallRadius(),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '自定义习惯',
                            style: TextStyle(
                              fontSize: SPHelper.sp(SPHelper.fontSp18),
                              color: CupertinoColors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            size: SPHelper.sp(SPHelper.fontSp24),
                            color: CupertinoColors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
