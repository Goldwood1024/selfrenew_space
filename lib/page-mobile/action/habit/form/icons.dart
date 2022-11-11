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
    '#ff470c',
    '#ff171c',
    '#f9429c',
    '#001e38',
    '#c63dd7',
    '#11cd07',
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
    selectedColor = '#11cd07';
    selectedImage = '';

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HabitFormProvider habitFormProvider = Provider.of(context);
      IconModel iconModel = habitFormProvider.getIconModel();

      selectedColor = iconModel.color;
      selectedImage = iconModel.icons;
    });
  }

  @override
  Widget build(BuildContext context) {
    HabitFormProvider habitFormProvider = Provider.of(context);
    HabitFormProvider update = Provider.of(context, listen: false);

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
              update.updateIconModel(selectedImage, selectedColor);

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
            FormCard(
              title: '颜色',
              titleTrailing: SPHelper.empty,
              fontWeight: FontWeight.w500,
              child: SizedBox(
                height: SPHelper.height(130),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: SPHelper.listHorizontalPadding(),
                  crossAxisSpacing: SPHelper.listHorizontalPadding(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    colors.length,
                    (index) => HabitAccentColor(
                      color: colors[index],
                      selected: colors[index] == selectedColor,
                      onChange: (_) {
                        setState(() {
                          selectedColor = _;
                        });
                      },
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
                    image.length,
                    (index) => HabitAccentImage(
                      image: image[index],
                      selectedColor: selectedColor,
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
