
import 'dart:developer';

import 'package:email_password_auth/auth_service.dart';
import 'package:email_password_auth/home_page.dart';
import 'package:email_password_auth/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
      final _auth=AuthService();
      TextEditingController _emailController=TextEditingController();
      TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 2,
                offset: Offset(0, 5)
              )
            ]
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('LogIn Page',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0,right: 22),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0,right: 22),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: 140,
                  child: ElevatedButton(onPressed: (){
                    _logIn();
                    _emailController.clear();
                    _passwordController.clear();
                  }, child: Text('LogIn')),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0,right: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       InkWell(
                         onTap: ()async{
                           await _auth.loginWithGoogle();
                           Fluttertoast.showToast(msg: 'user logged successfully',textColor: Colors.white);
                           Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                         },
                         child: CircleAvatar(
                           backgroundColor: Colors.white,
                           maxRadius: 15,
                           child: ClipOval(child: Image.asset('assets/images/search.png',fit: BoxFit.cover,))
                         ),
                       ),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 15,
                            child: ClipOval(child: Image.asset('assets/images/search.png',fit: BoxFit.cover,))
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 15,
                            child: ClipOval(child: Image.asset('assets/images/search.png',fit: BoxFit.cover,))
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont`t have an account'),
                    InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>SignupPage()));},
                        child: Text('SignUp',style: TextStyle(color: Colors.red),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
   _logIn()async{
     final user=await _auth.logInUserWithEmail(_emailController.text, _passwordController.text);
      if (user!=null) {
        Fluttertoast.showToast(msg: 'user logged successfully',textColor: Colors.white);
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
      }
   }
}
