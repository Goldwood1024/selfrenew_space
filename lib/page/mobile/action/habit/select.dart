import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
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
        leading: const BackBtn(
          title: '习惯',
        ),
        leadingWidth: 80,
        title: Text(
          '习惯库',
          style: TextStyle(
            color: Theme.of(context).textTheme.displayLarge?.color,
            fontSize: 18,
          ),
        ),
        actions: [],
      ),
      body: Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        body: Padding(
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                child: SmartGridView(
                  tileWidth: 150,
                  tileHeight: 150,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  children: List.generate(
                    40,
                    (index) => Card(
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
                                      'assets/icons/浴盆.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  const Text(
                                    '喝水',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SPHelper.empty),
                              const Text(
                                '没有一个冬天不可逾越，没有一个春天不会来临',
                                style: TextStyle(
                                  fontSize: 16,
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
              Positioned(
                bottom: 0,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 12, 0, 32),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          0,
                          20,
                          0,
                        ),
                        width: 180,
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
                          children: const [
                            Text(
                              '自定义习惯',
                              style: TextStyle(
                                fontSize: 18,
                                color: CupertinoColors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_outlined,
                              size: 28,
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
      ),
    );
  }
}
