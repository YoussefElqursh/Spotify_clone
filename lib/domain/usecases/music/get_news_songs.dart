import 'package:spotify/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/music/song.dart';
import 'package:spotify/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async{
    return await s1<SongRepository>().getNewsSongs();
  }
}