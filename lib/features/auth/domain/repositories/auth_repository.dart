
import 'package:dartz/dartz.dart';
import 'package:register/features/auth/data/models/sigin_req_params.dart';
import 'package:register/features/auth/data/models/signup_req_params.dart';

abstract class AuthRepository {
  
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> signin(SigninReqParams signinReq);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> logout();
}