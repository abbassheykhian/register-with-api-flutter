
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:register/features/home/presentation/cubit/user_display_state.dart';
import 'package:register/service_locator.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {

  UserDisplayCubit() : super (UserLoading());

  void displayUser() async {
    var result = await sl < GetUserUseCase > ().call();
    result.fold(
      (error) {
        emit(LoadUserFailure(errorMessage: error));
      },
      (data) {
        emit(UserLoaded(userEntity: data));
      }
    );
  }
}