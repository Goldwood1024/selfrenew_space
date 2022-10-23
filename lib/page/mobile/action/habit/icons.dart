import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/action/focus/focus_form_card.dart';

class HabitIcons extends StatefulWidget {
  const HabitIcons({super.key});

  @override
  State<StatefulWidget> createState() => _HabitIconsState();
}

class _HabitIconsState extends State<HabitIcons> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        title: Text(
          '习惯图标',
          style: TextStyle(
            color: Theme.of(context).textTheme.displayLarge?.color,
            fontSize: 18,
          ),
        ),
        leading: const BackBtn(
          title: '添加习惯',
        ),
        leadingWidth: 120,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '确定',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: SPHelper.pagePadding,
        child: ListView(
          children: [
            FocusFormCard(
              title: '颜色',
              fontWeight: FontWeight.w500,
              child: SizedBox(
                height: 120,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    24,
                    (index) => Container(
                      width: 40,
                      height: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SPHelper.getDefaultHeightBox(),
            FocusFormCard(
              title: '图标',
              fontWeight: FontWeight.w500,
              child: SizedBox(
                height: 220,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    40,
                    (index) => Container(
                      width: 40,
                      height: 40,
                      // color: Colors.black,
                      child: SvgPicture.asset(
                        'assets/icons/浴盆.svg',
                      ),
                    ),
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
