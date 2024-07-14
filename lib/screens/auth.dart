import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finals_oddo/core/colors.dart';
import 'package:finals_oddo/widgets/inputfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignup = true;
  String email = '';
  String username = '';
  String password = '';
  bool goterror = false;
  String errormsg = '';
  bool isauthenticating = false;
  bool _isAdmin = false; // Admin switch state
  final _formkey = GlobalKey<FormState>();
  final TextEditingController signUpUsernameController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController = TextEditingController();
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController = TextEditingController();

  @override
  void dispose() {
    signInEmailController.dispose();
    signInPasswordController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpUsernameController.dispose();
    super.dispose();
  }

  void signIn() async {
    final valid = _formkey.currentState!.validate();
    if (valid) {
      _formkey.currentState!.save();
      try {
        setState(() {
          isauthenticating = true;
        });
        await _firebase.signInWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (error) {
        setState(() {
          goterror = true;
          errormsg = error.code;
        });
        Timer(const Duration(milliseconds: 1000), () {
          setState(() {
            goterror = false;
            errormsg = '';
          });
        });
        setState(() {
          isauthenticating = false;
        });
      }
    }
  }

  void signUp() async {
    final valid = _formkey.currentState!.validate();
    if (valid) {
      _formkey.currentState!.save();
      try {
        setState(() {
          isauthenticating = true;
        });
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: email, password: password);

        // Save user info to Firestore
        if(_isAdmin)
        {
            await FirebaseFirestore.instance.collection('admin').doc(userCredentials.user!.uid).set({
          'email': email,
          'isAdmin': _isAdmin,
        });
        }
        
      } on FirebaseAuthException catch (error) {
        setState(() {
          goterror = true;
          errormsg = error.code;
        });
        Timer(const Duration(milliseconds: 1000), () {
          setState(() {
            goterror = false;
            errormsg = '';
          });
        });
        setState(() {
          isauthenticating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(208, 202, 197, 197),
                  border: Border.all(
                      color: const Color.fromARGB(66, 255, 255, 255),
                      width: 0.5)),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(isSignup ? 'Sign Up' : 'Sign In',
                          style: const TextStyle(fontSize: 40)),
                    ),
                    if (isSignup)
                      Inputfield(
                        keyboardtype: 'text',
                        lable: 'Username',
                        onchange: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a username';
                          }
                          return null;
                        },
                        controller: signUpUsernameController,
                      ),
                    Inputfield(
                      keyboardtype: 'email',
                      lable: 'Email',
                      onchange: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Please provide a valid Email';
                        }
                        return null;
                      },
                      controller: isSignup
                          ? signUpEmailController
                          : signInEmailController,
                    ),
                    Inputfield(
                      keyboardtype: 'pass',
                      lable: 'Password',
                      onchange: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'Password must contain 8 characters';
                        }
                        return null;
                      },
                      controller: isSignup
                          ? signUpPasswordController
                          : signInPasswordController,
                    ),
                    if (isSignup)
                      SwitchListTile(
                        title: const Text('Register as Admin'),
                        value: _isAdmin,
                        onChanged: (value) {
                          setState(() {
                            _isAdmin = value;
                          });
                        },
                      ),
                    Visibility(
                      visible: goterror,
                      child: Text(
                        errormsg,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(buttoncolor)),
                      onPressed: () {
                        isSignup ? signUp() : signIn();
                      },
                      child: isauthenticating
                          ? const CircularProgressIndicator(
                              strokeWidth: 2,
                            )
                          : Text(
                              isSignup ? 'Sign Up' : 'Sign In',
                              style: const TextStyle(color: Colors.white),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isSignup
                            ? 'Already have an account?'
                            : 'Create an account'),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isSignup = !isSignup;
                            });
                          },
                          child: Text(
                            isSignup ? 'Sign in' : 'Sign up',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
