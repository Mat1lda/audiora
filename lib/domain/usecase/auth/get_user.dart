import 'package:dartz/dartz.dart';
import 'package:melody_flow/core/usecases/usecase.dart';
import 'package:melody_flow/domain/repository/auth/auth.dart';
import 'package:melody_flow/service_locator.dart';

class GetUserUseCase implements Usecase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getUser();
  }

}