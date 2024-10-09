import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/music/song_firebase_service.dart';
import 'package:spotify/domain/repository/music/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async{
    return await s1<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlaylist() async{
    return await s1<SongFirebaseService>().getPlaylist();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await s1<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await s1<SongFirebaseService>().isFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await s1<SongFirebaseService>().getUserFavoriteSongs();
  }
}