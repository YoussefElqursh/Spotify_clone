import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/music/song.dart';
import 'package:spotify/presentation/blocs/home_bloc/playlist_cubit.dart';
import 'package:spotify/presentation/screens/song_player_screen/song_player_screen.dart';

import 'favorite_button_widget.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getPlaylist(),
      child: BlocBuilder<PlaylistCubit, PlaylistState>(
        builder: (context, state) {
          if (state is PlaylistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is PlaylistLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
              child: Column(
                children:
                [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Playlist',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFFC6C6C6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  buildPlaylist(state.songs),
                ],
              ),
            );
          }
          return Container();
        },
      )
    );
  }

  Widget buildPlaylist(List<SongEntity> songs) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context)
                      => SongPlayerScreen(
                        songEntity: songs[index],
                      )
                  )
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode ? AppColors.blackGray : const Color(0xffE6E6E6)
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555) ,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 195,
                          child: Text(
                            songs[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          songs[index].artist,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(songs[index].duration.toString().replaceAll('.', ':'),),
                    const SizedBox(width: 20,),
                    FavoriteButton(
                      songEntity: songs[index],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context,index) => const SizedBox(height: 20,),
        itemCount: songs.length
    );
  }
}
