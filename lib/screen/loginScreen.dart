import 'package:covimitr/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/loginBG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 5),
                height: 340,
                width: deviceSize.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.14),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image/virus.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    //Login Form
                    Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // margin: EdgeInsets.symmetric(
                            //   horizontal: deviceSize.width * 0.035,
                            // ),
                            child:
                                //Icon(Icons.account_circle_outlined),
                                Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: deviceSize.width * 0.03,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0.0),
                                    child: Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.6,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      cursorColor:
                                          Colors.white.withOpacity(0.4),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Name",
                                        hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: deviceSize.width * 0.03,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0.0),
                                    child: Icon(
                                      Icons.call_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.6,
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor:
                                          Colors.white.withOpacity(0.4),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            "Mobile Number (Excluding +91)",
                                        hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ),
                            onPressed: () {
                              print("button presseed");
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
