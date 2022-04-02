import 'package:flutter/material.dart';
import 'package:healthcycle_app/screens/dailyactivity_list/components/checkbox_state.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DailyActivtyList(),
    );
  }
}

class DailyActivtyList extends StatefulWidget {
  const DailyActivtyList({Key? key}) : super(key: key);

  @override
  State<DailyActivtyList> createState() => _DailyActivtyListState();
}

class _DailyActivtyListState extends State<DailyActivtyList> {
  final allActivities = CheckBoxState(title: 'Complete All');

  final activities = [
    CheckBoxState(title: 'Drink water before anything else'),
    CheckBoxState(title: 'Morning walk min 30 minutes'),
    CheckBoxState(title: 'Eat a good breakfast.'),
    CheckBoxState(title: 'Read something'),
    CheckBoxState(title: 'Spend some time alone'),
    CheckBoxState(title: 'Min 3 glass of water'),
    CheckBoxState(title: 'Go to bed Early'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            buildGroupCheckbox(allActivities),
            Divider(color: Colors.purple),
            ...activities.map(buildSingleCheckbox).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxState checkBox) => CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.purple,
      value: checkBox.value,
      title: Text(
        checkBox.title,
        style: TextStyle(fontSize: 20),
      ),
      onChanged: (value) => setState(() {
            checkBox.value = value!;
            allActivities.value =
                activities.every((activity) => activity.value);
          }));

  Widget buildGroupCheckbox(CheckBoxState checkBox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.purple,
        value: checkBox.value,
        title: Text(
          checkBox.title,
          style: TextStyle(fontSize: 20),
        ),
        onChanged: toggleGroupCheckbox,
      );

  void toggleGroupCheckbox(bool? value) {
    if (value == null) return;

    setState(() {
      allActivities.value = value;
      activities.forEach((activity) => activity.value = value);
    });
  }
}
