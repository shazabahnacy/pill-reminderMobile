import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:ui';
import 'package:medicine_reminder/src/screens/homepage/homepage.dart';
import 'package:medicine_reminder/src/screens/new_entry/editReminder.dart';
//import 'package:medicine_reminder/src/ui/index/index.dart';
import 'package:medicine_reminder/src/screens/register/register.dart';
import 'package:medicine_reminder/src/screens/register/adminlogin.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicine_reminder/src/screens/util/theme_notifier.dart';
import 'package:medicine_reminder/theme.dart';
//import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });

  SharedPreferences.getInstance().then((prefs) {
    var lightmodeOn = prefs.getBool('lightmode') ?? true;

    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(lightmodeOn ? lightTheme : darkTheme),
        child: MedicineReminder(),
      ),
    );
  });
}

class MedicineReminder extends StatefulWidget {
  @override
  _MedicineReminderState createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  void initState() {
    super.initState();
    //final _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      // Theme: ThemeData(
      //   primarySwatch: Colors.purple,
      //   brightness: Brightness.light,

      // ),
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/Editreminder': (BuildContext context) => new Editreminder()
      },
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();
  // void _loginUserWithEmail(String email,String password,BuildContext context)async{
  //     try {
  //       String _returnString = await CurrentUser().loginUserWithEmail(email, password);
  //       if (_returnString == "success") {
  //         Navigator.pop(context);
  //       } else {
  //         // Scaffold.of(context).showSnackBar(
  //         //   SnackBar(
  //         //     content: Text(_returnString),
  //         //     duration: Duration(seconds: 2),
  //         //   ),
  //         // );
  //         print("errorrrr");
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //resizeToAvoidBottomPadding: false,
        body: ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('PLEASE',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 185.0, 0.0, 0.0),
                  child: Text('SIGNIN',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(270.0, 185.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple)),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailcontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter email here";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple))),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _passwordcontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter email here";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple))),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.purpleAccent,
                          color: Colors.purple,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                var _auth = FirebaseAuth.instance;
                                //CurrentUser current=new CurrentUser();
                                final authResult =
                                    await _auth.signInWithEmailAndPassword(
                                        email: _emailcontroller.text,
                                        password: _passwordcontroller.text);
                                // print(authResult.user);
                                // return authResult;

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.purpleAccent,
                          color: Colors.purple,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              //if (_formKey.currentState.validate()) {
                              Navigator.of(context).pushNamed('/signup');
                              // }
                            },
                            child: Center(
                              child: Text(
                                'New to the app? Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
          SizedBox(height: 17.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Are you an admin ?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Adminlogin()));
                },
                child: Text(
                  'sign in as admin',
                  style: TextStyle(
                      color: Colors.purple,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      )
    ]));
  }
}
