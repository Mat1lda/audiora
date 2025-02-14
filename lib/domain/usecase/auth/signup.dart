import 'package:dartz/dartz.dart';
import 'package:melody_flow/core/usecases/usecase.dart';
import 'package:melody_flow/data/models/auth/create_user_req.dart';
import 'package:melody_flow/domain/repository/auth/auth.dart';
import 'package:melody_flow/service_locator.dart';

class SignupUseCase implements Usecase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params}) async {
    // TODO: implement call
    return sl<AuthRepository>().signup(params!);
  }
}