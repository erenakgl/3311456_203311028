import 'package:flutter/material.dart';
import 'package:healthcycle_app/constants.dart';

/*import 'image_and_icons.dart';
import 'title_and_price.dart';*/

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
