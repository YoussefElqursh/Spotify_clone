import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/music/song.dart';
import 'package:spotify/service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool,String> {
  @override
  Future<bool> call({String ? params}) async {
    return await s1<SongRepository>().isFavoriteSong(params!);
  }


}
