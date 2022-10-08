import 'package:flutter/material.dart';
import 'package:untitled6/Screens/signup_screen.dart';
import 'package:untitled6/resources/auth_method.dart';
import 'package:untitled6/utils/utils.dart';
import 'package:untitled6/widgets/text_field_input.dart';

import '../responsive/mobileScreenLayout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/webScreenLayout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    print("click");
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      print("ho gya");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout())));
    } else {
      showSnackbar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login.jpg",
                  height: 400,
                  width: 400,
                ),
                TextFieldInput(
                  hintText: "Enter Your Email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldInput(
                  hintText: "Enter Your Password",
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPass: true,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                // Flexible(
                //   child: Container(),
                //   flex: 2,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                      },
                      child: Container(
                        child: Text("Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
