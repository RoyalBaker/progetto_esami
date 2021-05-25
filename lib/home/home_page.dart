import 'dart:ui';

import 'package:base_bloc/bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progetto_esami/home/home_state.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_bloc/template_bloc.dart';

class MyHomePage extends BaseWidget {
  MyHomePage(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage, TemplateBloc> {
  @override
  Widget build(BuildContext context) {
    return getNameWidget();
  }

  Widget getNameWidget() {
    return StreamBuilder(
        stream: bloc.getStreamOfType<WeatherDataState>(),
        builder: (BuildContext context, AsyncSnapshot<WeatherDataState> snapshot) {
          if (snapshot.data == null) {
            return Scaffold(body: Container());
          }
          return Scaffold(
            backgroundColor: Colors.lime,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    topWidget(snapshot.data!.getLocation(), snapshot.data!.getTemperature()),
                    Spacer(),
                    bottomWidget(snapshot.data!),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget bottomWidget(WeatherDataState weatherDataState) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 3)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                columnValue("Alcohol", weatherDataState.getAlcohol()),
                columnValue("Humidity", weatherDataState.getHumidity()),
                columnValue("Lpg", weatherDataState.getLpg()),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                columnValue("Pressure", weatherDataState.getPressure()),
                columnValue("Rain", weatherDataState.getRain()),
                columnValue("Smoke", weatherDataState.getSmoke()),
              ],
            ),
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

  Widget topWidget(String location, String temperature) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(location, style: TextStyle(fontSize: 40, color: Colors.white)),
        Text(temperature + "°", textAlign: TextAlign.start, style: TextStyle(fontSize: 200, color: Colors.white))
      ],
    );
  }
}
