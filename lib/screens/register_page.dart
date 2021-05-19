import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  "Create a New Account",
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
                      text: "Create New Account",
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
                  text: "Back to login",
                  onPressed: (){
                    Navigator.pop(context);

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
