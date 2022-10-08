import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled6/resources/auth_method.dart';
import 'package:untitled6/responsive/mobileScreenLayout.dart';
import 'package:untitled6/responsive/responsive_layout_screen.dart';
import 'package:untitled6/responsive/webScreenLayout.dart';
import 'package:untitled6/utils/utils.dart';

import 'package:untitled6/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    print("click");
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      isLoading = false;
    });
    if (res != 'success') {
      showSnackbar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout())));
    }
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
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
                // Flexible(
                //   child: Container(),
                //   flex: 0,
                // ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                "https://www.computerhope.com/jargon/g/guest-user.jpg")),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.grey.shade500,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldInput(
                  hintText: "Enter Your useranme",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _usernameController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldInput(
                  hintText: "Enter your email",
                  textInputType: TextInputType.text,
                  textEditingController: _emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldInput(
                  hintText: "Enter Your Bio",
                  textInputType: TextInputType.text,
                  textEditingController: _bioController,
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
                  onTap: signUpUser,
                  child: Container(
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
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
                      onTap: () {},
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
