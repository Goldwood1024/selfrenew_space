import 'dart:convert';

import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusProvider extends ChangeNotifier {
  static final FocusRepository focusRepository = FocusRepository();

  List<FocusUnderwayModel> focusHomeList = [];
  List<FocusUnderwayModel> focusModuleList = [];

  Future<void> reloadFocusModule() async {
    focusModuleList.clear();

    List<Map<String, Object?>> data = await focusRepository.query();
    for (Map<String, Object?> map in data) {
      RepeatModel repeatModel = RepeatModel.toBean(
        jsonDecode(map['repeat'].toString()),
      );

      if (repeatModel.type == 0) {
        if (!repeatModel.repeatDays.contains(DatetimeUtil.weekday())) {
          continue;
        }
      } else {
        // 日期
        if (!RepeatModel.hasToday(repeatModel.selectedDates)) {
          continue;
        }
      }

      focusModuleList.add(
        FocusUnderwayModel(
          id: map['id'].toString(),
          title: map['title'].toString(),
          iconModel: IconModel.toBean(jsonDecode(map['icons'].toString())),
        ),
      );
    }

    notifyListeners();
  }

  bool hasModuleUnderway() {
    return focusModuleList.isNotEmpty;
  }

  List<FocusUnderwayModel> getFocusModuleUnderway() {
    return focusModuleList;
  }

  bool hasUnderway() {
    return focusHomeList.isNotEmpty;
  }

  List<FocusUnderwayModel> getFocusUnderway() {
    return focusHomeList;
  }

  Future<void> reloadFocusHome() async {
    focusHomeList.clear();

    List<Map<String, Object?>> data = await focusRepository.query();
    for (Map<String, Object?> map in data) {
      if (focusHomeList.any((element) => element == map['id'])) {
        continue;
      }

      focusHomeList.add(
        FocusUnderwayModel(
          id: map['id'].toString(),
          title: map['title'].toString(),
          shortRelaxTime: int.parse(map['shortRelaxTime'].toString()),
          longRelaxTime: int.parse(map['longRelaxTime'].toString()),
          longRelaxInterval: int.parse(map['longRelaxInterval'].toString()),
          targetTime: int.parse(map['targetTime'].toString()),
          autoRelax: int.parse(map['autoRelax'].toString()),
          type: map['type'].toString(),
          iconModel: IconModel.toBean(jsonDecode(map['icons'].toString())),
        ),
      );
    }

    notifyListeners();
  }

  Future<void> remove(FocusUnderwayModel model) async {
    getFocusUnderway().removeWhere((element) => element.id == model.id);
    focusModuleList.removeWhere((element) => element.id == model.id);
    await focusRepository.update('isDeleted', '1', model.id);

    notifyListeners();
  }
}
