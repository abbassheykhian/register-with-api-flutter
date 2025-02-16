
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/common/cubit/button_cubit.dart';
import 'package:register/common/cubit/button_state.dart';
import 'package:register/common/widgets/basic_app_button.dart';
import 'package:register/features/auth/domain/entities/user_entity.dart';
import 'package:register/features/auth/domain/usecases/logout_use_case.dart';
import 'package:register/features/auth/presentation/screen/signup_screen.dart';
import 'package:register/features/home/presentation/cubit/user_display_cubit.dart';
import 'package:register/features/home/presentation/cubit/user_display_state.dart';
import 'package:register/service_locator.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserDisplayCubit()..displayUser()),
          BlocProvider(create: (context) => ButtonCubit()),
        ],
        child: BlocListener<ButtonCubit,ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState){
              Navigator.pushReplacement(
               context, 
               MaterialPageRoute(builder: (context) => SignupScreen(),)
             );
            }
          },
          child: Center(
            child: BlocBuilder<UserDisplayCubit,UserDisplayState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is UserLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _username(state.userEntity),
                      const SizedBox(height: 10, ),
                      _email(state.userEntity),
                      _logout(context)
                    ],
                  );
                }
                if (state is LoadUserFailure){
                  return Text(state.errorMessage);
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _username(UserEntity user) {
    return Text(
      user.username,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

   Widget _email(UserEntity user) {
    return Text(
      user.email,
       style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: BasicAppButton(
        title: 'Logout',
        onPressed: (){
         context.read<ButtonCubit>().excute(
          usecase: sl<LogoutUseCase>()
         );
        }
      ),
    );
  }
}