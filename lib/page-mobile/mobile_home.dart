import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome>
    with SingleTickerProviderStateMixin {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;

    // 加载数据
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      InstallUpdateAppProvider installUpdateAppProvider =
          Provider.of(context, listen: false);

      bool show = await installUpdateAppProvider.loadUpdate();
      if (show && mounted) {
        Future.delayed(const Duration(seconds: 3), () async {
          // 更新详情
          showCupertinoModalBottomSheet(
            context: context,
            builder: (_) => const Update(),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get mounted => super.mounted;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

    return ScaffoldGradientBackground(
      body: LazyLoadIndexedStack(
        index: _currentIndex,
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const Radius.circular(0),
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.water_drop),
            selectedIcon: const Icon(Icons.water_drop),
            title: Text(
              '计划',
              style: TextStyle(
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.shield),
            selectedIcon: const Icon(CupertinoIcons.shield_fill),
            title: Text(
              '设置',
              style: TextStyle(
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
