import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/home_page.dart';
import 'package:flutter_app/screens/login_page.dart';

class Landingpage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("error : ${snapshot.error}"),
            ),
          );
        }

        // coneection initialized - firebase app is running
        if (snapshot.connectionState == ConnectionState.done) {
          // stream builder can check the login state live
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamsnapshot) {
                // if stream snapshot has error
                if (streamsnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("error : ${streamsnapshot.error}"),
                    ),
                  );

        }
              // connection state active - do the use login check inside the
              //if statement
              if (streamsnapshot.connectionState == ConnectionState.active){
                //get the user
                User _user = streamsnapshot.data;

              // if the user is null , we are not logged in

              if (_user == null) {
                return LoginPage();
              } else {
                //the user is logged in , head to homepage
                return HomePage();
              }
            }
                  // checking the auth state  - Loading
             return Scaffold(
                  body: Center(
                    child: Text("Checking Authentication....",
                      style: Constants.regularHeading,
                    ),
                  ),
                );
            },
          );

        }
        // Connecting to Firebase - Loading
        return Scaffold(
          body: Center(
            child: Text("Initialization app ....",
            style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}


