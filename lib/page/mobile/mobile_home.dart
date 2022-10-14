import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
        children: [
          Scaffold(
            appBar: AppBar(),
            body: Container(
              child: TextButton(
                onPressed: () {
                  showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    builder: (_) {
                      return Container();
                    },
                  );
                },
                child: Text('23123123'),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        // iconSize: ScreenHelper.sp(SizeHelper.gapDp28),
        elevation: 0.0,
        scaleCurve: Curves.linear,
        selectedColor: Theme.of(context).primaryColor,
        strokeColor: Colors.transparent,
        backgroundColor: Colors.white,
        // borderRadius: Radius.circular(ScreenHelper.bigRadius()),
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
          ),
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
