import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      debugPrint('createUserDocument');
      print(userCredential.user);
      OnlineUser newUser = OnlineUser(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: userCredential.user!.displayName!,
          isOnline: true,
          status: OnlineUserStatus.idle,
          opponentId: '');
      await addUser(newUser);
      debugPrint('User info saved to firestore');
    }
  }

  // GET USERS
  Future<QuerySnapshot> getAllUsers() async {
    return _userRef.get();
  }

  Stream<DocumentSnapshot> watchUser(String uid) {
    return _userRef.doc(uid).snapshots();
  }

  Stream<QuerySnapshot> watchOnlineUsers() {
    return _userRef.snapshots();
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
    debugPrint('change user status $uid to "$status"');
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
  Stream<QuerySnapshot> getAllRooms() {
    return _roomRef.snapshots();
  }

  Stream<QuerySnapshot> getRoom(String roomId) {
    return _roomRef.where('id', isEqualTo: roomId).snapshots();
  }

  void addRoom(OnlineRoom room) {
    _roomRef.add(room);
    debugPrint('add a room to Firestore');
  }

  void updateRoom(String roomId, OnlineRoom room) {
    _roomRef.doc(roomId).update(room.toJson());
  }

  // ONLINE PLAYER
  void addPlayer(OnlinePlayer player) {
    _playerRef.add(player);
    debugPrint('add a player to Firestore');
  }

  // ONLINE CELL
  void addCell(OnlineCell cell) {
    _cellRef.add(cell);
    debugPrint('add a cell to Firestore');
  }

  // ONLINE BOARD
  void addBoard(OnlineBoard board) {
    _boardRef.add(board);
    debugPrint('add a board to Firestore');
  }

  // ONLINE ROUND
  void addRound(OnlineRound round) {
    _roundRef.add(round);
    debugPrint('add a round to Firestore');
  }
}
