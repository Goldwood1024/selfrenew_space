import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:selfrenew_space/state/focus_provider.dart';

class ManagerProvider extends StatefulWidget {
  final Widget child;

  const ManagerProvider({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _ManagerProviderState();
}

class _ManagerProviderState extends State<ManagerProvider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MobileBottomBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppSettingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HabitProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FocusProvider(),
        ),
      ],
      child: widget.child,
    );
  }
}
