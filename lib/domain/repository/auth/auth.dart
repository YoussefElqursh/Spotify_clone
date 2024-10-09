import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/signin_req.dart';
import 'package:spotify/data/models/auth/user_req.dart';

abstract class AuthRepository {

  Future<Either> signin(SigninReq signinReq);

  Future<Either> signup(UserReq userReq);

  Future<Either> getUser();

}
