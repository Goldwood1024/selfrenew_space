import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  late bool firstOpenApp;
  final double width = 400;

  @override
  void initState() {
    super.initState();
    firstOpenApp = true;
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      'assets/splash/$assetName',
      width: width,
    );
  }

  final Color kDarkBlueColor = const Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    // return firstOpenApp
    //     ? IntroductionScreen(
    //         globalBackgroundColor: Colors.white,
    //         isProgressTap: false,
    //         isBottomSafeArea: true,
    //         isTopSafeArea: true,
    //         next: Icon(
    //           CupertinoIcons.forward,
    //           color: Theme.of(context).primaryColor,
    //         ),
    //         done: Text(
    //           '退出',
    //           style: TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.w600,
    //             color: Theme.of(context).textTheme.labelSmall!.color,
    //           ),
    //         ),
    //         onDone: () {
    //           // TODO 写入文件
    //           Routers.go(Routers.mobileHome);
    //         },
    //         showSkipButton: false,
    //         skip: const Text(
    //           '跳过',
    //           style: TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.w600,
    //             color: CupertinoColors.secondaryLabel,
    //           ),
    //         ),
    //         controlsMargin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
    //         pages: [
    //           PageViewModel(
    //             footer: Container(),
    //             title: "Fractional shares",
    //             body:
    //                 "Instead of having to buy an entire share, invest any amount you want.",
    //             image: _buildImage('img1.jpg'),
    //             decoration: PageDecoration(
    //               footerPadding: EdgeInsets.zero,
    //               bodyAlignment: Alignment.center,
    //               imagePadding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
    //               titleTextStyle: TextStyle(
    //                 fontSize: 20.0,
    //                 fontWeight: FontWeight.bold,
    //                 color: Theme.of(context).textTheme.labelSmall!.color!,
    //               ),
    //               bodyTextStyle: TextStyle(
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.normal,
    //                 color: Theme.of(context)
    //                     .textTheme
    //                     .labelSmall!
    //                     .color!
    //                     .withOpacity(.8),
    //               ),
    //             ),
    //           ),
    //           PageViewModel(
    //             title: "Fractional shares",
    //             body:
    //                 "Instead of having to buy an entire share, invest any amount you want.",
    //             image: _buildImage('img2.jpg'),
    //             decoration: PageDecoration(
    //               footerPadding: EdgeInsets.zero,
    //               bodyAlignment: Alignment.center,
    //               imagePadding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
    //               titleTextStyle: TextStyle(
    //                 fontSize: 20.0,
    //                 fontWeight: FontWeight.bold,
    //                 color: Theme.of(context).textTheme.labelSmall!.color!,
    //               ),
    //               bodyTextStyle: TextStyle(
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.normal,
    //                 color: Theme.of(context)
    //                     .textTheme
    //                     .labelSmall!
    //                     .color!
    //                     .withOpacity(.8),
    //               ),
    //             ),
    //           ),
    //           PageViewModel(
    //             title: "Fractional shares",
    //             body:
    //                 "Instead of having to buy an entire share, invest any amount you want.",
    //             image: _buildImage('img3.jpg'),
    //             decoration: PageDecoration(
    //               footerPadding: EdgeInsets.zero,
    //               bodyAlignment: Alignment.center,
    //               imagePadding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
    //               titleTextStyle: TextStyle(
    //                 fontSize: 20.0,
    //                 fontWeight: FontWeight.bold,
    //                 color: Theme.of(context).textTheme.labelSmall!.color!,
    //               ),
    //               bodyTextStyle: TextStyle(
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.normal,
    //                 color: Theme.of(context)
    //                     .textTheme
    //                     .labelSmall!
    //                     .color!
    //                     .withOpacity(.8),
    //               ),
    //             ),
    //           ),
    //         ],
    //       )
    //     : const MobileHome();

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
