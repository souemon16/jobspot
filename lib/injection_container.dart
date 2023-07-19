import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/features/user/user_injection_container.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  
  // EXTERNAL 
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => firebaseAuth); 
  sl.registerLazySingleton(() => firebaseFirestore); 
  sl.registerLazySingleton(() => firebaseStorage); 
  sl.registerLazySingleton(() => googleSignIn); 

  await userInjectionContainer();
}