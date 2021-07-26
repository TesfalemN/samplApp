import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DatePickerPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class DatePickerPage extends StatefulWidget {
  DatePickerPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: 0.80,
          initialChildSize: 0.80,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            return SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              //height: 20,
                              child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text('Airports',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.transparent)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    _showSheet(context);
                                  },
                                  icon: Icon(Icons.recent_actors_outlined,
                                      size: 15, color: Colors.grey),
                                  label: Text('Recent Airports',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffDEE6EE)))),
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.near_me_outlined,
                                      size: 15, color: Colors.grey),
                                  label: Text('Nearby',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffEBF0FE)))),
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border,
                                      size: 15, color: Colors.grey),
                                  label: Text('Favorites',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffEBF0FE))))
                            ]),
                      ),
                    ),
                    Container(
                      color: Colors.white, //Color(0xffF2F1F6),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Color(0xffE4E3EA),
                            child: TextField(
                              cursorColor: Colors.black,
                              cursorWidth: 1,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  //labelText: "Search",
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none
                                  // OutlineInputBorder(  borderSide: BorderSide(color: Colors.black),
                                  //     borderRadius: BorderRadius.all(Radius.circular(5.0)))
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              //if (list.any((item) => item.isSelected))
                              {
                                setState(() {
                                  list[index].isSelected =
                                      !list[index].isSelected;
                                  print(list[index].data);
                                });
                              }
                            },
                            // onLongPress: () {
                            //   setState(() {
                            //     list[index].isSelected = true;
                            //   });
                            // },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.1, horizontal: 0),
                              color: list[index].isSelected
                                  ? Colors.red[100]
                                  : Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 20),
                                    child: Text(list[index].data,
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 20),
                                    child: Divider(
                                        color: Colors.black26, height: 0.2),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // set this to true
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DraggableScrollableSheet(
          maxChildSize: 0.9,
          initialChildSize: 0.9,
          minChildSize: 0.3,
          builder: (BuildContext context, ScrollController scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Text('Airports',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.transparent)),
                    ),
                    Container(
                      color: Colors.white, //Color(0xffF2F1F6),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            color: Color(0xffE4E3EA),
                            child: TextField(
                              cursorColor: Colors.black,
                              cursorWidth: 1,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  //labelText: "Search",
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none

// OutlineInputBorder(  borderSide: BorderSide(color: Colors.black),
                                  //     borderRadius: BorderRadius.all(Radius.circular(5.0)))
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              //if (list.any((item) => item.isSelected))
                              {
                                setState(() {
                                  list[index].isSelected =
                                      !list[index].isSelected;
                                  print(list[index].data);
                                });
                              }
                            },
                            // onLongPress: () {
                            //   setState(() {
                            //     list[index].isSelected = true;
                            //   });
                            // },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.1, horizontal: 0),
                              color: list[index].isSelected
                                  ? Colors.red[100]
                                  : Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 20),
                                    child: Text(list[index].data,
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 20),
                                    child: Divider(
                                        color: Colors.black26, height: 0.2),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ListItem {
  bool isSelected = false; //Selection property to highlight or not
  String data; //Data of the user
  ListItem(this.data); //Constructor to assign the data
}
