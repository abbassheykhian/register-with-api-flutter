
import 'package:dartz/dartz.dart';
import 'package:register/core/usecase/usecase.dart';
import 'package:register/features/auth/data/models/sigin_req_params.dart';
import 'package:register/features/auth/domain/repositories/auth_repository.dart';
import 'package:register/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninReqParams> {

  @override
  Future<Either> call({SigninReqParams ? param}) async {
    return sl<AuthRepository>().signin(param!);
  }
  
}