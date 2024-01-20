import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/services/firestore_service.dart';
import 'package:flutter_tic_tac_toe/services/isar_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirestoreService firestoreService = FirestoreService();
IsarService isarService = IsarService();
var uuid = const Uuid();
bool isOnline = firebaseAuth.currentUser != null;

// Firebase Collections
const fUserCollection = 'users';
const fRoomCollection = 'rooms';
const fRoundCollection = 'rounds';
const fBoardCollection = 'boards';
const fCellCollection = 'cells';
const fPlayersCollection = 'players';

// Logger
var logger = Logger(
  filter: null,
  printer: PrettyPrinter(
    printTime: true,
    printEmojis: false,
    lineLength: 80,

    // methodCount: 0,
    // errorMethodCount: 0
  ),
  output: null,
);
