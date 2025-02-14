import 'package:dartz/dartz.dart';
import 'package:melody_flow/core/usecases/usecase.dart';
import 'package:melody_flow/domain/repository/song/song.dart';
import 'package:melody_flow/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements Usecase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSongs(params!);
  }

}