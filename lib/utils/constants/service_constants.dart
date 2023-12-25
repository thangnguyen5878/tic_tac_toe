
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/services/firestore_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirestoreService firestoreService = FirestoreService();

// Firebase Collections
const fUserCollection = 'users';
const fRoomCollection = 'rooms';
const fRoundCollection = 'rounds';
const fBoardCollection = 'boards';
const fCellCollection = 'cells';
const fPlayersCollection = 'players';