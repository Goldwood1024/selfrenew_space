import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  late bool firstOpenApp;

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

  @override
  Widget build(BuildContext context) {
    return firstOpenApp
        ? IntroductionScreen(
            globalBackgroundColor: Colors.white,
            isProgressTap: false,
            isBottomSafeArea: true,
            isTopSafeArea: true,
            onDone: () {
              Routers.go(Routers.mobileHome);
            },
            next: Icon(
              CupertinoIcons.forward,
              color: Theme.of(context).primaryColor,
            ),
            done: Text(
              '进入',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
            ),
            showSkipButton: true,
            skip: const Text(
              '跳过',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.secondaryLabel,
              ),
            ),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            pages: [
              PageViewModel(
                footer: Container(),
                title: "Fractional shares",
                body:
                    "Instead of having to buy an entire share, invest any amount you want.",
                image: _buildImage('img1.jpg'),
                decoration: PageDecoration(
                  footerPadding: EdgeInsets.zero,
                  bodyAlignment: Alignment.center,
                  imagePadding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  titleTextStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.labelSmall!.color!,
                  ),
                  bodyTextStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .color!
                        .withOpacity(.8),
                  ),
                ),
              ),
              PageViewModel(
                title: "Fractional shares",
                body:
                    "Instead of having to buy an entire share, invest any amount you want.",
                image: _buildImage('img2.jpg'),
                decoration: PageDecoration(
                  footerPadding: EdgeInsets.zero,
                  bodyAlignment: Alignment.center,
                  imagePadding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  titleTextStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.labelSmall!.color!,
                  ),
                  bodyTextStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .color!
                        .withOpacity(.8),
                  ),
                ),
              ),
            ],
          )
        : const MobileHome();
  }
}
