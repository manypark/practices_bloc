import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/blocs.dart';

class SignUpView extends StatefulWidget {

  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final passwordController = TextEditingController();
  bool showPassword = true;

  void alertDialg(String title, String content) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog.adaptive(
          title   : Text(title),
          content : Text(content),
          actions : [
            TextButton(
              onPressed : () => context.pop(), 
              child     : const Text('Cancel')
            ),
            TextButton(
              onPressed : () => context.pop(), 
              child     : const Text('Accept')
            ),
          ],
        );
      },
    );
  }

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
              controller  : passwordController,
              obscureText : showPassword,
              decoration  : InputDecoration(
                hintText : 'Password',
                filled    : true,
                fillColor : Colors.grey.shade100,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all( Radius.circular( 10 ) ),
                ),
                suffixIcon: IconButton(
                  onPressed : () {
                    setState(() { 
                      showPassword = !showPassword;
                    });
                  },
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
            child : TextButton(
              style: ButtonStyle(
                backgroundColor : const MaterialStatePropertyAll( Colors.purple ),
                enableFeedback  : true,
                shape           : MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ) ),
              ),
              onPressed: () async {

                final email = loginuserBloc.state.email;

                final newUser = await context.read<AuthBloc>().onCreateUserFirebase(email, passwordController.text);

                if( newUser.$2 == null ) {
                  alertDialg('Error', newUser.$1);
                  return;
                }

                alertDialg('User new created ${newUser.$2?.email}', 'Congratulations, thanks for your registration');

                // print(newUser);

              },
              child    : const Text('Agree and Continue', style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600 ),)
            ),
          ),
        ],
      ),
    );
  }
}
