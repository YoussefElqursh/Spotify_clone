part of 'songs_player_cubit.dart';

@immutable
sealed class SongsPlayerState {}

final class SongsPlayerInitial extends SongsPlayerState {}
final class SongsPlayerLoading extends SongsPlayerState {}
final class SongsPlayerLoaded extends SongsPlayerState {}
final class SongsPlayerFailure extends SongsPlayerState {}
