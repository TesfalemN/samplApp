// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airportListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Airport _$AirportFromJson(Map<String, dynamic> json) {
  return Airport()
    ..airportList = (json['airportList'] as List<dynamic>?)
        ?.map((e) => AirportList.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$AirportToJson(Airport instance) => <String, dynamic>{
      'airportList': instance.airportList,
    };

AirportList _$AirportListFromJson(Map<String, dynamic> json) {
  return AirportList()
    ..airportShortName = json['airportShortName'] as String?
    ..airportCode = json['airportCode'] as String?
    ..airportName = json['airportName'] as String?
    ..countryCode = json['countryCode'] as String?
    ..isDomestic = json['isDomestic'] as bool
    ..hyperlink = json['hyperlink'] as String?
    ..hasInformative = json['hasInformative'] as bool
    ..isBirthDateRequired = json['isBirthDateRequired'] as bool
    ..airportNameEn = json['airportNameEn'] as String?
    ..hasTrain = json['hasTrain'] as bool
    ..trainStationsCode = json['trainStationsCode'] as String?
    ..trainStationsNameEn = json['trainStationsNameEn'] as String?
    ..trainStationsName = json['trainStationsName'] as String?
    ..trainStationsShortName = json['trainStationsShortName'] as String?
    ..trainStationsCountryCode = json['trainStationsCountryCode'] as String?
    ..isArrivalAirportOnly = json['isArrivalAirportOnly'] as bool
    ..isDepartureAirportOnly = json['isDepartureAirportOnly'] as bool
    ..arrivalAirportDisalowedCodes =
        (json['arrivalAirportDisalowedCodes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList()
    ..departureAirportDisalowedCodes =
        (json['departureAirportDisalowedCodes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList()
    ..hasArrivalCombinablityRule = json['hasArrivalCombinablityRule'] as bool
    ..hasDepartureCombinablityRule =
        json['hasDepartureCombinablityRule'] as bool
    ..topDestinations = (json['topDestinations'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..isOffline = json['isOffline'] as bool
    ..destinationImage = json['destinationImage'] as String?
    ..destinationImageMini = json['destinationImageMini'] as String?;
}

Map<String, dynamic> _$AirportListToJson(AirportList instance) =>
    <String, dynamic>{
      'airportShortName': instance.airportShortName,
      'airportCode': instance.airportCode,
      'airportName': instance.airportName,
      'countryCode': instance.countryCode,
      'isDomestic': instance.isDomestic,
      'hyperlink': instance.hyperlink,
      'hasInformative': instance.hasInformative,
      'isBirthDateRequired': instance.isBirthDateRequired,
      'airportNameEn': instance.airportNameEn,
      'hasTrain': instance.hasTrain,
      'trainStationsCode': instance.trainStationsCode,
      'trainStationsNameEn': instance.trainStationsNameEn,
      'trainStationsName': instance.trainStationsName,
      'trainStationsShortName': instance.trainStationsShortName,
      'trainStationsCountryCode': instance.trainStationsCountryCode,
      'isArrivalAirportOnly': instance.isArrivalAirportOnly,
      'isDepartureAirportOnly': instance.isDepartureAirportOnly,
      'arrivalAirportDisalowedCodes': instance.arrivalAirportDisalowedCodes,
      'departureAirportDisalowedCodes': instance.departureAirportDisalowedCodes,
      'hasArrivalCombinablityRule': instance.hasArrivalCombinablityRule,
      'hasDepartureCombinablityRule': instance.hasDepartureCombinablityRule,
      'topDestinations': instance.topDestinations,
      'isOffline': instance.isOffline,
      'destinationImage': instance.destinationImage,
      'destinationImageMini': instance.destinationImageMini,
    };
