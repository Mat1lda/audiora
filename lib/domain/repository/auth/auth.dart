
import 'package:dartz/dartz.dart';
import 'package:melody_flow/data/models/auth/create_user_req.dart';
import 'package:melody_flow/data/models/auth/sign_in_user_request.dart';

abstract class AuthRepository {

  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SignInUserRequest signInUserRequest);

  Future<Either<dynamic, dynamic>> getUser();
}