import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:just_audio/just_audio.dart';

part 'songs_player_state.dart';

class SongsPlayerCubit extends Cubit<SongsPlayerState> {

  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongsPlayerCubit() : super(SongsPlayerLoading()){
    audioPlayer.positionStream.listen((position){
      songPosition = position;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration){
      songDuration = duration!;
    });


  }

  void updateSongPlayer(){
    emit(SongsPlayerLoaded());
  }

  Future<void> loadSong(String url) async{
    try{
      await audioPlayer.setUrl(url);
      emit(SongsPlayerLoaded());
    }catch(e){
      emit(SongsPlayerFailure());
    }
  }

  void playOrPauseSong(){
    if(audioPlayer.playing){
      audioPlayer.stop();
    }else{
      audioPlayer.play();
    }
    emit(SongsPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
