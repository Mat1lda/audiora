import 'package:dartz/dartz.dart';
import 'package:melody_flow/data/models/auth/create_user_req.dart';
import 'package:melody_flow/data/models/auth/sign_in_user_request.dart';
import 'package:melody_flow/data/sources/auth/auth_firebase_service.dart';
import 'package:melody_flow/domain/repository/auth/auth.dart';
import 'package:melody_flow/service_locator.dart';
class AuthRepositoryImpl extends AuthRepository{ // trung gian, cung cap api cho tang cao hon hoac logic ung dung, kh can quan tam firebase

  @override
  Future<Either> signin(SignInUserRequest signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
     return await sl<AuthFirebaseService>().signup(createUserReq);
  }
  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

}