import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/common/constants/app_urls.dart';
import 'package:spotify/data/models/auth/signin_req.dart';
import 'package:spotify/data/models/auth/user.dart';
import 'package:spotify/data/models/auth/user_req.dart';
import 'package:spotify/domain/entities/auth/user.dart';

abstract class AuthFirebaseServices {
  Future<Either> signin(SigninReq signinReq);

  Future<Either> signup(UserReq userReq);

  Future<Either> getUser();
}

class AuthFirebaseServicesImpl implements AuthFirebaseServices {
  @override
  Future<Either> signin(SigninReq signinReq) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinReq.email,
        password: signinReq.password,
      );

      return const Right('Signin Successful');

    } on FirebaseAuthException catch (e) {
      String message = '';

      if(e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      }else if(e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }else if(e.code == 'invalid-email') {
        message = 'The email address is badly formatted.';
      }else if(e.code == 'operation-not-allowed') {
        message = 'Enable email and password accounts in firebase.';
      }else if(e.code == 'user-disabled') {
        message = 'The user account has been disabled.';
      }else if(e.code == 'user-not-found') {
        message = 'There is no user corresponding to this email.';
      }else if(e.code == 'wrong-password') {
        message = 'Wrong password.';
      }else {
        message = 'Something went wrong.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(UserReq userReq) async {
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userReq.email,
        password: userReq.password,
      );

      FirebaseFirestore.instance.collection('Users').add({
        'name': userReq.fullName,
        'email': result.user?.email,
      });

      return const Right('Signup Successful');

    } on FirebaseAuthException catch (e) {
      String message = '';

      if(e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      }else if(e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }else if(e.code == 'invalid-email') {
        message = 'The email address is badly formatted.';
      }else if(e.code == 'operation-not-allowed') {
        message = 'Enable email and password accounts in firebase.';
      }else if(e.code == 'user-disabled') {
        message = 'The user account has been disabled.';
      }else if(e.code == 'user-not-found') {
        message = 'There is no user corresponding to this email.';
      }else if(e.code == 'wrong-password') {
        message = 'Wrong password.';
      }else {
        message = 'Something went wrong.';
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
