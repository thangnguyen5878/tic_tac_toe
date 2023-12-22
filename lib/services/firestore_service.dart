import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/online/online_board.dart';
import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:flutter_tic_tac_toe/models/online/online_room.dart';
import 'package:flutter_tic_tac_toe/models/online/online_round.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';

class FirestoreService {
  late final CollectionReference _roomRef;
  late final CollectionReference _playerRef;
  late final CollectionReference _cellRef;
  late final CollectionReference _boardRef;
  late final CollectionReference _roundRef;

  FirestoreService() {
    _roomRef = firestore.collection('rooms').withConverter<OnlineRoom>(
        fromFirestore: (snapshots, _) => OnlineRoom.fromJson(snapshots.data()!),
        toFirestore: (room, _) => room.toJson());

    _playerRef = firestore.collection('players').withConverter<OnlinePlayer>(
        fromFirestore: (snapshots, _) => OnlinePlayer.fromJson(snapshots.data()!),
        toFirestore: (player, _) => player.toJson());

    _cellRef = firestore.collection('cells').withConverter<OnlineCell>(
        fromFirestore: (snapshots, _) => OnlineCell.fromJson(snapshots.data()!),
        toFirestore: (cell, _) => cell.toJson());

    _boardRef = firestore.collection('boards').withConverter<OnlineBoard>(
        fromFirestore: (snapshots, _) => OnlineBoard.fromJson(snapshots.data()!),
        toFirestore: (board, _) => board.toJson());

    _roundRef = firestore.collection('rounds').withConverter<OnlineRound>(
        fromFirestore: (snapshots, _) => OnlineRound.fromJson(snapshots.data()!),
        toFirestore: (round, _) => round.toJson());
  }

  // PLAYERS
  Future<void> createUserDocument(UserCredential userCredential) async {
    if (userCredential.user != null) {
      debugPrint('createUserDocument');
      print(userCredential.user);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'username': userCredential.user!.displayName,
        'isOnline': true,
        'status': 'idle',
        'opponentId': ''
      });
      debugPrint('User info saved to firestore');
    }
  }

  Stream<QuerySnapshot> getOnlineUsers() {
    return firestore.collection('users')
        // .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isOnline', isEqualTo: true)
        .snapshots();
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await firestore.collection('users').doc(uid).update(data);
  }

  /// Update a user's opponentId in Firestore
  Future<Map<String, dynamic>> updateOpponent(String uid, String opponentId) async {
    final data = {
      'opponentId': opponentId,
    };
    await firestore.collection('users').doc(uid).update(data);
    return data;
  }

  /// Update a user's status in Firestore
  Future<Map<String, dynamic>> updateUserStatus(String uid, String status) async {
    final data = {
      'status': status,
    };
    await firestore.collection('users').doc(uid).update(data);
    debugPrint('change user status $uid to "$status"');
    return data;
  }

  // ONLINE ROOM
  Stream<QuerySnapshot> getAllRooms() {
    return _roomRef
        .snapshots();
  }

  Stream<QuerySnapshot> getRoom(String roomId) {
    return _roomRef
        .where('id', isEqualTo: roomId)
        .snapshots();
  }

  void addRoom(OnlineRoom room) {
    _roomRef.add(room);
    debugPrint('add a room to Firestore');
  }

  void updateRoom(String roomId, OnlineRoom room) {
    _roomRef.doc(roomId).update(room.toJson());
  }

  void deleteTodo(String roomId) {
    _roomRef.doc(roomId).delete();
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
