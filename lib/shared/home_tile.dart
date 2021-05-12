import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTile extends StatelessWidget {
  final deviceSize;
  final onPressed;
  final text;

  final Color tileCol;
  final String imgAdr;

  HomeTile(
      {this.deviceSize, this.onPressed, this.text, this.tileCol, this.imgAdr});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0.0),
        minimumSize: Size(0, deviceSize.height * 0.10),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Container(
            height: deviceSize.height * 0.2,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              color: tileCol,
              borderRadius: BorderRadius.circular(5),
              boxShadow: ([
                BoxShadow(
                    color: Colors.grey[350],
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: Offset(4, 4)),
              ]),
            ),
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: deviceSize.height * 0.13,
                  child: Image(
                    image: AssetImage(imgAdr),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
