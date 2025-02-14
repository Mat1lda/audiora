import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_flow/domain/usecase/song/get_new_songs.dart';
import 'package:melody_flow/presentation/home/bloc/new_song_state.dart';
import 'package:melody_flow/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {

  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    try {

      var returnedSongs = await sl < GetNewsSongsUseCase > ().call();
      returnedSongs.fold(
            (l) {
          emit(NewsSongsLoadFailure(errorMessage: "chuaw biet"));
        },
            (data) {
          emit(NewsSongsLoaded(songs: data));
        },
      );
    } catch (e) {
      emit(NewsSongsLoadFailure(errorMessage: "Lỗi không xác định: $e"));
    }
  }
}
