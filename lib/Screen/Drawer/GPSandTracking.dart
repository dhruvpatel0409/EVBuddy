import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import 'HelpCenter.dart';
// import 'g_p_sand_tracking_model.dart';
// export 'g_p_sand_tracking_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GPSandTrackingWidget(),
    );
  }
}

class GPSandTrackingWidget extends StatefulWidget {
  const GPSandTrackingWidget({Key? key}) : super(key: key);

  @override
  _GPSandTrackingWidgetState createState() => _GPSandTrackingWidgetState();
}

class _GPSandTrackingWidgetState extends State<GPSandTrackingWidget> {
  // late GPSandTrackingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => TechnicianandServiceModel());

    // On page load action.
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   context.pushNamed('HelpCenter');
    // });
  }

  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   _model.dispose();

  //   _unfocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: InkWell(
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => helpCenter()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF1A74E2),
              size: 33,
            ),
          ),
        ),
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            'GPS  and Tracking ',
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF1A74E2),
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                    child: Text(
                      'First Of All, Open The App.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF3FA0EF),
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                    child: Text(
                      "Enable location services: To take advantage of the GPS integration feature, you will need to enable location services on your mobile device. This will allow the app to access your location and show you the nearest charging stations.",
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF3FA0EF),
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                    child: Text(
                      'Search for charging stations: Open the app and search for charging stations near your current location. The app will display a list of available charging stations, including their distance from your location, the type of charger available, and the availability status.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF3FA0EF),
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                  child: Image.network(
                    'https://pbs.twimg.com/media/Fpgtr-xacAAuocn?format=jpg&name=medium',
                    width: 400,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Text(
                    'Contact Us',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF9E9E9E),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
