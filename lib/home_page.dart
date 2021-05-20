import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              topWidget(),
              Spacer(),
              bottomWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 3)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            columnValue("pressure", "680"),
            columnValue("windth", "30"),
            columnValue("gas", "65"),
          ],
        ),
      ),
    );
  }

  Widget columnValue(String title, String value) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 18, color: Colors.white)),
          Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }

  Widget topWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text("Cassino", style: TextStyle(fontSize: 40, color: Colors.white)),
        Text("20°", textAlign: TextAlign.start,style: TextStyle(fontSize: 200, color: Colors.white))
      ],
    );
  }
}
