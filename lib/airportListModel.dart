// To parse this JSON data, do
//
//     final airport = airportFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'airportListModel.g.dart';

Airport airportFromJson(String str) => Airport.fromJson(json.decode(str));

String airportToJson(Airport data) => json.encode(data.toJson());

@JsonSerializable()
class Airport {
  List<AirportList>? airportList;
  Airport();

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);

  Map<String, dynamic> toJson() => _$AirportToJson(this);
}

@JsonSerializable()
class AirportList {
  AirportList();

  String? airportShortName;
  String? airportCode;
  String? airportName;
  String? countryCode;
  bool isDomestic = false;
  String? hyperlink;
  bool hasInformative = false;
  bool isBirthDateRequired = false;
  String? airportNameEn;
  bool hasTrain = false;
  String? trainStationsCode;
  String? trainStationsNameEn;
  String? trainStationsName;
  String? trainStationsShortName;
  String? trainStationsCountryCode;
  bool isArrivalAirportOnly = false;
  bool isDepartureAirportOnly = false;
  List<String>? arrivalAirportDisalowedCodes;
  List<String>? departureAirportDisalowedCodes;
  bool hasArrivalCombinablityRule = false;
  bool hasDepartureCombinablityRule = false;
  List<String>? topDestinations;
  bool isOffline = false;
  String? destinationImage;
  String? destinationImageMini;

  factory AirportList.fromJson(Map<String, dynamic> json) =>
      _$AirportListFromJson(json);

  Map<String, dynamic> toJson() => _$AirportListToJson(this);
}
