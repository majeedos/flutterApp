import 'package:flutter/material.dart';
import 'package:radio/auth/signup/signup_password.dart';


class SignUpwitheEmail extends StatefulWidget {
  const SignUpwitheEmail({super.key});

  @override
  State<SignUpwitheEmail> createState() => _SignUpwitheEmailState();
}

class _SignUpwitheEmailState extends State<SignUpwitheEmail> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff222831),
        ),
        backgroundColor: Color(0xff222831),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "SignUp",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 80),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Email",
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff474C53),

                      ),
                    ),

                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          emailController.clear();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.grey,

                        ))),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SignUpPassword()));
              },
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff00ADB5), fixedSize: Size(300, 50)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
