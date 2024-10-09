import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/signin_req.dart';
import 'package:spotify/data/models/auth/user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninReq signinReq) async {
    return await s1<AuthFirebaseServices>().signin(signinReq);
  }

  @override
  Future<Either> signup(UserReq userReq) async {
    return await s1<AuthFirebaseServices>().signup(userReq);
  }

  @override
  Future<Either> getUser() async {
    return await s1<AuthFirebaseServices>().getUser();
  }


}