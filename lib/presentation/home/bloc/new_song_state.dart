import 'package:melody_flow/domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}

// Bắt lỗi chi tiết
class NewsSongsLoadFailure extends NewsSongsState {
  final String errorMessage;
  NewsSongsLoadFailure({required this.errorMessage});
}
