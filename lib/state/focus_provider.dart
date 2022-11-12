import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusProvider extends ChangeNotifier {
  static final FocusRepository focusRepository = FocusRepository();

  List<FocusUnderwayModel> list = [];

  bool hasUnderway() {
    return true;
  }

  List<FocusUnderwayModel> getFocusUnderway() {
    return list;
  }

  Future<void> reloadFocus() async {
    list.clear();

    List<Map<String, Object?>> data = await focusRepository.query();
    for (Map<String, Object?> map in data) {
      list.add(
        FocusUnderwayModel(
          id: map['id'].toString(),
          title: map['title'].toString(),
          shortRelaxTime: int.parse(map['shortRelaxTime'].toString()),
          longRelaxTime: int.parse(map['longRelaxTime'].toString()),
          longRelaxInterval: int.parse(map['longRelaxInterval'].toString()),
          autoRelax: int.parse(map['autoRelax'].toString()),
        ),
      );
    }

    notifyListeners();
  }
}
