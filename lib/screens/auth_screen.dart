// ignore_for_file: prefer_final_fields

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:live_edu/app_constants/edu_Icons.dart';
import 'package:live_edu/app_constants/edu_colors.dart';
import '../utils/page_button.dart';
import 'guide_screen.dart';
import 'home_screen.dart'; 

enum AuthMode{login , signUp}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  var _authMode = AuthMode.login;

   void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EduColors.backgroundColor, 
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _authMode == AuthMode.signUp ?
           Padding(
            padding:  EdgeInsets.only(left:18.0,top: 8),
            child: GestureDetector(
              onTap: () {
                _authMode = AuthMode.login; 
                setState(() {
                });
              },
              child: Icon(EduIcons.back,size: 30,)),
          ) : const SizedBox(),
        SizedBox(height: MediaQuery.of(context).size.height*0.09),
         Expanded(
           child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              _authMode == AuthMode.login ? const Padding(
              padding:  EdgeInsets.only(left:30.0),
              child: Text('Welcome back' ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                   ) : 
                   const Padding(
                       padding:  EdgeInsets.only(left:30.0),
              child:  Text('Create new account' ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                   ) ,
                     _authMode == AuthMode.login ?
                   const Padding(
              padding:  EdgeInsets.only(left:30.0,top:6.0),
              child: SizedBox(
                width: 250,
                child:  Text('sign in to an existing account using your phone number',style: TextStyle(fontSize: 16,))),
                   ) : const Padding(
              padding:  EdgeInsets.only(left:30.0,top:6.0),
              child: SizedBox(
                width: 300,
                child:  Text('Create a new account by filling all the fields or login to an existing account ',style: TextStyle(fontSize: 16,))),
                   ) ,
                   SizedBox(height: MediaQuery.of(context).size.height*0.05),
                   Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _authMode == AuthMode.signUp ? Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: TextFormField(
                    
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFBFC3FC).withOpacity(0.3),
                          hoverColor: const Color(0xFFA2C3FC),
                          hintText: 'Name',
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                      ),
                    ) : SizedBox(),
                     _authMode == AuthMode.signUp ? Padding(
                        padding: const EdgeInsets.only(bottom:20.0),
                       child: TextFormField(
                       validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter an email";
              } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                return "Please enter a valid email";
              }
              return null; // Return null if the email is valid
            },
            keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFBFC3FC).withOpacity(0.3),
                          hoverColor: const Color(0xFFA2C3FC),
                          hintText: 'Email',
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                            
                                       ),
                     ) : SizedBox(),
            
                    Padding(
                    padding: const EdgeInsets.only(bottom:20.0),
                      child: TextFormField(
                        validator: (value) {
                          
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          
                          fillColor: const Color(0xFFBFC3FC).withOpacity(0.3),
                          hoverColor: const Color(0xFFA2C3FC),
                          hintText: 'Phone',
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                            
                      ),
                    ),
                   
                     TextFormField(
                      validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a password";
                } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*])[A-Za-z\d!@#\$%^&*]{8,}$').hasMatch(value)) {
                  return "Please enter a valid password";
                }
                return null; // Return null if the password is valid
              },
              
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFBFC3FC).withOpacity(0.3),
                        hoverColor: const Color(0xFFA2C3FC),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ), 
                    ),
                 ] ),
                ),)
                   ]),
            ),
                 ),
         ),
        Center(child: PageButton(buttonTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
        },buttonText: _authMode == AuthMode.login ? 'Login' : 'Create',),),
        _authMode == AuthMode.login ?
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
          child: Center(child: RichText(
    text: TextSpan(
      text: 'Don\'t have an account?', style: TextStyle(color: Colors.black, fontSize: 18),children: <TextSpan>[
  TextSpan(text: ' Sign up', style: TextStyle(color: Colors.blueAccent, fontSize: 18),recognizer: TapGestureRecognizer(

  )..onTap =() {
    _authMode = AuthMode.signUp;
    setState(() {
    });
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GuideScreen()));
  }
      )
]),
        ))) : SizedBox(height: 12,)
      ],)),
    );
  }
}
