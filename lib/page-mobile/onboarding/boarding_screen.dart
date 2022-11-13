import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final double width = 400;
  final Color kDarkBlueColor = const Color(0xFF053149);
  late bool firstOpenApp;

  @override
  void initState() {
    super.initState();
    firstOpenApp = true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    return firstOpenApp
        ? OnBoardingSlider(
            finishButtonText: '开始专注',
            onFinish: () {
              // TODO 写入文件
              Routers.go(Routers.mobileHome);
            },
            finishButtonColor: Theme.of(context).primaryColor,
            skipTextButton: Text(
              '跳过',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .color!
                    .withOpacity(.5),
                fontWeight: FontWeight.w600,
              ),
            ),
            controllerColor: Theme.of(context).primaryColor,
            totalPage: 3,
            headerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pageBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            background: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.1, 0, 0),
                child: SvgPicture.asset(
                  'assets/splash/每日习惯.svg',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.1, 0, 0),
                child: SvgPicture.asset(
                  'assets/splash/每日专注.svg',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.1, 0, 0),
                child: SvgPicture.asset(
                  'assets/splash/图表.svg',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
            speed: 1,
            pageBodies: const [
              BoardingBodyPage(
                title: '习惯养成',
                bodyText: 'Sliding with animation',
              ),
              BoardingBodyPage(
                title: '每日专注',
                bodyText:
                    'to find the perfect looking Onboarding for your app?',
              ),
              BoardingBodyPage(
                title: '丰富图表',
                bodyText:
                    'Where everything is possible and customize your onboarding.',
              ),
            ],
          )
        : const MobileHome();
  }
}

class BoardingBodyPage extends StatelessWidget {
  final String title;
  final String bodyText;

  const BoardingBodyPage({
    super.key,
    required this.title,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 480,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).textTheme.labelSmall!.color,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            bodyText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .color!
                  .withOpacity(.5),
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
