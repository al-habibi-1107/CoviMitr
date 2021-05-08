import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final deviceSize;
  final onPressed;
  final text;

  HomeTile({this.deviceSize, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
      onPressed: onPressed,
      child: Center(
        child: Container(
          // height: deviceSize.height * 0.1,
          // width: deviceSize.width * 0.6,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(185, 151, 80, 1),
                width: 0.75,
              ),
              color: Color.fromRGBO(185, 151, 80, 0.3),
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.all(18.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
