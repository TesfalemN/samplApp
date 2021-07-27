import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampledatepicker/airportControrller.dart';

import 'AirportSelector.dart';
import 'datepickerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final duplicateItems =
      List<ListItem>.generate(100, (i) => ListItem("Airport $i"));
  List<ListItem> list = <ListItem>[];
  void populateData() {
    list = [];
    for (int i = 0; i < 100; i++) list.add(ListItem("Airport $i"));
  }

  @override
  void initState() {
    //items.addAll(duplicateItems);
    super.initState();
    populateData();
  }

  AirportController airportController = Get.put(AirportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('SELECT FLIGHT DATE',
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close_rounded),
          onPressed: () {},
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: Text('Open Date Picker'),
            onPressed: () {
              AirportSelector().showAirportSelectorSheet(
                  context, 'Departure airport', (airport) {});
            },
          ),
        ),
      ),
    );
  }
}
