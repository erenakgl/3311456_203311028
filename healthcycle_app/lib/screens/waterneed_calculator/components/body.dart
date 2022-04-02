import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WaterCalculator(),
    );
  }
}

class WaterCalculator extends StatefulWidget {
  const WaterCalculator({Key? key}) : super(key: key);

  @override
  State<WaterCalculator> createState() => _WaterCalculatorState();
}

class _WaterCalculatorState extends State<WaterCalculator> {
  int currentindex = 0;
  String result = "";
  double weight = 0;

  //for dropdown button
  String value_choose = "normal";
  List list_item = ["very little", "normal", "a lot"];

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton(("Man"), Colors.blue, 0),
                    radioButton(("Woman"), Colors.pink, 1),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Your Weight in kg:",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Weight in kg",
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
                const Text(
                  "Your Activity rate:",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                DropdownButton(
                  alignment: Alignment.center,
                  hint: const Text("Select Activity"),
                  value: value_choose,
                  onChanged: (newValue) {
                    setState(() {
                      value_choose = newValue.toString();
                    });
                  },
                  items: list_item.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        weight = double.parse(weightController.value.text);
                      });

                      calculateWaterNeeds(weight);
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
                Container(
                  width: double.infinity,
                  child: const Text(
                    "Your Daily Water Needs is :",
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
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
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
      ),
    );
  }

  void calculateWaterNeeds(double weight) {
    double finalresult = weight * (0.03) + (currentindex == 0 ? 0.5 : 0.25);
    switch (value_choose) {
      case "very little":
        {
          finalresult -= .5;
        }
        break;
      case "a lot":
        {
          finalresult += .75;
        }
        break;
      default:
        {
          finalresult += 0;
        }
        break;
    }

    String waterneed = finalresult.toStringAsFixed(2);
    setState(() {
      result = waterneed + " lt /day";
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
      child: FlatButton(
        color: currentindex == index ? color : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          changeIndex(index);
        },
        child: Text(
          value,
          style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
