import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/music/song.dart';
import 'package:spotify/service_locator.dart';


class GetFavoriteSongsUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await s1<SongRepository>().getUserFavoriteSongs();
  }
}