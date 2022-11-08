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
                color: kDarkBlueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            controllerColor: Theme.of(context).primaryColor,
            totalPage: 3,
            headerBackgroundColor: Colors.white,
            pageBackgroundColor: Colors.white,
            imageHorizontalOffset:
                MediaQuery.of(context).size.width / 2 - width / 2,
            background: [
              Align(
                child: Image.asset(
                  'assets/splash/img1.jpg',
                  width: width,
                  height: width,
                ),
              ),
              Image.asset(
                'assets/splash/img2.jpg',
                height: width,
                width: width,
              ),
              Image.asset(
                'assets/splash/img3.jpg',
                height: width,
                width: width,
              ),
            ],
            speed: 1,
            pageBodies: const [
              BoardingBodyPage(
                title: 'On your way...',
                bodyText:
                    'to find the perfect looking Onboarding for your app?',
              ),
              BoardingBodyPage(
                title: 'You’ve reached your destination.',
                bodyText: 'Sliding with animation',
              ),
              BoardingBodyPage(
                title: 'Start now!',
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

  final Color kDarkBlueColor = const Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 480,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kDarkBlueColor,
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
            style: const TextStyle(
              color: Colors.black26,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
