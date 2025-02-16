
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/core/theme/app_theme.dart';
import 'package:register/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:register/features/auth/presentation/cubit/auth_state.dart';
import 'package:register/features/auth/presentation/screen/register_screen.dart';
import 'package:register/features/auth/presentation/screen/signup_screen.dart';
import 'package:register/features/home/presentation/screen/home_screen.dart';


import 'service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black
    )
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return BlocProvider(
      create: (context) => AuthCubit()..appStarted(),
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthCubit,AuthState>(
            builder: (context, state) {
              if (state is Authenticated){
                return const HomeScreen();
              }
              if (state is UnAuthenticated){
                return RegisterScreen();
              }
              return Container();
            },
          )
        ),
    );
  }
}