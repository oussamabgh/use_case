import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:usecase/Api/google_signin_api.dart';
import 'package:usecase/Screens/Home/home_screen.dart';
import 'package:usecase/Screens/Signup/components/social_icon.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'or_divider.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}



class _BodyState extends State<Body> {

  late String email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.10),
            SvgPicture.asset(
              "assets/icons/DUKKANTEK.svg",

              color: kPrimaryColor,
              height: size.height * 0.15,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {email=value;},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {_Signin();},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {signIn();},
                ),
              ],
            )
          ],
        ),
      );
  }
  signIn() async {
    await GoogleSignInApi.login().then((value) => {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) {
    return HomeScreen(value!.email);
    },
    ),
    )
    });
  }
  // ignore: non_constant_identifier_names
  _Signin(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen(email);
          },
        )
    );
  }
}
