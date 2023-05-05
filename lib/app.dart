import 'package:tranquillo/router.dart';
import 'package:tranquillo/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquillo/cubits/user_data_cubit.dart';
import 'package:tranquillo/cubits/auth_cubit.dart';
import 'package:tranquillo/cubits/dictando_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit()..init();
    final userDataCubit = UserDataCubit();
    final beatCubit = DictandoCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(value: authCubit),
        BlocProvider<UserDataCubit>.value(value: userDataCubit),
        BlocProvider<DictandoCubit>.value(value: beatCubit),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: AppColors.myColor,
          scaffoldBackgroundColor: const Color(0xFFEBEBEB),
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.homepage.route,
      ),
    );
  }
}
