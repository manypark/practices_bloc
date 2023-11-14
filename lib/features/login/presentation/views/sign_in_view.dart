import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignInView extends StatelessWidget {

  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [

            SizedBox(
              width : ( size.width * 0.84 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage( 'https://reqres.in/img/faces/7-image.jpg' ),
                        fit   : BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox( width: 20 ),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jane Dow', style: TextStyle( color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),),
                      Text('jane.doe@live.com', style: TextStyle( color: Colors.white, fontSize: 16 ) )
                    ],
                  )
                ],
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