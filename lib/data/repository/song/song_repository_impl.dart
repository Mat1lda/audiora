import 'package:dartz/dartz.dart';
import 'package:melody_flow/data/sources/song/song_firebase_service.dart';
import 'package:melody_flow/domain/entities/song/song.dart';
import 'package:melody_flow/domain/repository/song/song.dart';
import 'package:melody_flow/service_locator.dart';

class SongRepositoryImpl extends SongsRepository{
  @override
  Future<Either> getNewsSongs() async{
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }

  @override
  Future<Either> getNewsSong() {
    // TODO: implement getNewsSong
    throw UnimplementedError();
  }



}