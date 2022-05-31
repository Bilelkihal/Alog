import 'dart:convert';
import 'dart:math';

import 'package:alog/TwoFact.dart';
import 'package:encryptor/encryptor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'back/apiConnection.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mukta',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in your account  ",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Mukta',
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Mukta',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            gapPadding: 2.0,
                            borderRadius: BorderRadius.circular(15)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mukta',
                          fontSize: 18,
                        ),
                        hintText: "Email",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Mukta',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: PasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            gapPadding: 2.0,
                            borderRadius: BorderRadius.circular(15)),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mukta',
                          fontSize: 18,
                        ),
                        hintText: "Password",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        /*var password = PasswordController.text;
                        var email = emailController.text;
                        var key = 'Bilel';
                        var encryptedPassword =
                            Encryptor.encrypt(key, password);
                        log(encryptedPassword);
                        // the post request to the server
                        Map info = {
                          "mdp": encryptedPassword,
                          "email": email,
                        };
                        log("begin");
                        Response responseJson = await postRequest(info);
                        log("end0");
                        var response = json.decode(responseJson.body) as Map;
                        log("end1");
                        log(response.toString());
                        log("end2"); */
                        // todo if the password is correct then pass else error
                        var themail = emailController.text;
                        var thecode = getRandString(6);
                        //sendEmail(email: themail, code: thecode);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TwoFact(thecode)));
                      },
                      child: ColoredContainer(
                        text: "Login",
                        color: Color(0xffF7991D),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Or  ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "not a membre ? Join now",
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColoredContainer extends StatelessWidget {
  var color;
  var text;
  var textColor;
  var icon;
  ColoredContainer(
      {Key? key,
      this.text = "",
      this.color,
      this.textColor = Colors.white,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Mukta',
          ),
        ),
      ),
    );
  }
}

Future sendEmail({
  required String email,
  required String code,
}) async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(
    url,
    headers: {'origin': 'http://localhost', 'content-type': 'application/json'},
    body: json.encode({
      'service_id': 'service_ivqyena',
      'template_id': 'template_9695tge',
      'user_id': 'W3Hv70p_KqF6hwZiF',
      'template_params': {
        'send_to': email,
        'code': code,
      },
    }),
  );
}

String getRandString(int len) {
  var rng = new Random();
  var code = rng.nextInt(900000) + 100000;
  return code.toString();
}
