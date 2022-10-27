import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/core/form_card.dart';

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
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '习惯图标',
        ),
        leadingWidth: 120,
        actions: [
          ActionBtn(
            onPressed: () {
              Navigator.pop(context);
            },
            title: '确定',
          )
        ],
      ),
      body: Padding(
        padding: SPHelper.pagePadding,
        child: ListView(
          children: [
            FormCard(
              title: '颜色',
              titleTrailing: SPHelper.empty,
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
            FormCard(
              title: '图标',
              titleTrailing: SPHelper.empty,
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
