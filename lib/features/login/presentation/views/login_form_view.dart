import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../bloc/login_form_bloc.dart';

class LoginOptionsView extends StatefulWidget {
  const LoginOptionsView({super.key});
  @override
  State<LoginOptionsView> createState() => _LoginOptionsViewState();
}

class _LoginOptionsViewState extends State<LoginOptionsView> {

  final emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  String validEmail = '';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginUserBloc = context.watch<LoginFormBloc>();

    return SingleChildScrollView(
      child: Column(
        children: [

          // input email
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child : TextFormField(
              controller  : emailController,
              keyboardType: TextInputType.emailAddress,
              decoration  : InputDecoration(
                hintText : 'Email',
                filled    : true,
                fillColor : ( !loginUserBloc.state.ifExsitEmail && loginUserBloc.state.email != '') ? Colors.red.shade200 :Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all( Radius.circular( 10 ) ),
                  borderSide  : BorderSide(
                    color: ( !loginUserBloc.state.ifExsitEmail && loginUserBloc.state.email != '') ? Colors.red :Colors.grey.shade100,
                    width: 2,
                    style: BorderStyle.solid
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all( Radius.circular( 10 ) ),
                  borderSide  : BorderSide(
                    color: loginUserBloc.state.ifExsitEmail ? Colors.red :Colors.grey.shade100,
                    width: 2,
                    style: BorderStyle.solid
                  ),
                )
              ),
            ),
          ),

          const SizedBox( height: 5 ),

          if( !loginUserBloc.state.ifExsitEmail && loginUserBloc.state.email != '' )
          SizedBox(
            width : ( size.width * 0.84 ),
            child : const Row(
              children: [
                Icon( Icons.warning, color: Colors.red ),
                SizedBox( width: 10 ),
                Text('Plaease check your email address.', style: TextStyle( color: Colors.red, fontWeight: FontWeight.w600 ) ),
              ],
            ),
          ),

          if( validEmail == 'Email invalid' )
          SizedBox(
            width : ( size.width * 0.84 ),
            child : const Row(
              children: [
                Icon( Icons.warning, color: Colors.red ),
                SizedBox( width: 10 ),
                Text('Email invalid.', style: TextStyle( color: Colors.red, fontWeight: FontWeight.w600 ) ),
              ],
            ),
          ),

          if( validEmail == 'empty' )
          SizedBox(
            width : ( size.width * 0.84 ),
            child : const Row(
              children: [
                Icon( Icons.warning, color: Colors.red ),
                SizedBox( width: 10 ),
                Text('Not must be empty', style: TextStyle( color: Colors.red, fontWeight: FontWeight.w600 ) ),
              ],
            ),
          ),
    
          const SizedBox( height: 20 ),

          // button continue
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor : MaterialStateProperty.resolveWith( (state) {

                  if( state.contains( MaterialState.disabled ) ) {
                    return Colors.grey;
                  }

                  if( loginUserBloc.state.isLoading ) {
                    return Colors.grey;
                  }

                  return Colors.purple;
                }),
                enableFeedback  : true,
                shape           : MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ) ),
              ),
              onPressed: () {

                if( emailController.text.isEmpty ) {
                  setState(() { validEmail = 'empty'; });
                  return;
                }

                if( !_emailRegExp.hasMatch( emailController.text) ) {
                  setState(() { validEmail = 'Email invalid'; });
                  return;
                }

                validEmail = '';

                context.read<LoginFormBloc>().onVerifyEmail(emailController.text);
              },
              child    : Row(
                mainAxisAlignment : MainAxisAlignment.center,
                children          : [

                  if( loginUserBloc.state.isLoading )
                  const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,  ),

                  const SizedBox( width: 20,),

                  const Text('Continue', style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600 ),)
                ],
              )
            ),
          ),
    
          const SizedBox( height: 20 ),
    
          const Text('or', style: TextStyle( fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600 ),),
    
          const SizedBox( height: 20 ),
    
          // button continue facebook
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor : MaterialStatePropertyAll( Colors.grey.shade300 ),
                enableFeedback  : true,
                shape           : MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ) ),
              ),
              onPressed: () { },
              child    : const Text('Continue with Facebook', style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600 ),)
            ),
          ),
          
          const SizedBox( height: 20 ),
    
          // button continue google
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor : MaterialStatePropertyAll( Colors.grey.shade300 ),
                enableFeedback  : true,
                shape           : MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ) ),
              ),
              onPressed: () { },
              child    : const Text('Continue with Google', style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600 ),)
            ),
          ),
          
          const SizedBox( height: 20 ),
    
          // button continue apple
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor : MaterialStatePropertyAll( Colors.grey.shade300 ),
                enableFeedback  : true,
                shape           : MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ) ),
              ),
              onPressed: () { },
              child    : const Text('Continue with Apple', style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600 ),)
            ),
          ),

          const SizedBox( height: 20 ),

          // don`t have account
          SizedBox(
            width : ( size.width * 0.84 ),
            child : Row(
              children: [
                const Text("Don't have an account? ", style: TextStyle( fontSize: 16, color: Colors.white ) ),
                TextButton(
                  onPressed : () {

                    if( emailController.text.isEmpty ) {
                      setState(() { validEmail = 'empty'; });
                      return;
                    }

                    if( !_emailRegExp.hasMatch( emailController.text) ) {
                      setState(() { validEmail = 'Email invalid'; });
                      return;
                    }

                    loginUserBloc.canShowSignupView( emailController.text, true );
                  },
                  child     : const Text('Sign up', style: TextStyle( color: Colors.purpleAccent, fontWeight: FontWeight.w600 ) ),
                ),
              ],
            ),
          ),

          // forgot your password
          SizedBox(
            width : ( size.width * 0.89 ),
            child: Flex(
              direction : Axis.horizontal,
              children  : [
                  TextButton(
                  onPressed : (){},
                  child     : const Text('Forgot your password?', style: TextStyle( color: Colors.purpleAccent, fontWeight: FontWeight.w600 ) ),
                ),
              ],
            ),
          ),
    
        ].animate( interval: 100.ms ).fadeIn( duration: 300.ms ),
      ),
    );
  }
}
