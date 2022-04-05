import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcycle_app/components/griddashboard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/house.png",
                  width: 25,
                ),
              ],
            ),
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
