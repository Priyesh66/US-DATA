import 'package:covid_19/misc/helper.dart';
import 'package:flutter/cupertino.dart';

class MyStateSingleValue {
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
    "OR":"Orgeon",
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

  String _stateCode;
  String _status;
  String _stateName;
  int _value;
  String _dateString;
  DateTime _date;

  MyStateSingleValue({@required String stateCode, @required String status, @required int value, @required String dateString}) {
    this._stateCode = stateCode;
    this._stateName = stateNamesMap[stateCode.toUpperCase()];
    this._status = status;
    this._value = value != null ? value : 0;
    this._dateString = dateString;
    this._date = Helper.parseDateTimeDDMMMYY(dateString);
  }

  set stateCode(String stateCode) => this._stateCode = stateCode;
  set status(String status) => this._status = status;
  set statename(String stateCode) => this._stateName = stateNamesMap[stateCode.toUpperCase()];
  set value(int value) => this._value = value;
  set dateString(String dateString) => this._dateString = dateString;
  set date(DateTime date) => this._date = date;

  String get stateCode => this._stateCode;
  String get stateName => this._stateName;
  String get status => this._status;
  int get value => this._value;
  String get dateString => this._dateString;
  DateTime get date => this._date;

  bool equals({String stateCode}) {
    if (stateCode.toUpperCase() == this._stateCode || stateCode.toLowerCase() == this._stateCode) return true;
    return false;
  }

  bool dateEquals(String dateString) {
    return this._dateString == dateString;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "   { stateCode : $stateCode, status : $status, value : $value, dateString : $dateString, date : ${date.toString()}} ";
  }
}
