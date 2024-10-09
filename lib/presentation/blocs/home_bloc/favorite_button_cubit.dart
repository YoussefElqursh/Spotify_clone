import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/music/add_or_remove_favorite_song.dart';
import 'package:spotify/service_locator.dart';

import 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result =
        await s1<AddOrRemoveFavoriteSongUseCase>().call(params: songId);
    result.fold(
      (l) {},
      (isFavorite) {
        emit(FavoriteButtonUpdated(isFavorite: isFavorite));
      },
    );
  }
}
