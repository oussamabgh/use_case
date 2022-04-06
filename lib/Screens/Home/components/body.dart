import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:usecase/Api/google_signin_api.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  String email;
  Body(this.email, {Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(height: size.height * 0.10),
            SvgPicture.asset(
              "assets/icons/DUKKANTEK.svg",

              color: kPrimaryColor,
              height: size.height * 0.15,
            ),
            SizedBox(height: size.height * 0.10),
            Text("Welcome "+ widget.email,
              style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
