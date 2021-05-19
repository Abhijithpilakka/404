

import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/register_page.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
               padding: EdgeInsets.only(
                 top: 24.0,
               ),
               child: Text(
                "Welcome User,\nLogin to your account",
              textAlign: TextAlign.center,
                style: Constants.boldheading,
              ),
              ),
               Column(
                   children: [
                     CustomInput(
                       hintText: "Email...",

                     ),
                     CustomInput(
                       hintText: "Password...",
                     ),
                     CustomBtn(
                       text: "Login",
                       onPressed:() {
                         print("clicked the login button");
                       }
                     )

                     ],
               ),
               Padding(
                 padding:const EdgeInsets.only(
                   bottom:16.0,
               ) ,
                child: CustomBtn(
                 text: "Create New Account",
                 onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context) => RegisterPage()
                     
                   ),
                   );

                 },
                 outlineBtn: true,

               ),
      ),
      ],
          ),
        ),
      ),
    );
  }
}





