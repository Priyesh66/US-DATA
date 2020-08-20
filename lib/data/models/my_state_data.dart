class MyStateData {
  String _state;
  String _stateCode;
  int _active;
  int _confirmed;
  int _deaths;
  int _recovered;
  int _todayConfirmed;

  int _todayDeaths;
  int _todayActive;

  MyStateData({String state, String stateCode, String lastUpdatedTime, String stateNotes, int active, int confirmed, int deaths, int recovered, int todayConfirmed, int todayRecovered, int todayDeaths}) {
    this._state = state;
    this._stateCode = stateCode;

    this._active = confirmed-recovered-deaths;
    this._confirmed = confirmed;
    this._deaths = deaths;
    this._recovered = recovered;
    this._todayConfirmed = todayConfirmed;

    this._todayDeaths = todayDeaths;

  }

  factory MyStateData.fromJson(Map<String, dynamic> json) {
    return MyStateData(
      state: json["state"],
      stateCode: json["state"],

      confirmed: (json["positive"]) ?? 0,
      recovered: (json["recovered"]) ?? 0,
      deaths: (json["death"]) ?? 0,
      todayConfirmed: (json["positiveIncrease"]) ?? 0,
      todayDeaths: (json["deathIncrease"]) ?? 0,

    );
  }

  factory MyStateData.fromDistrictJson(Map<String, dynamic> districtJson) {
    return MyStateData(
      state: districtJson["City"],


      active: districtJson["Active"],
      confirmed: districtJson["Confirmed"],
      recovered: districtJson["Recovered"],
      deaths: districtJson["Deaths"],
      todayConfirmed: districtJson["NewConfirmed"],
      todayRecovered: districtJson["NewRecovered"],
      todayDeaths: districtJson["NewDeaths"],
    );
  }

  set state(String state) => this._state = state;
  set stateCode(String stateCode) => this._stateCode = stateCode;

  set active(int active) => this._active = active;
  set confirmed(int confirmed) => this._confirmed = confirmed;
  set deaths(int deaths) => this._deaths = deaths;
  set recovered(int recovered) => this._recovered = recovered;
  set todayConfirmed(int todayConfirmed) => this._todayConfirmed = todayConfirmed;

  set todayDeaths(int todayDeaths) => this._todayDeaths = todayDeaths;

  String get state => this._state;
  String get stateCode => this._stateCode;

  int get active => this._active;
  int get confirmed => this._confirmed;
  int get deaths => this._deaths;
  int get recovered => this._recovered;
  int get todayConfirmed => this._todayConfirmed;

  int get todayDeaths => this._todayDeaths;

  @override
  String toString() {
    String data = "state: " + _state + ", stateCode: " + _stateCode  + ", active: " + _active.toString() + ", confirmed:" + _confirmed.toString() + ", deaths: " + _deaths.toString() + ", recovered:" + _recovered.toString() + ", todayConfirmed:" + _todayConfirmed.toString() + ", todayDeaths: " + _todayDeaths.toString() + ", todayActive: " + _todayActive.toString();

    return data;
  }
}
