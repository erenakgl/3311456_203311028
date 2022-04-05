import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LifeTimeCalculator(),
    );
  }
}

class LifeTimeCalculator extends StatefulWidget {
  const LifeTimeCalculator({Key? key}) : super(key: key);

  @override
  State<LifeTimeCalculator> createState() => _LifeTimeCalculatorState();
}

class _LifeTimeCalculatorState extends State<LifeTimeCalculator> {
  int currentindex = 0;
  String result = "";
  int birth_date = 0;

  TextEditingController birthDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "  Information: The information obtained here has been calculated to be used on Turkey Statistics (TUIK), as it may be on Turkey.",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Colors.deepPurpleAccent, letterSpacing: .5),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Your Birth Year:",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: birthDateController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your birth year",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      FocusManager.instance.primaryFocus?.unfocus();
                      birth_date = int.parse(birthDateController.value.text);
                    });

                    calculateLifeTime(birth_date);
                  },
                  color: Colors.blue,
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Your Avarage Life Time is :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateLifeTime(int lifeTime) {
    int finalresult = lifeTime < 2000 ? 90 : 75;

    String lifetime = finalresult.toStringAsFixed(0);
    setState(() {
      result = lifetime + " year";
    });
  }
}
