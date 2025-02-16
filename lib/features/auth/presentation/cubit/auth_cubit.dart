
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/features/auth/domain/usecases/is_logged_in_use_case.dart';
import 'package:register/features/auth/presentation/cubit/auth_state.dart';
import 'package:register/service_locator.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit() : super(AppInitialState());
  
  void appStarted() async {
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

}