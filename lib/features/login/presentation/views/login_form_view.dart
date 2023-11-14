import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginOptionsView extends StatelessWidget {

  const LoginOptionsView({super.key});


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
                
          // email input
          SizedBox(
            width : ( size.width * 0.84 ),
            height: 55,
            child : TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration  : InputDecoration(
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
                backgroundColor : MaterialStateProperty.resolveWith( (state) {

                  if( state.contains( MaterialState.disabled ) ) {
                    return Colors.grey;
                  }

                  return Colors.purple;
                }),
                enableFeedback  : true,
                shape           : MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ) ),
              ),
              onPressed: (){},
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
