
import 'package:get_it/get_it.dart';
import 'package:register/core/network/dio_client.dart';
import 'package:register/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:register/features/auth/data/source/local/auth_local_service.dart';
import 'package:register/features/auth/data/source/remote/auth_api_service.dart';
import 'package:register/features/auth/domain/repositories/auth_repository.dart';
import 'package:register/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:register/features/auth/domain/usecases/is_logged_in_use_case.dart';
import 'package:register/features/auth/domain/usecases/logout_use_case.dart';
import 'package:register/features/auth/domain/usecases/signin_use_case.dart';
import 'package:register/features/auth/domain/usecases/signup_use_case.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sl.registerSingleton<LogoutUseCase>(LogoutUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
