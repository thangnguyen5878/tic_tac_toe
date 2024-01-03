import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_board.dart';
import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:flutter_tic_tac_toe/models/online/online_room.dart';
import 'package:flutter_tic_tac_toe/models/online/online_round.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';

class FirestoreService {
  late final CollectionReference _roomRef;
  late final CollectionReference _playerRef;
  late final CollectionReference _cellRef;
  late final CollectionReference _boardRef;
  late final CollectionReference _roundRef;
  late final CollectionReference _userRef;

  FirestoreService() {
    _roomRef = firestore.collection(fRoomCollection).withConverter<OnlineRoom>(
        fromFirestore: (snapshots, _) => OnlineRoom.fromJson(snapshots.data()!),
        toFirestore: (room, _) => room.toJson());

    _playerRef = firestore
        .collection(fPlayersCollection)
        .withConverter<OnlinePlayer>(
            fromFirestore: (snapshots, _) =>
                OnlinePlayer.fromJson(snapshots.data()!),
            toFirestore: (player, _) => player.toJson());

    _cellRef = firestore.collection(fCellCollection).withConverter<OnlineCell>(
        fromFirestore: (snapshots, _) => OnlineCell.fromJson(snapshots.data()!),
        toFirestore: (cell, _) => cell.toJson());

    _boardRef = firestore
        .collection(fBoardCollection)
        .withConverter<OnlineBoard>(
            fromFirestore: (snapshots, _) =>
                OnlineBoard.fromJson(snapshots.data()!),
            toFirestore: (board, _) => board.toJson());

    _roundRef = firestore
        .collection(fRoundCollection)
        .withConverter<OnlineRound>(
            fromFirestore: (snapshots, _) =>
                OnlineRound.fromJson(snapshots.data()!),
            toFirestore: (round, _) => round.toJson());

    _userRef = firestore.collection(fUserCollection).withConverter<OnlineUser>(
        fromFirestore: (snapshots, _) => OnlineUser.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson());
  }

  // USERS
  // ADD USER
  Future<void> addUser(OnlineUser user) async {
    DocumentReference docRef = _userRef.doc(user.uid);
    docRef.set(user);
  }

  Future<void> createUserDocument(UserCredential userCredential) async {
    if (userCredential.user != null) {
      logger.t('createUserDocument');
      logger.t(userCredential.user);
      OnlineUser newUser = OnlineUser(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: userCredential.user!.displayName!,
          isOnline: true,
          status: OnlineUserStatus.idle);
      OnlineUserController.to.handleSignIn(newUser);
      await addUser(newUser);
      logger.t('User info saved to firestore');
    }
  }

  // GET USERS
  Future<QuerySnapshot> getAllUsers() async {
    return _userRef.get();
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return _userRef.doc(uid).get();
  }

  Stream<DocumentSnapshot> watchUser(String uid) {
    return _userRef.doc(uid).snapshots();
  }

  Stream<QuerySnapshot> watchIdleUsers() {
    return _userRef
        .where('status', isEqualTo: OnlineUserStatus.idle.toShortString())
        .orderBy('email')
        .snapshots();
  }

  Stream<DocumentSnapshot> watchCurrentUser() {
    return _userRef.doc(FirebaseAuth.instance.currentUser?.uid ?? '').snapshots();
  }

  // UPDATE USER
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _userRef.doc(uid).update(data);
  }

  /// Update a user's opponentId in Firestore
  Future<Map<String, dynamic>> updateUserOpponentId(String uid, String opponentId) async {
    final data = {
      'opponentId': opponentId,
    };
    await updateUser(uid, data);
    return data;
  }

  /// Update a user's status in Firestore
  Future<Map<String, dynamic>> updateUserStatus(
      String uid, OnlineUserStatus status) async {
    final data = {
      'status': status.toShortString(),
    };
    await updateUser(uid, data);
    logger.t('change user status $uid to "$status"');
    return data;
  }

  // DELETE USER
  Future<void> deleteUser(String uid) async {
    await _userRef.doc(uid).delete();
  }

  Future<void> deleteAllUsers() async {
    WriteBatch batch = firestore.batch();
    QuerySnapshot querySnapshot = await _userRef.get();
    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  // ONLINE ROOM
  // ADD ROOM
  Future<void> addRoom(OnlineRoom room) async {
    DocumentReference docRef = _roomRef.doc(room.id);
    docRef.set(room);
  }

  // GET ROOM
  Future<QuerySnapshot> getAllRooms() async {
    return _roomRef.get();
  }

  Future<DocumentSnapshot> getRoom(String roomId) async {
    return _roomRef.doc(roomId).get();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> watchRoom(String roomId) {
    return FirebaseFirestore.instance.collection(fRoomCollection).doc(roomId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchAllRooms(String roomId) {
    return FirebaseFirestore.instance.collection(fRoomCollection).snapshots();
  }

  Stream<QuerySnapshot> watchOnlineRooms() {
    return _roomRef.snapshots();
  }

  // UPDATE ROOM
  Future<void> updateRoom(String roomId, Map<String, dynamic> data) async {
    await _userRef.doc(roomId).update(data);
  }

  Future<void> updateRoomWithObject(String roomId, OnlineRoom room) async {
    await _userRef.doc(roomId).update(room.toJson());
  }

  // DELETE ROOM
  Future<void> deleteRoom(String roomId) async {
    await _roomRef.doc(roomId).delete();
  }

  Future<void> deleteAllRooms() async {
    WriteBatch batch = firestore.batch();
    QuerySnapshot querySnapshot = await _roomRef.get();
    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  // ONLINE PLAYER
  void addPlayer(OnlinePlayer player) {
    _playerRef.add(player);
    logger.t('add a player to Firestore');
  }

  // ONLINE CELL
  void addCell(OnlineCell cell) {
    _cellRef.add(cell);
    logger.t('add a cell to Firestore');
  }

  // ONLINE BOARD
  void addBoard(OnlineBoard board) {
    _boardRef.add(board);
    logger.t('add a board to Firestore');
  }

  // ONLINE ROUND
  void addRound(OnlineRound round) {
    _roundRef.add(round);
    logger.t('add a round to Firestore');
  }
}
