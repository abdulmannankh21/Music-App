import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/class/user_Model.dart';
import 'package:musicapp/screen/login.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300,
                child: Image.asset("assets/profile.png", fit: BoxFit.contain),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.Name}",
                style:GoogleFonts.poppins(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber),),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  logout(context);
                },
                child: Container(
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
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Center(
                      child: Text(
                        'Log Out',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
