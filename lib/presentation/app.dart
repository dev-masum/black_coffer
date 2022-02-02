import 'package:black_coffer/core/app_bloc.dart';
import 'package:black_coffer/presentation/authentication/logic/authentication_bloc.dart';
import 'package:black_coffer/presentation/authentication/ui/otp_screen.dart';
import 'package:black_coffer/presentation/authentication/ui/phone_screen.dart';
import 'package:black_coffer/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authState) {
            return BlocBuilder<AppBloc, AppState>(
              builder: (context, appState) {
                if (appState is AuthenticatedState) {
                  return const HomeScreen();
                }
                return Builder(builder: (context) {
                  if (authState is OtpSentState) {
                    return const OtpScreen();
                  }
                  return const PhoneScreen();
                });
              },
            );
          },
        ),
      ),
    );
  }
}
