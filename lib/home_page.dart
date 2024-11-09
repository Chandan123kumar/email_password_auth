import 'package:email_password_auth/auth_service.dart';
import 'package:email_password_auth/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 198.0),
                child: Text('Welcome to home'),
              ),
              ElevatedButton(onPressed: ()async{
                await _auth.logOut();
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
              }, child: Text('LogOut'))
            ],
          ),

        ),
      ),
    );
  }
}
