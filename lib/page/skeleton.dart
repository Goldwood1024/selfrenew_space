import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformUtil.isDesktop() ? const DesktopHome() : const MobileHome();
  }
}
