import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserReq> {
  @override
  Future<Either> call({UserReq? params}) {
    return s1<AuthRepository>().signup(params!);
  }

}