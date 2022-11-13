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
          title: Text(
            "最近更新",
            style: TextStyle(
              color: Theme.of(context).textTheme.labelSmall!.color,
            ),
          ),
          features: [
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.mail,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: Text(
                'Found Events',
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
              ),
              description: Text(
                'Siri suggests events found in Mail, Messages, and Safari, so you can add them easily, such as flight reservations and hotel bookings.',
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .color!
                      .withOpacity(.5),
                ),
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.time,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: Text(
                'Time to Leave',
                style: TextStyle(
                  color: Theme.of(context).textTheme.labelSmall!.color,
                ),
              ),
              description: Text(
                "Calendar uses Apple Maps to look up locations, traffic conditions, and transit options to tell you when it's time to leave.",
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .color!
                      .withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
