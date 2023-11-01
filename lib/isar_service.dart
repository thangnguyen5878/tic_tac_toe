import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [RoomSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  // ROOM: READ
  Future<List<Room>> getAllRooms() async {
    final isar = await db;
    return isar.rooms.where().findAll();
  }

  Future<Room?> getRoom(int id) async {
    final isar = await db;
    return isar.rooms.get(id);
  }

  Stream<List<Room>> watchAllRooms() async* {
    final isar = await db;
    yield* isar.rooms.where().watch();
  }

  // ROOM: INSERT AND UPDATE
  Future<void> saveRoom(Room room) async {
    final isar = await db;
    isar.writeTxn(() => isar.rooms.put(room));
  }

  // ROOM: DELETE
  Future<void> deleteRoom(int id) async {
    final isar = await db;
    isar.rooms.delete(id);
  }

  Future<void> cleanDB() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  // ROUND: GET
  Future<List<Round?>?> getAllRoundsInRoom(int roomId) async {
    final room = await getRoom(roomId);
    return room?.rounds;
  }
}
