import 'package:flutter_login/flutter_login.dart';

import 'package:flutter/material.dart';
import 'package:register/features/auth/data/models/sigin_req_params.dart';
import 'package:register/features/auth/data/models/signup_req_params.dart';

import 'package:register/features/auth/domain/usecases/signin_use_case.dart';
import 'package:register/features/auth/domain/usecases/signup_use_case.dart';
import 'package:register/features/home/presentation/screen/home_screen.dart';
import 'package:register/service_locator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  Future<String?> _authUser(LoginData data) async {
    final usecase = sl<SigninUseCase>();
    final result = await usecase(
        param: SigninReqParams(email: data.name, password: data.password));
    return result.fold((error) => error.message, (success) => null);
  }

  Future<String?> _signupUser(SignupData data) async {
    final usecase = sl<SignupUseCase>();
    final result = await usecase(
        param: SignupReqParams(
            email: data.name!,
            password: data.password!,
            username: data.additionalSignupData!['username']!));
    return result.fold((error) => error.message, (success) => null);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        onLogin: _authUser,
        onRecoverPassword: (String email) async => null,
        additionalSignupFields: [
          UserFormField(keyName: AutofillHints.username)
        ],
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        });
  }
}
