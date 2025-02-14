import 'package:dartz/dartz.dart';
import 'package:melody_flow/core/usecases/usecase.dart';

import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class GetNewsSongsUseCase implements Usecase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepository>().getNewsSong();
  }
}