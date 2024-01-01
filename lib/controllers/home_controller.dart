import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  bool isRoomSelectionMode = false;
  List<int> selectedRoomIndexes = [];
  List<int> selectedRoomIds = [];
  int? _lastSeletedRoomIndex;

  void set lastSelectedRoomIndex(int index) => _lastSeletedRoomIndex = index;

  void activateRoomSelectionMode(int roomIndex, int id) {
    logger.t('activate room selection mode');
    addSelectedRoom(roomIndex, id);
    isRoomSelectionMode = true;
    update();
  }

  void deactivateRoomSelectionMode() {
    logger.t('deactivate room selection mode');
    selectedRoomIndexes.clear();
    isRoomSelectionMode = false;
    update();
  }

  void addSelectedRoom(int index, int id) {
    _lastSeletedRoomIndex = index;
    selectedRoomIndexes.add(index);
    selectedRoomIds.add(id);
    logger.t('add a selected room(index: $index, id: $id)');
    logger.i('selected room indexes: $selectedRoomIndexes');
    logger.i('selected room ids: $selectedRoomIds');
    update();
  }

  void removeSelectedRoom(int index, int id) {
    logger.t('remove a selected room(index: $index, id: $id)');
    logger.i('selected room indexes: $selectedRoomIndexes');
    logger.i('selected room ids: $selectedRoomIds');
    selectedRoomIndexes.remove(index);
    selectedRoomIds.remove(id);
    if(selectedRoomIndexes.isEmpty) {
      isRoomSelectionMode = false;
    }
    update();
  }

  Future<void> removeSelectedRoomsFromDatabase() async {
    logger.t('remove selected rooms from isar database');
    await isarService.removeRooms(selectedRoomIds);
    for(int id in selectedRoomIds) {
      selectedRoomIds.remove(id);
    }
    for(int index in selectedRoomIndexes) {
      selectedRoomIndexes.remove(index);
    }
    isRoomSelectionMode = false;
    update();
  }

  bool isRoomCardSelected(int index) {
    return selectedRoomIndexes.contains(index);
  }
}