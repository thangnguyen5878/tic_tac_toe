import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  bool isRoomSelectionMode = false;
  List<int> selectedRoomIndexes = [];
  int? _lastSeletedRoomIndex;

  void set lastSelectedRoomIndex(int index) => _lastSeletedRoomIndex = index;

  void activateRoomSelectionMode() {
    selectedRoomIndexes.add(_lastSeletedRoomIndex!);
    isRoomSelectionMode = true;
    update();
  }

  void deactivateRoomSelectionMode() {
    selectedRoomIndexes.clear();
    isRoomSelectionMode = false;
    update();
  }

  bool isRoomCardSelected(int index) {
    return selectedRoomIndexes.contains(index);
  }

  void addToSeletedRooms(int index) {
    selectedRoomIndexes.add(index);
    update();
  }
}