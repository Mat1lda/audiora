import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:melody_flow/core/configs/const/app_url.dart';
import 'package:melody_flow/data/models/auth/create_user_req.dart';
import 'package:melody_flow/data/models/auth/sign_in_user_request.dart';
import 'package:melody_flow/data/models/auth/user.dart';
import 'package:melody_flow/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  // xu ly truc tiep vơi firebase
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SignInUserRequest signInUserReq);


  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SignInUserRequest signInUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserRequest.email, password: signInUserRequest.password);
      return const Right("Sign in was successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      print("Login Error: ${e.code}");

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user';
      }
      print("Login Error: ${e.code}");
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      FirebaseFirestore.instance
          .collection('Users')
          .add({'name': createUserReq.fullName, 'email': data.user?.email})
          .then((_) => print("User added to Firestore"))
          .catchError((error) => print("Failed to add user: $error"));
      ;
      return Right("Sign up was sucessful");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "weak-password") {
        message = "weak password";
      } else if (e.code == "email-already-in-use") {
        message = "email was used";
      }
      return Left(message);
    }
  }
  @override
  Future < Either > getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
          firebaseAuth.currentUser?.uid
      ).get();

      UserModel userModel = UserModel.fromJson(user.data() !);
      userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppUrls.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred');
    }
  }
}
