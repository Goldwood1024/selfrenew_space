import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/core/tile/habit_form_tile.dart';

import 'form.dart';

class HabitSelect extends StatefulWidget {
  const HabitSelect({super.key});

  @override
  State<StatefulWidget> createState() => _HabitSelectState();
}

class _HabitSelectState extends State<HabitSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        title: Text(
          '222',
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
          padding: SPHelper.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    20,
                    (index) => const HabitFormTile(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 12, 0, 32),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialWithModalsPageRoute(
                    //     builder: (context) => const HabitForm(),
                    //   ),
                    // );
                  },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
