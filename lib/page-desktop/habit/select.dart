import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:smart_grid_view_nls/smart_grid_view_nls.dart';

class HabitSelect extends StatefulWidget {
  const HabitSelect({super.key});

  @override
  State<StatefulWidget> createState() => _HabitSelectState();
}

class _HabitSelectState extends State<HabitSelect> {
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
        title: const AppBarText(
          title: '好习惯',
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
                  8,
                  (index) => Card(
                    elevation: 0,
                    color: Theme.of(context).backgroundColor,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Routers.push(Routers.habitForm);
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
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      12,
                                      0,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/浴盆.svg',
                                      width: SPHelper.width(24),
                                      height: SPHelper.height(24),
                                    ),
                                  ),
                                  Text(
                                    '喝水',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: SPHelper.sp(SPHelper.fontSp18),
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SPHelper.empty),
                              Text(
                                '没有一个冬天不可逾越，没有一个春天不会来临',
                                style: TextStyle(
                                  fontSize: SPHelper.sp(SPHelper.fontSp14),
                                  fontWeight: FontWeight.normal,
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
              child: Container(
                height: SPHelper.height(100),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 12, 12, 32),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Routers.push(Routers.habitForm);
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
