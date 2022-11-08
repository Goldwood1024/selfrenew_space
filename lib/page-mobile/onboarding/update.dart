import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<StatefulWidget> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomButtonColor: Theme.of(context).primaryColor,
      onPressedOnLastPage: () {
        Navigator.of(context).pop();
      },
      bottomButtonChild: const Text('继续'),
      pages: [
        WhatsNewPage(
          title: const Text("最近更新"),
          features: [
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.mail,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('Found Events'),
              description: const Text(
                'Siri suggests events found in Mail, Messages, and Safari, so you can add them easily, such as flight reservations and hotel bookings.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.time,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('Time to Leave'),
              description: const Text(
                "Calendar uses Apple Maps to look up locations, traffic conditions, and transit options to tell you when it's time to leave.",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
