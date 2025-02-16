

import 'package:dartz/dartz.dart';
import 'package:register/core/usecase/usecase.dart';
import 'package:register/features/auth/data/models/signup_req_params.dart';
import 'package:register/features/auth/domain/repositories/auth_repository.dart';
import 'package:register/service_locator.dart';

class SignupUseCase implements UseCase<Either,SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams ? param}) {
    return sl<AuthRepository>().signup(param!);
  }
  }
