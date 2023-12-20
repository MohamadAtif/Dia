import 'package:diamart_commerce/common/widgets/bottom_bar.dart';
import 'package:diamart_commerce/common/widgets/custom_button.dart';
import 'package:diamart_commerce/common/widgets/custom_textfield.dart';
import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:diamart_commerce/features/auth/screens/auth_screen.dart';
import 'package:diamart_commerce/features/auth/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
    _phoneController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        phone: _phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _signUpFormKey,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Container(
                        height: 143.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: GlobalVariables.myTealColor),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 39),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image.asset(
                              //   height: 20,
                              //   "assets/images/smartphone.png",
                              // ),
                              Text("Register",
                                  style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                  "Enter your personal details to create your acount",
                                  style: GoogleFonts.kanit(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 700,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/Mobile-login-Cristina.jpg',
                                height: 230,
                              ),

                              CustomTextField(
                                controller: _nameController,
                                hintText: 'Name',
                              ),
                              const SizedBox(height: 7),
                              CustomTextField(
                                controller: _phoneController,
                                hintText: 'Phone Number',
                              ),
                              const SizedBox(height: 7),
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              const SizedBox(height: 7),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Password',
                              ),
                              // Container(
                              //   margin: const EdgeInsets.symmetric(
                              //       horizontal: 30, vertical: 30),
                              //   child: TextFormField(
                              //     decoration: InputDecoration(
                              //       labelText: 'Full Name',
                              //       labelStyle: GoogleFonts.poppins(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.normal),
                              //       enabledBorder: const UnderlineInputBorder(
                              //         borderSide: BorderSide(
                              //           color: Colors.blueGrey,
                              //         ),
                              //       ),
                              //     ),
                              //     onChanged: (value) {},
                              //   ),
                              // ),

                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomButton(
                                text: 'Register',
                                color: GlobalVariables.myTealColor,
                                onTap: () {
                                  if (_signUpFormKey.currentState!.validate()) {
                                    signUpUser();
                                  }
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomBar()),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Have an account?",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AuthScreen()),
                                        );
                                      },
                                      child: Text(
                                        " Sign In",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: GlobalVariables.myTealColor,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
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
        ],
      ),
    );
  }
}
