import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TwoFact extends StatefulWidget {
  const TwoFact({Key? key}) : super(key: key);

  @override
  _TwoFactState createState() => _TwoFactState();
}

class _TwoFactState extends State<TwoFact> {
  var authController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Two factor authentification ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Mukta',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the code sent to your phone",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Mukta',
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: authController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      gapPadding: 2.0, borderRadius: BorderRadius.circular(15)),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Mukta',
                    fontSize: 18,
                  ),
                  hintText: "Code",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: ColoredContainer(
                    text: "Submit",
                    color: Color(0xffF7991D),
                  ),
                ),
              ),
            ],
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
