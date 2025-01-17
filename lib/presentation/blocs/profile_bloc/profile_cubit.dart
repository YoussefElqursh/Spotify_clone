import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/auth/get_user_use_case.dart';
import 'package:spotify/presentation/blocs/profile_bloc/profile_state.dart';
import 'package:spotify/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {

  ProfileInfoCubit() : super (ProfileInfoLoading());

  Future<void> getUser() async {

    var user = await s1<GetUserUseCase>().call();

    user.fold(
            (l){
          emit(
              ProfileInfoFailure()
          );
        },
            (userEntity) {
          emit(
              ProfileInfoLoaded(userEntity: userEntity)
          );
        }
    );
  }
}