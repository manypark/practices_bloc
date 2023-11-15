import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practices/features/login/presentation/bloc/login_form_bloc.dart';

class SignUpView extends StatelessWidget {

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginuserBloc = context.watch<LoginFormBloc>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children          : [

          const Text("Looks liek you don't have account.", style: TextStyle( color: Colors.white, fontSize: 16 ) ),
          const Text("Let's create a new account for", style: TextStyle( color: Colors.white, fontSize: 16 ) ),
          Text(loginuserBloc.state.email, style: const TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),

          const SizedBox( height: 20 ),

          // name input
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child : TextFormField(
              decoration  : InputDecoration(
                hintText : 'Name',
                filled    : true,
                fillColor : Colors.grey.shade100,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all( Radius.circular( 10 ) ),
                )
              ),
            ),
          ),

          const SizedBox( height: 20 ),

          // password input
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child : TextFormField(
              obscureText: true,
              decoration  : InputDecoration(
                hintText : 'Password',
                filled    : true,
                fillColor : Colors.grey.shade100,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all( Radius.circular( 10 ) ),
                ),
                suffixIcon: IconButton(
                  onPressed : () {},
                  icon      : const Text('View', style: TextStyle( fontSize: 18, fontWeight: FontWeight.w600 ) ),
                  padding   : const EdgeInsets.only(right: 18),
                ),
              ),
            ),
          ),

          const SizedBox( height: 20 ),

          const Text("By selecting Agree and Continue below", style: TextStyle( color: Colors.white, fontSize: 16 ) ),
          const Text("Terms of Service and Privacy Policy ", style: TextStyle( color: Colors.purpleAccent, fontSize: 16, fontWeight: FontWeight.w600 ) ),

          const SizedBox( height: 20 ),

          // button agree and continue
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor : const MaterialStatePropertyAll( Colors.purple ),
                enableFeedback  : true,
                shape           : MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ) ),
              ),
              onPressed: () { },
              child    : const Text('Agree and Continue', style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600 ),)
            ),
          ),
        ],
      ),
    );
  }

}
