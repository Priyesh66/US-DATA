import 'package:covid_19/animations/widget_enter_anim.dart';
import 'package:covid_19/bloc/district_data_bloc.dart';
import 'package:covid_19/bloc/state_data_bloc.dart';
import 'package:covid_19/data/models/my_state_data.dart';
import 'package:covid_19/data/repos/patientrepository.dart';

import 'package:covid_19/ui/widgets/state_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatePage extends StatelessWidget {
  final String title;
  final MyStateData stateData;
  const StatePage({Key key, @required this.title, @required this.stateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StateDataBloc>(
          create: (BuildContext context) => StateDataBloc(
            patientRepository: CovidPatientRepository(),
          ),
        ),
        BlocProvider<DistrictDataBloc>(
          create: (BuildContext context) => DistrictDataBloc(
            patientRepository: CovidPatientRepository(),
          ),
        ),
      ],
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[50],
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(

            body: SafeArea(
              child: ListView(
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                children: <Widget>[

                  WidgetEnterAnimation(
                    delay: 0,
                    child: StateDetails(
                      stateData: stateData,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
