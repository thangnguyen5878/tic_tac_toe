import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/models/offline/round.dart';
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

  Stream<List<dynamic>> watchAllRooms() async* {
    final isar = await db;
    yield* isar.rooms.buildQuery(sortBy: [
      const SortProperty(
        property: 'lastAccessAt',
        sort: Sort.desc,
      )
    ]).watch(fireImmediately: true);
  }

  // ROOM: INSERT AND UPDATE
  /// Save a Room object in the database
  Future<void> saveRoom(Room room) async {
    final isar = await db;
    await isar.writeTxn(() => isar.rooms.put(room));
  }

  // ROOM: DELETE
  /// Delete a Room  from database
  Future<void> removeRoom(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.rooms.delete(id);
    });
  }

  Future<void> removeRooms(List<int> ids) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.rooms.deleteAll(ids);
    });
  }

  Future<void> cleanDB() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  // ROUND: GET
  Future<List<Round?>?> getAllRoundsInRoom(int roomId) async {
    final room = await getRoom(roomId);
    return room!.rounds;
  }
}
