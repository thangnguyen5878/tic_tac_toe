import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  bool isRoomSelectionMode = false;
  List<int> selectedRoomIndexes = [];
  int? _lastSeletedRoomIndex;

  void set lastSelectedRoomIndex(int index) => _lastSeletedRoomIndex = index;

  void activateRoomSelectionMode(int roomIndex) {
    addSelectedRoom(roomIndex);
    isRoomSelectionMode = true;
    update();
  }

  void deactivateRoomSelectionMode() {
    selectedRoomIndexes.clear();
    isRoomSelectionMode = false;
    update();
  }

  void addSelectedRoom(int index) {
    _lastSeletedRoomIndex = index;
    selectedRoomIndexes.add(index);
    update();
  }

  void removeSelectedRoom(int index) {
    selectedRoomIndexes.remove(index);
    if(selectedRoomIndexes.isEmpty) {
      isRoomSelectionMode = false;
    }
    update();
  }

  bool isRoomCardSelected(int index) {
    return selectedRoomIndexes.contains(index);
  }
}