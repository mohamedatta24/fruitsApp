import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/dependency_injection.dart';
import 'package:fruits_app/features/auth/presentation/signup_cubit/signup_cubit_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: SignupViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}

