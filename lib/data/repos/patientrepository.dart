import 'dart:convert';


import 'package:covid_19/data/models/my_state_data.dart';
import 'package:covid_19/data/models/my_state_single_value.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


abstract class PatientRepository {
  Future<Map<String, List>> fetchPatientData();
  Future<Map<String, List<MyStateSingleValue>>> fetchStatePatientDailyData(String stateCode);
  Future<List<MyStateData>> fetchDistrictWiseData(String stateCode);
}

class CovidPatientRepository extends PatientRepository {
  static const String CLASS_TAG = "PatientRepository";
  @override
  Future<Map<String, List>> fetchPatientData() async {
    Map<String, List> patientDataMap = Map();
    List<MyStateData> stateDataList = List();

    String url = "https://covidtracking.com/api/states";
    var res = await http.get(Uri.encodeFull(url), headers: {
      "Accept": "appplication/json"
    });

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var stateWise = data as List;

      stateDataList = stateWise.map<MyStateData>((json) => MyStateData.fromJson(json)).toList();
      patientDataMap["state_wise_data"] = stateDataList;

    } else {
      print("Error Thrown");
      throw Error();
    }
    print("List length: ${stateDataList.length}");
    print(stateDataList);

    return patientDataMap;
  }

  @override
  Future<Map<String, List<MyStateSingleValue>>> fetchStatePatientDailyData(String stateCode) async {
    Map<String, List<MyStateSingleValue>> statePatientDataMap = Map();

    final String url = "https://covidtracking.com/api/v1/states/daily.json";


    var stateDailyRes = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    List<MyStateSingleValue> cnfStateCumulativeDataList = List();
    List<MyStateSingleValue> rcvrdStateCumulativeDataList = List();
    List<MyStateSingleValue> deathsStateCumulativeDataList = List();
    List<MyStateSingleValue> activeStateCumulativeDataList = List();


    int i ;



    var data = json.decode(stateDailyRes.body) as List;

    for (i = 0; i < data.length; i++) {
      var dailyStateData = data[i] as Map;
      if (dailyStateData.containsValue(stateCode)) {
        String strDt = dailyStateData["date"].toString();
        DateTime parseDt = DateTime.parse(strDt);
        var newFormat = DateFormat("dd-MMM-yyyy");
        String updatedDt = newFormat.format(parseDt);
        int  v = (dailyStateData["positive"]) ?? 0;
        int  l = (dailyStateData["recovered"]) ?? 0;
        int  k = (dailyStateData["death"]) ?? 0;






        cnfStateCumulativeDataList.add(MyStateSingleValue(stateCode: stateCode, status: "Confirmed", dateString: updatedDt, value: dailyStateData["positive"]));
        rcvrdStateCumulativeDataList.add(MyStateSingleValue(stateCode: stateCode, status: "Recovered", dateString: updatedDt, value: dailyStateData["recovered"]));
        deathsStateCumulativeDataList.add(MyStateSingleValue(stateCode: stateCode, status: "Deaths", dateString: updatedDt, value: dailyStateData["death"]));
        activeStateCumulativeDataList.add(MyStateSingleValue(stateCode: stateCode, status: "Active", dateString:updatedDt, value: v-l-k));




      }


    }
    statePatientDataMap["cnf_state_cumulative_data"] = cnfStateCumulativeDataList.toList();
    statePatientDataMap["rcvrd_state_cumulative_data"] = rcvrdStateCumulativeDataList.toList();
    statePatientDataMap["deaths_state_cumulative_data"] = deathsStateCumulativeDataList.toList();
    statePatientDataMap["active_state_cumulative_data"] = activeStateCumulativeDataList.toList();

    print(statePatientDataMap["cnf_state_cumulative_data"]);
    return statePatientDataMap;
  }

  @override
  Future<List<MyStateData>> fetchDistrictWiseData(String stateCode) async {

    final String utp ="https://corona.azure-api.net/country/us/";
    List<MyStateData> districtWiseData = List();
    var districtDailyRes = await http
        .get(Uri.encodeFull(utp), headers: {"Accept": "application/json"});
    if(districtDailyRes.statusCode ==200){
      Map<String, String> stateNamesMap = {
        "AK": "Alaska",
        "AL": "Alabama",
        "AR": "Arkansas",
        "AS": "American Samoa",
        "AZ": "Arizona",
        "CA": "California",
        "CO": "Colorado",
        "CT": "Connecticut",
        "DC": "District of Columbia",
        "DE": "Delaware",
        "FL": "Florida",
        "GA": "Georgia",
        "GU":"Guam",
        "HI": "Hawaii",
        "ID": "Idaho",
        "IL": "Illinois",
        "IN": "Indiana",
        "IA": "Iowa",
        "KS":"Kansas",
        "NY":"New York",
        "SC":"South Carolina",
        "LA":"Louisiana",
        "VA":"Virginia",
        "KY":"Kentucky",
        "MO":"Missouri",
        "OK":"Oklahoma",
        "MS":"Mississippi",
        "NE":"Nebraska",
        "ND":"North Dakota",
        "OH":"Ohio",
        "PA":"Pennsylvania",
        "WA":"Washington",
        "WI":"Wisconsin",
        "VT":"Vermont",
        "PR":"Puerto Rico",
        "MN":"Minnesota",
        "NC":"North Carolina",
        "WY":"Wyoming",
        "MD":"Maryland",
        "TN":"Tennessee",
        "TX":"Texas",
        "ME":"Maine",
        "MI":"Michigan",
        "NJ":"New Jersey",
        "SD":"South Dakota",
        "OR":"Oregon",
        "WV":"West Virginia",
        "MA":"Massachusetts",
        "UT":"Utah",
        "MT":"Montana",
        "NM":"New Mexico",
        "NH":"New Hampshire",
        "RI":"Rhode Island",
        "NV":"Nevada",
        "MP":"North Mariana Islands",
        "VI":"Virgin Islands",
      };
    var bata = json.decode(districtDailyRes.body) as Map;
    var flutter =  bata["State"] as List;
    var districtData = flutter.firstWhere((item) => item["Province_State"] == stateNamesMap[stateCode]);
    var CityData = districtData["City"] as List;
    districtWiseData = CityData.map<MyStateData>((json) => MyStateData.fromDistrictJson(json)).toList();}
print(districtWiseData);
    print("District Data Is: ${districtWiseData.toString()}");
    return districtWiseData;
  }
}
