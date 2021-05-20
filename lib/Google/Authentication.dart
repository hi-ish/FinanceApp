import 'package:fapp/Google/GoogleSignInProvider.dart';
import 'package:fapp/Screens/Home/HomePage.dart';
import 'package:fapp/Screens/SignUp/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return CircularProgressIndicator();
                
              } else if(snapshot.hasData){
                return HomePage();
              }
              else{

                return SignUp();
              }
            },),
      ),
    );
  }
}
