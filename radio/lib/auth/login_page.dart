import 'package:flutter/material.dart';
import 'package:radio/auth/signin_email.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../home/home_page.dart';
import 'email_signup.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xff222831),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 319,
              child: Text(
                'Sign in to True Crime\n Pods',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    border: Border.all(color: Colors.white)),
                child: SocialLoginButton(
                  borderRadius: 30,
                  text: "Continue with Google",
                  textColor: Colors.white,
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => HomePage()));
                  },
                  backgroundColor: Color(0xff222831),
                )),
            Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    border: Border.all(color: Colors.white)),
                child: SocialLoginButton(
                  borderRadius: 30,
                  text: "Continue with Apple",
                  textColor: Colors.white,
                  fontSize: 17,
                  buttonType: SocialLoginButtonType.appleBlack,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => HomePage()));
                  },
                  backgroundColor: Color(0xff222831),
                )),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SignInEmail()));
              },
              child: Container(
                  margin: EdgeInsets.all(20),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff222831),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/person.png",
                        width: 22,
                        height: 22,
                      ),
                      Text(
                        "User Email",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "User Email",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222831),
                        ),
                      )
                    ],
                  )),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 390,
                height: 66,
                decoration: BoxDecoration(color: Color(0xFF595E66)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Source Sans 3',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 3),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => EmailSignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF90D1D5),
                          fontSize: 15,
                          fontFamily: 'Source Sans 3',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
