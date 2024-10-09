part of 'news_songs_cubit.dart';

@immutable
sealed class NewsSongsState {}

final class NewsSongsInitial extends NewsSongsState {}
final class NewsSongsLoading extends NewsSongsState {}
final class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}
final class NewsSongsLoadedFailed extends NewsSongsState {

}

