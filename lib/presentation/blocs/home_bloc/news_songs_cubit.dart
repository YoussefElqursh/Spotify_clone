import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/music/song.dart';
import 'package:spotify/domain/usecases/music/get_news_songs.dart';
import 'package:spotify/service_locator.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await s1<GetNewsSongsUseCase>().call();
    returnedSongs.fold((l) {
      emit(NewsSongsLoadedFailed());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
