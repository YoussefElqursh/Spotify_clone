import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/music/song.dart';
import 'package:spotify/service_locator.dart';


class AddOrRemoveFavoriteSongUseCase implements UseCase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return await s1<SongRepository>().addOrRemoveFavoriteSongs(params!);
  }

}