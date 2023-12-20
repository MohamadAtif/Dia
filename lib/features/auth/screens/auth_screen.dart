import 'package:diamart_commerce/features/auth/screens/registePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../services/auth_service.dart';

enum Auth {
  signin,
  // signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        phone: _phoneController.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                // alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        const BoxDecoration(color: GlobalVariables.myTealColor),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 39),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("WELCOME TO DIAMART",
                              style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text("Welcome To Our World -Login and Enjoy",
                              style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal)),
                          const SizedBox(
                            height: 34.0,
                          ),
                          Image.asset(
                            'assets/images/shopping (1).png',
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 230,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 669,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(38),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            tileColor: GlobalVariables.greyBackgroundCOlor,
                            title: Center(
                              child: Text('LOGIN',
                                  style: GoogleFonts.kanit(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ),
                            // leading: Radio(
                            //   activeColor: GlobalVariables.mypetroleumColor,
                            //   value: Auth.signup,
                            //   groupValue: _auth,
                            //   onChanged: (Auth? val) {
                            //     setState(() {
                            //       _auth = val!;
                            //     });
                            //   },
                            // ),
                          ),
                          // if (_auth == Auth.signup)
                          //   Container(
                          //     padding: const EdgeInsets.all(8),
                          //     color: GlobalVariables.backgroundColor,
                          //     child: Form(
                          //       key: _signUpFormKey,
                          //       child: Column(
                          //         children: [
                          //           CustomTextField(
                          //             controller: _nameController,
                          //             hintText: 'Name',
                          //           ),
                          //           const SizedBox(height: 10),
                          //           CustomTextField(
                          //             controller: _emailController,
                          //             hintText: 'Email',
                          //           ),
                          //           const SizedBox(height: 10),
                          //           CustomTextField(
                          //             controller: _passwordController,
                          //             hintText: 'Password',
                          //           ),
                          //           const SizedBox(height: 10),
                          //           CustomButton(
                          //             color: GlobalVariables.mypetroleumColor,
                          //             text: 'Sign Up',
                          //             onTap: () {
                          //               if (_signUpFormKey.currentState!
                          //                   .validate()) {
                          //                 signUpUser();
                          //               }
                          //             },
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ListTile(
                          //   tileColor: _auth == Auth.signin
                          //       ? GlobalVariables.backgroundColor
                          //       : GlobalVariables.greyBackgroundCOlor,
                          //   title: Text('Sign-In.',
                          //       style: GoogleFonts.kanit(
                          //           fontSize: 17,
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.w600)),
                          //   leading: Radio(
                          //     activeColor: GlobalVariables.mypetroleumColor,
                          //     value: Auth.signin,
                          //     groupValue: _auth,
                          //     onChanged: (Auth? val) {
                          //       setState(() {
                          //         _auth = val!;
                          //       });
                          //     },
                          //   ),
                          // ),
                          // if (_auth == Auth.signin)
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: GlobalVariables.backgroundColor,
                            child: Form(
                              key: _signInFormKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: _emailController,
                                    hintText: 'Email',
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextField(
                                    controller: _passwordController,
                                    hintText: 'Password',
                                  ),
                                  const SizedBox(height: 10),
                                  CustomButton(
                                    color: GlobalVariables.myTealColor,
                                    text: 'Sign In',
                                    onTap: () {
                                      if (_signInFormKey.currentState!
                                          .validate()) {
                                        signInUser();
                                        // Navigator.pushAndRemoveUntil(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => const HomeScreen()),
                                        //     (route) => false);
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 100.0,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 40.0,
                                      width: 250,
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Don’t have an account?",
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RegisterView()),
                                              );
                                            },
                                            child: Text(
                                              " Sign Up",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  color: GlobalVariables
                                                      .myTealColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
