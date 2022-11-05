import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitIcons extends StatefulWidget {
  const HabitIcons({super.key});

  @override
  State<StatefulWidget> createState() => _HabitIconsState();
}

class _HabitIconsState extends State<HabitIcons> {
  late String selectedColor;
  late String selectedImage;

  final List<String> colors = [
    '#35b5ff',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#ff479c',
    '#001e38',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
    '#c6cdd7',
  ];

  final List<String> image = [
    'assets/icons/健身.svg',
    'assets/icons/读书.svg',
    'assets/icons/蜡笔.svg',
    'assets/icons/浴盆.svg',
  ];

  @override
  void initState() {
    super.initState();
    selectedColor = '#35b5ff';
    selectedImage = '#35b5ff';
  }

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
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            // FormCard(
            //   title: '颜色',
            //   titleTrailing: SPHelper.empty,
            //   fontWeight: FontWeight.w500,
            //   child: SizedBox(
            //     height: SPHelper.height(130),
            //     child: GridView.count(
            //       shrinkWrap: true,
            //       crossAxisCount: 3,
            //       mainAxisSpacing: SPHelper.listHorizontalPadding(),
            //       crossAxisSpacing: SPHelper.listHorizontalPadding(),
            //       scrollDirection: Axis.horizontal,
            //       children: List.generate(
            //         colors.length,
            //         (index) => HabitAccentColor(
            //           color: colors[index],
            //           selected: colors[index] == selectedColor,
            //           onChange: (_) {
            //             setState(() {
            //               selectedColor = _;
            //             });
            //           },
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
                    image.length,
                    (index) => HabitAccentImage(
                      image: image[index],
                      selected: image[index] == selectedImage,
                      onChange: (_) {
                        setState(() {
                          selectedImage = _;
                        });
                      },
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
