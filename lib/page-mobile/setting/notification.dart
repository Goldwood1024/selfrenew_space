import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/model/notice.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  openAppStore() {
    OpenStore.instance.open(
      appStoreId: '',
      appStoreIdMacOS: '',
    );
  }

  late bool select;

  @override
  void initState() {
    super.initState();
    select = false;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      String feedback = await FileStorage.readAsData(
          KeyPool.feedback, StorageType.applicationSupportDirectory);

      if (ObjectUtil.isEmpty(feedback)) {
        select = true;

        await FileStorage.createAsData(
            KeyPool.feedback, '1', StorageType.applicationSupportDirectory);
      } else {
        if (feedback == 1.toString()) {
          select = true;
        } else {
          select = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        toolbarHeight: SPHelper.appBarHeight(),
        leading: BackBtn(
          title: '设置',
          onPressed: () {
            Routers.pop();
          },
        ),
        leadingWidth: SPHelper.gapDp80,
        title: const AppBarText(
          title: '通知',
        ),
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            SPHelper.getDefaultHeightBox(),
            SimpleTile(
              leading: Icon(
                CupertinoIcons.bell,
                size: SPHelper.settingIconSize,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
              topRadius: true,
              title: '打卡音效',
              onPressed: () {
                BottomDialog.showModalBottomSheet(
                  context,
                  const SoundPage(
                    type: 1,
                  ),
                );
              },
            ),
            SimpleTile(
              leading: Icon(
                Icons.music_note_outlined,
                size: SPHelper.settingIconSize,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
              title: '专注提示音',
              onPressed: () {
                BottomDialog.showModalBottomSheet(
                  context,
                  const SoundPage(
                    type: 2,
                  ),
                );
              },
            ),
            SimpleTile(
              leading: Icon(
                Icons.vibration,
                size: SPHelper.settingIconSize,
                color: Theme.of(context).textTheme.labelSmall!.color,
              ),
              title: '震动',
              bottomRadius: true,
              showDivider: false,
              showArrow: false,
              trailing: CommonSwitch(
                value: select,
                func: (_) async {
                  await FileStorage.createAsData(KeyPool.feedback,
                      _ ? "1" : "0", StorageType.applicationSupportDirectory);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoundPage extends StatefulWidget {
  final int type;

  const SoundPage({
    super.key,
    required this.type,
  });

  @override
  State<StatefulWidget> createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  List<NoticeSound> list = [];

  List<NoticeSound> habit = [
    NoticeSound(value: '1', title: '11', voice: 'assets/voice/bells.mp3'),
    NoticeSound(value: '2', title: '11', voice: 'assets/voice/bells1.mp3'),
  ];

  List<NoticeSound> focus = [];

  @override
  void initState() {
    super.initState();
    list.clear();

    if (widget.type == 1) {
      list.addAll(habit);
    } else {
      list.addAll(focus);
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      String value;
      if (widget.type == 1) {
        value = await FileStorage.readAsData(
            KeyPool.habitSound, StorageType.applicationSupportDirectory);
        if (ObjectUtil.isEmpty(value)) {
          value = 'assets/voice/bells.mp3';
        }
      } else {
        value = await FileStorage.readAsData(
            KeyPool.focusSound, StorageType.applicationSupportDirectory);

        if (ObjectUtil.isEmpty(value)) {
          value = 'assets/voice/bells.mp3';
        }
      }

      for (NoticeSound n in list) {
        n.selected = false;
        if (n.voice == value) {
          setState(() {
            n.selected = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarText(
          title: '音效',
        ),
        actions: [
          ActionBtn(
            title: '确定',
            onPressed: () {
              for (NoticeSound n in list) {
                if (n.selected) {
                  if (widget.type == 1) {
                    FileStorage.createAsData(KeyPool.habitSound, n.voice,
                        StorageType.applicationSupportDirectory);
                  } else {
                    FileStorage.createAsData(KeyPool.focusSound, n.voice,
                        StorageType.applicationSupportDirectory);
                  }
                }
              }

              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: SPHelper.pagePaddingHorizontal,
        child: ListView(
          children: [
            Column(
              children: List.generate(
                list.length,
                (index) => SimpleTile(
                  onPressed: () {
                    setState(() {
                      for (NoticeSound n in list) {
                        n.selected = false;
                      }

                      list[index].selected = !list[index].selected;
                    });
                  },
                  topRadius: index == 0,
                  bottomRadius: index == list.length - 1,
                  title: list[index].title,
                  showArrow: false,
                  showDivider: index != list.length - 1,
                  trailing: ThemeModeCheck(selected: list[index].selected),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
