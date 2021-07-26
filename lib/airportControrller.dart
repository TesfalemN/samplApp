import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

import 'airportListModel.dart';
import 'baseUrl.dart';

class AirportController extends GetxController {
  var airport = Airport();
  var airportList = Airport();
  AirportController() {
    var airporta = AirportList();
    airporta.airportName = "Addis Ababa Bole International Airpot";
    airporta.countryCode = "Ethiopia";
    airporta.airportShortName = "Africa";
    airporta.airportCode = "ADD";

    var airportas = AirportList();
    airportas.airportName = "Dubia International Airpot";
    airportas.countryCode = "Ethiopia";
    airportas.airportShortName = "Africa";
    airportas.airportCode = "DXB";

    var airportass = AirportList();
    airportass.airportName = "Addis International Airpot";
    airportass.countryCode = "Ethiopia";
    airportass.airportShortName = "Africa";
    airportass.airportCode = "ACB";

    airport.airportList = <AirportList>[airportass];
  }
  Future getAirportSllist() async {
    BaseHttpClient httpClient = BaseHttpClient();
    Request request = Request(
        "GET",
        Uri.parse(
            "https://aks-cluster-dev.ethiopianairlines.com/_masterdatasvc-masterdata/V1.0/api/Airport/GetAirportList?memoryCachRefresh=false"));
    request.headers.addAll({
      "Authorization":
          "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjY4RTNBQ0Q3NkU5Mzk4MUNGQkZGRUMyNjdCNUYwQjQzM0ZCNzI2RjJSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6ImFPT3MxMjZUbUJ6N18td21lMThMUXotM0p2SSJ9.eyJuYmYiOjE2MjcyNzc3NjksImV4cCI6MTYyNzI4MTM2OSwiaXNzIjoibnVsbCIsImF1ZCI6InJlc291cmNlcy5zYW1wbGUuYXBpIiwiY2xpZW50X2lkIjoiY2xpZW50IiwiY2xpZW50X2FjY2VzcyI6IkVUREMiLCJqdGkiOiI4MEMzOUQ5NENDNjA0NDAzOENEMDIxODg1QjNFRUY1MSIsImlhdCI6MTYyNzI3Nzc2OSwic2NvcGUiOlsic2NvcGVzLnNhbXBsZS5hcGkiXX0.Nu8tABVM10SEqDcLx5ExCb5OVCMg-iHgG2CfACHbAASgQ-F34gB4Sw8M_tVkbvjHNg93Bw_NNxbtyUuLoB6BtqCWK_CGlUq6jAPq0Awn6EU53gilMcGt7WmyiSabRGiFL7vHNNYjrhR31V_W_GoUfWsgoDpO_oHrNtE_bt3f2pkId2kPj5oIEmctthZTxA_EWfE8wpHVj3-sMNDYpcm0JVychiZM5UUQzD8je21Sl-0aPaEC8ZOOdrXQTCGRHm8fUBLc2_GJ5mwmU4pKf2LRfdjDAHL4hNk6UqBo1lLfpl8OXFenDRtNeIu6Zi5USxf-c31U85tgWsJtLFdE87lf2w"
    });
    var response = await httpClient.send(request);
    var body = await response.stream.bytesToString();

    //airport.airportList!.addAll(airportFromJson(body).airportList!);
    print(airport);
    update();
  }
}
