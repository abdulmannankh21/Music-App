import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/class/user_Model.dart';
import 'package:musicapp/screen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Login",
                  style: GoogleFonts.roboto(
                    color: Colors.amber,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Account Registration",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(
                    'Full Name',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{3,}$');
                      if (value!.isEmpty) {
                        return ("First Name cannot be Empty");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid name(Min. 3 Character)");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.white),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                        filled: true,
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding:
                            EdgeInsets.only(top: 15, bottom: 15, left: 8),
                        fillColor: Colors.black.withOpacity(0.4)),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Email");
                      }
                      // reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                        filled: true,
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding:
                            EdgeInsets.only(top: 15, bottom: 15, left: 8),
                        fillColor: Colors.black.withOpacity(0.4)),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Password is required for login");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Password(Min. 6 Character)");
                      }
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                        filled: true,
                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding:
                            EdgeInsets.only(top: 15, bottom: 15, left: 8),
                        fillColor: Colors.black.withOpacity(0.4)),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0XFFFB8733),
                                Color(0XFFFBAB33),
                              ],
                            )),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                            //make color or elevated button transparent
                          ),
                          onPressed: () {
                            print('pressed');
                            register(
                                emailController.text, passwordController.text);
                          },
                          child: Text("Sign Up"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/amkmusic.png",
                        width: 200,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Agree to the",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Terms of Service & Privacy Policy",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.Name = nameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}
