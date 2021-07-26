import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'airportControrller.dart';
import 'airportListModel.dart';

typedef AirportResponse = AirportList? Function(AirportList);

class AirportSelector {
  showAirportSelectorSheet(
      BuildContext context, String titile, AirportResponse airportResponse) {
    AirportController airportController = Get.find();
    airportController.airportList.airportList =
        airportController.airport.airportList;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // set this to true
        backgroundColor: Colors.transparent,
        builder: (_) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.8,
              minChildSize: 0.3,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return GetBuilder<AirportController>(
                  builder: (controller) => ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            child: Text(titile,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.transparent,
                                    color: Colors.grey.shade600)),
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
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        controller.airport.airportList =
                                            controller.airportList.airportList!
                                                .where((element) => element
                                                    .airportCode!
                                                    .toLowerCase()
                                                    .startsWith(
                                                        value.toLowerCase()))
                                                .toList();
                                      } else
                                        controller.airport.airportList =
                                            controller.airportList.airportList;

                                      controller.update();
                                    },
                                    decoration: InputDecoration(
                                        //labelText: "Search",
                                        hintText: "Search",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemCount: controller.airport.airportList!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    {
                                      airportResponse(controller
                                          .airportList.airportList![index]);
                                      Get.back();
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.1, horizontal: 0),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 17),
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          controller
                                                              .airport
                                                              .airportList![
                                                                  index]
                                                              .airportName!,
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade800,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                      Text(
                                                          '${controller.airport.airportList![index].countryCode!}, ${controller.airport.airportList![index].airportShortName!}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ],
                                                  ),
                                                  Text(
                                                    controller
                                                        .airport
                                                        .airportList![index]
                                                        .airportCode!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 20),
                                          child: Divider(
                                              color: Colors.black26,
                                              height: 0.2),
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
                  ),
                );
              },
            ),
          );
        });
  }
}
