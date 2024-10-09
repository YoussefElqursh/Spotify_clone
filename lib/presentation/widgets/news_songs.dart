import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/constants/app_urls.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/music/song.dart';
import 'package:spotify/presentation/blocs/home_bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/screens/song_player_screen/song_player_screen.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (BuildContext context, NewsSongsState state) {
            if (state is NewsSongsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is NewsSongsLoaded) {
              return buildSongs(state.songs);
            }
            return Container();
          },
        ),
      ),
    );
  }

  ListView buildSongs(List <SongEntity> songs) {
    return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length, // SongEntity,
              itemBuilder: (BuildContext context, int index) {
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('${AppUrls.fireStorage}${songs[index].title}.png${AppUrls.mediaAlt}'),
                                )
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  transform: Matrix4.translationValues(10.0, 10.0, 0.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.isDarkMode ? AppColors.blackGray : const Color(0xFFE6E6E6),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    color: context.isDarkMode ? const Color(0xFF959595) : const Color(0xFF555555),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            songs[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            songs[index].artist,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 30.0),
            );
  }
}
