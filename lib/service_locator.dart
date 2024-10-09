import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/music/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/music/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/music/song.dart';
import 'package:spotify/domain/usecases/auth/get_user_use_case.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/music/add_or_remove_favorite_song.dart';
import 'package:spotify/domain/usecases/music/get_favorite_songs.dart';
import 'package:spotify/domain/usecases/music/get_news_songs.dart';
import 'package:spotify/domain/usecases/music/get_playlist.dart';
import 'package:spotify/domain/usecases/music/is_favorite_song.dart';

final GetIt s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  s1.registerSingleton<AuthFirebaseServices>(AuthFirebaseServicesImpl());
  s1.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  s1.registerSingleton<SongRepository>(SongRepositoryImpl());
  s1.registerSingleton<SignupUseCase>(SignupUseCase());
  s1.registerSingleton<SigninUseCase>(SigninUseCase());
  s1.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  s1.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());
  s1.registerSingleton<AddOrRemoveFavoriteSongUseCase>(AddOrRemoveFavoriteSongUseCase());
  s1.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
  s1.registerSingleton<GetUserUseCase>(GetUserUseCase());
  s1.registerSingleton<GetFavoriteSongsUseCase>(GetFavoriteSongsUseCase());
}