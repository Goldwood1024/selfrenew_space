import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          MobileAction(),
          MobileSetting(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: SPHelper.gapDp28,
        elevation: 0.0,
        scaleCurve: Curves.linear,
        selectedColor: Theme.of(context).primaryColor,
        strokeColor: Colors.transparent,
        backgroundColor: Colors.white,
        borderRadius: Radius.circular(SPHelper.smallRadius()),
        items: [
          CustomNavigationBarItem(
              icon: const Icon(Icons.water_drop),
              selectedIcon: const Icon(Icons.water_drop),
              title: const Text('计划')),
          CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.gear),
              selectedIcon: const Icon(CupertinoIcons.gear_solid),
              title: const Text('设置')),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
          });
        },
      ),
    );
  }
}
