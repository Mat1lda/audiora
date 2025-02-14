import 'package:dartz/dartz.dart';
import 'package:melody_flow/core/usecases/usecase.dart';
import 'package:melody_flow/data/models/auth/sign_in_user_request.dart';
import 'package:melody_flow/domain/repository/auth/auth.dart';
import 'package:melody_flow/service_locator.dart';

class SigninUseCase implements Usecase<Either, SignInUserRequest>{
  @override
  Future<Either> call({SignInUserRequest? params}) async{
    // TODO: implement call
    return sl<AuthRepository>().signin(params!);
  }
}