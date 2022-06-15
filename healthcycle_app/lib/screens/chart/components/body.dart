import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ChartScreen();
  }
}

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
 late List<GDPData> _chartData;

  TextEditingController weightController = TextEditingController();
 @override
 void initState()
 {
   _chartData = getChartData();
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SfCircularChart(
          title: ChartTitle(text: 'Continent health GDP - 2021'),
          legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
          RadialBarSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data,_)=> data.continent,
            yValueMapper: (GDPData data,_)=> data.gdp,
            dataLabelSettings: DataLabelSettings(isVisible: true))
        ],),
      ),
    );
  }
  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Asia", 20000),
      GDPData("Africa", 1000),
      GDPData("Oceania", 15000),
      GDPData("S America", 10000),
      GDPData("Europe", 30000),
      GDPData("N America", 7500),
    ];
    return chartData;
  }
}

class GDPData{
  GDPData(this.continent,this.gdp);
  final String continent;
  final int gdp;
}
