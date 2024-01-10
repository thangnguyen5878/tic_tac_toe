import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  bool _isRoomSelectionMode = false;
  List<int> roomIds = [];
  List<int> selectedRoomIds = [];
  int? _lastSeletedRoomId;

  set lastSelectedRoomId(int id) => _lastSeletedRoomId = id;
  set isRoomSelectionMode(bool value) {
    _isRoomSelectionMode = value;
    if(_isRoomSelectionMode) {
      logger.t('change to room selection mode');
    } else {
      logger.t('change to normal mode');
    }
  }
  bool get isRoomSelectionMode => _isRoomSelectionMode;

  void selectAllRooms() {

  }

  void activateRoomSelectionMode(int id) {
    logger.t('activate room selection mode');
    addSelectedRoom(id);
    isRoomSelectionMode = true;
    update();
  }

  void deactivateRoomSelectionMode() {
    logger.t('deactivate room selection mode');
    selectedRoomIds.clear();
    isRoomSelectionMode = false;
    update();
  }

  void addSelectedRoom(int id) {
    _lastSeletedRoomId = id;
    selectedRoomIds.add(id);
    logger.t('add a selected room(id: $id)\nselected room ids: $selectedRoomIds');
    update();
  }

  void removeSelectedRoom(int id) {
    selectedRoomIds.remove(id);
    if(selectedRoomIds.isEmpty) {
      isRoomSelectionMode = false;
    }
    logger.t('remove a selected room(id: $id)\nselected room ids: $selectedRoomIds');
    update();
  }

  Future<void> removeSelectedRoomsFromDatabase() async {
    await isarService.removeRooms(selectedRoomIds);
    roomIds.removeWhere((id) => selectedRoomIds.contains(id));
    selectedRoomIds.clear();
    isRoomSelectionMode = false;
    logger.t('remove selected rooms from isar database\nselected room ids: $selectedRoomIds');
    update();
  }

  bool isRoomCardSelected(int roomId) {
    return selectedRoomIds.contains(roomId);
  }
}