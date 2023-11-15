import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'blocs/blocs.dart';
import 'package:practices/features/login/presentation/views/views.dart';

class LoginFormScreen extends StatelessWidget {

  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body  : LoginFormView(),
      ),
    );
  }

}

class LoginFormView extends StatelessWidget {

  const LoginFormView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginUserBloc = context.watch<LoginFormBloc>();

    return Stack(
      children: [

        Image.asset(
          'assets/images/manos.jpg',
          fit    : BoxFit.cover,
          width : double.infinity,
          height: size.height,
        ).animate().fade( duration: 500.ms ),

        Positioned(
          top : ( size.height * 0.08 ),
          left: ( size.height * 0.02 ),
          child: IconButton.filled(
            enableFeedback: true,
            style         : const ButtonStyle(
              backgroundColor : MaterialStatePropertyAll(Colors.white12),
              padding         : MaterialStatePropertyAll( EdgeInsets.all(16) )
            ),
            onPressed : () {
              context.read<LoginFormBloc>().resetState();
              context.pop();
            },
            icon      : const Icon( Icons.arrow_back_ios_rounded, color: Colors.white, ),
          ),
        ).animate().slide().fade( delay: 400.ms, duration: 400.ms ),

        Positioned(
          top   : ( size.height * 0.21 ),
          left  : 0,
          right : 0,
          child: const Padding(
            padding : EdgeInsets.symmetric( horizontal: 32 ),
            child   : Text('Hi!', style: TextStyle( color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),),
          )
        ),

        Positioned(
          top   : ( size.height * 0.3 ),
          left  : 0,
          right : 0,
          child : Padding(
            padding : const EdgeInsets.symmetric( horizontal: 8 ),
            child   : AnimatedContainer(
              width   : ( size.width * 0.9 ),
              height  : loginUserBloc.state.showSignupView ? 420 : (loginUserBloc.state.ifExsitEmail ? 320 : 580),
              duration: const Duration( milliseconds: 400 ),
              curve   : Curves.decelerate,
            ).blurred(
              blur        : 7,
              colorOpacity: 0.6,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              blurColor   : Colors.black,
              overlay     : loginUserBloc.state.showSignupView ? const SignUpView() :
              ( loginUserBloc.state.ifExsitEmail ? const SignInView() : const LoginOptionsView() )
            ),
          ),
        )
        
      ],
    );
  }

}
