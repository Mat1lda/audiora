import 'package:melody_flow/core/usecases/usecase.dart';
import 'package:melody_flow/domain/repository/song/song.dart';
import 'package:melody_flow/service_locator.dart';

class IsFavoriteSongUseCase implements Usecase<bool,String> {
  @override
  Future<bool> call({String ? params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }


}