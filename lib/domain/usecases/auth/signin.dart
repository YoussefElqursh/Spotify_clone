import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/signin_req.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninReq> {
  @override
  Future<Either> call({SigninReq? params}) {
    return s1<AuthRepository>().signin(params!);
  }

}