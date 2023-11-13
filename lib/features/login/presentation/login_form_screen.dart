import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

    return Stack(
      children: [

        Image.asset(
          'assets/images/manos.jpg',
          fit    : BoxFit.cover,
          width: double.infinity,
          height: size.height,
        ),

        Positioned(
          top : ( size.height * 0.08 ),
          left: ( size.height * 0.02 ),
          child: IconButton.filled(
            enableFeedback: true,
            style         : const ButtonStyle(
              backgroundColor : MaterialStatePropertyAll(Colors.white12),
              padding         : MaterialStatePropertyAll( EdgeInsets.all(16) )
            ),
            onPressed : () => context.pop(), 
            icon      : const Icon( Icons.arrow_back_ios_rounded, color: Colors.white, ),
          ),
        ),

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
            child   : SizedBox(
              width : ( size.width * 0.9 ),
              height: 580,
            ).blurred(
              blur        : 7,
              colorOpacity: 0.6,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              blurColor   : Colors.black,
              overlay     : SingleChildScrollView(
                child: Column(
                  children: [
                          
                    // email input
                    SizedBox(
                      width : ( size.width * 0.84 ),
                      height: 55,
                      child : TextFormField(
                        decoration: InputDecoration(
                          hintText : 'Email',
                          filled    : true,
                          fillColor : Colors.grey.shade100,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all( Radius.circular( 10 ) ),
                          )
                        ),
                      ),
                    ),
              
                    const SizedBox( height: 20 ),

                    // button continue
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
                        child    : const Text('Continue', style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600 ),)
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
                            onPressed : (){}, 
                            child     : const Text('Sign up', style: TextStyle( color: Colors.purple, fontWeight: FontWeight.w600 ) ),
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
                            child     : const Text('Forgot your password?', style: TextStyle( color: Colors.purple, fontWeight: FontWeight.w600 ) ),
                          ),
                        ],
                      ),
                    ),
              
                  ],
                ),
              )
            ),
          ),
        )
      ],
    );
  }

}
