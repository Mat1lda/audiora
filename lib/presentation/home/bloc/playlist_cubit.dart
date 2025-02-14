import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_flow/domain/usecase/song/get_playlist.dart';
import 'package:melody_flow/presentation/home/bloc/playlist_state.dart';
import 'package:melody_flow/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {

  PlayListCubit() : super(PlayListLoading());

  Future < void > getPlayList() async {
    var returnedSongs = await sl < GetPlayListUseCase > ().call();
    returnedSongs.fold(
            (l) {
          emit(PlayListLoadFailure());
        },
            (data) {
          emit(
              PlayListLoaded(songs: data)
          );
        }
    );
  }


}