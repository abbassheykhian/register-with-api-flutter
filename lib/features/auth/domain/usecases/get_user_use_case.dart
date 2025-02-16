
import 'package:dartz/dartz.dart';
import 'package:register/core/usecase/usecase.dart';
import 'package:register/features/auth/domain/repositories/auth_repository.dart';
import 'package:register/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({dynamic param}) async {
    return sl<AuthRepository>().getUser();
  }
  
}