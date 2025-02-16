

import 'package:register/core/usecase/usecase.dart';
import 'package:register/features/auth/domain/repositories/auth_repository.dart';
import 'package:register/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {

  @override
  Future<bool> call({dynamic param}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
  
}