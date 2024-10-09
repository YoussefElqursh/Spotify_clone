import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/music/song.dart';
import 'package:spotify/presentation/blocs/songs_player_bloc/songs_player_cubit.dart';
import 'package:spotify/presentation/widgets/app_bar_widget.dart';
import 'package:spotify/presentation/widgets/favorite_button_widget.dart';

class SongPlayerScreen extends StatelessWidget {
  final SongEntity songEntity;

  const SongPlayerScreen({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        const Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ),
      body: BlocProvider(
        create: (context) => SongsPlayerCubit()
          ..loadSong(
              '${AppUrls.songFireStorage}${songEntity.title}.mp3${AppUrls.mediaAlt}'),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${AppUrls.fireStorage}${songEntity.title}.png${AppUrls.mediaAlt}'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        songEntity.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        songEntity.artist,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  FavoriteButton(
                    songEntity: songEntity,
                  )
                ],
              ),
              const SizedBox(height: 30.0,),
              BlocBuilder<SongsPlayerCubit,SongsPlayerState>(
                builder: (context, state) {
                  if(state is SongsPlayerLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(state is SongsPlayerLoaded){
                    return Column(
                      children: [
                        Slider(
                          value: context.read<SongsPlayerCubit>().songPosition.inSeconds.toDouble(),
                          min: 0.0,
                          max: context.read<SongsPlayerCubit>().songDuration.inSeconds.toDouble(),
                          activeColor: AppColors.primary,
                          onChanged: (v){},
                        ),
                        const SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatDuration(context.read<SongsPlayerCubit>().songPosition)),
                            Text(formatDuration(context.read<SongsPlayerCubit>().songDuration)),
                          ],
                        ),
                        const SizedBox(height: 20.0,),
                        GestureDetector(
                          onTap: (){
                            context.read<SongsPlayerCubit>().playOrPauseSong();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Icon(context.read<SongsPlayerCubit>().audioPlayer.playing ? Icons.pause : Icons.play_arrow_rounded),
                          ),
                        )
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration){
    final min = duration.inMinutes.remainder(60);
    final sec = duration.inSeconds.remainder(60);
    return '${min.toString().padLeft(2,'0')}:${sec.toString().padLeft(2,'0')}';
  }
}
