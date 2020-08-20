import 'package:covid_19/animations/widget_enter_anim.dart';
import 'package:covid_19/data/models/my_state_data.dart';
import 'package:covid_19/misc/helper.dart';
import 'package:covid_19/ui/pages/state_page.dart';
import 'package:flutter/material.dart';

class PatientDataTable extends StatefulWidget {
  final List<MyStateData> stateWiseData;
  final double _rowAnimDelay = 1.5;
  final bool isStateDataTable;

  PatientDataTable({Key key, @required this.stateWiseData, @required this.isStateDataTable}) : super(key: key);

  @override
  _PatientDataTableState createState() => _PatientDataTableState();
}

class _PatientDataTableState extends State<PatientDataTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 32,
      ),
      child: Column(
        children: <Widget>[
          WidgetEnterAnimation(
            delay: widget._rowAnimDelay,
            child: Column(
              children: <Widget>[
                buildTableHeaderRow()
              ],
            ),
          ),
          WidgetEnterAnimation(
            delay: widget._rowAnimDelay + 0.5,
            child: Column(
              children: buildTable(),
            ),
          ),
          widget.isStateDataTable
              ? Column(
                  children: <Widget>[
                    WidgetEnterAnimation(
                      delay: widget._rowAnimDelay + 0.75,
                      child: buildTableRow(0, widget.stateWiseData.firstWhere((item) => item.state == "WY")),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  List<Widget> buildTable() {
    return List<Widget>.generate(widget.stateWiseData.length, (index) {
      if (widget.stateWiseData[index].state == "WY") {
        return Container();
      }
      return buildTableRow(index, widget.stateWiseData[index]);
    });
  }

  Widget buildTableHeaderRow() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // State Name Cell
            Expanded(
              flex: 16,
              child: Tooltip(
                message: widget.isStateDataTable ? "State Name" : "City Name",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black.withAlpha(5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.isStateDataTable ? "State" : "Cities",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.black.withBlue(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Confirmed Count Cell
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Confirmed",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueAccent.withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Confirmed",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.blueAccent,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Active Count Cell
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Active",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.amberAccent[700].withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Active",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.amberAccent[700],
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Recovered Count Cell
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Recovered",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.greenAccent[700].withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Recovered",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.greenAccent[700],
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Deaths Count Cell
            Expanded(
              flex: 8,
              child: Tooltip(
                message: "Deaths",
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.redAccent.withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Death",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.redAccent,
                        fontSize: 10
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Widget buildTableRow(int index, MyStateData stateData) {

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


    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              if (widget.isStateDataTable) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatePage(
                      title: stateData.state,
                      stateData: stateData,
                    ),
                    settings: RouteSettings(name: "home/india/${stateData.state}/details_page"),
                  ),
                );
              }
            },
            borderRadius: BorderRadius.circular(4),
            splashColor: Colors.blueAccent.withOpacity(0.3),
            highlightColor: Colors.blueAccent.withOpacity(0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // State Name Cell
                Expanded(
                  flex: 16,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black.withAlpha(5),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                     stateNamesMap[stateData.state],
                        style: TextStyle(
                          fontWeight: stateData.state != "WY" ? FontWeight.w600 : FontWeight.w900,
                          fontSize: stateData.state != "WY" ? 14 : 16,
                          color: Colors.black.withBlue(100),
                        ),
                      ),
                    ),
                  ),
                ),
                // Confirmed Count Cell
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blueAccent.withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        stateData.todayConfirmed != 0
                            ? Text(
                                stateData.state != "WY" ? (stateData.todayConfirmed.isNegative ? "" : "+") + Helper.formatNumber(stateData.todayConfirmed) : Helper.formatNumberAsThousands(stateData.todayConfirmed),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.blueAccent,
                                ),
                              )
                            : Container(),
                        Text(
                          stateData.confirmed == 0 ? "-" : (stateData.state != "WY" && stateData.confirmed < 100000 ? Helper.formatNumber(stateData.confirmed) : Helper.formatNumberAsThousands(stateData.confirmed)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: stateData.state != "WY" ? Colors.black.withAlpha(170) : Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Active Count Cell
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.amberAccent[700].withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Text(
                          stateData.active == 0 ? "-" : (stateData.state != "WY" && stateData.active < 100000 ? Helper.formatNumber(stateData.active) : Helper.formatNumberAsThousands(stateData.active)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: stateData.state != "WY" ? Colors.black.withAlpha(170) : Colors.amberAccent[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Recovered Count Cell
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.greenAccent[700].withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Text(
                          stateData.recovered == 0 ? "-" : (stateData.state != "WY" && stateData.recovered < 100000 ? Helper.formatNumber(stateData.recovered) : Helper.formatNumberAsThousands(stateData.recovered)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: stateData.state != "WY" ? Colors.black.withAlpha(170) : Colors.greenAccent[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Deaths Count Cell
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.redAccent.withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        stateData.todayDeaths != 0
                            ? Text(
                                stateData.state != "WY" ? (stateData.todayDeaths.isNegative ? "" : "+") + Helper.formatNumber(stateData.todayDeaths) : Helper.formatNumberAsThousands(stateData.todayDeaths),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.redAccent[700],
                                ),
                              )
                            : Container(),
                        Text(
                          stateData.deaths == 0 ? "_" : (stateData.state != "WY" && stateData.deaths < 100000 ? Helper.formatNumber(stateData.deaths) : Helper.formatNumberAsThousands(stateData.deaths)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: stateData.state != "WY" ? Colors.black.withAlpha(170) : Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
