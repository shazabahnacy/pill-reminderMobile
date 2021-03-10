import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/provider/editpage.dart';
import 'package:medicine_reminder/src/screens/settings_page.dart';
import 'package:medicine_reminder/src/screens/user/viewmedicalrec.dart';
//import 'package:medicine_reminder/src/ui/index/index.dart';
import 'package:medicine_reminder/src/widgets/popupmenu.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/medicine_details/medicine_details.dart';
import 'package:medicine_reminder/src/screens/new_entry/addpillreminder.dart';
import 'package:medicine_reminder/src/screens/user/addMedicalRecord.dart';
import 'package:medicine_reminder/src/screens/user/userprofile.dart';
import 'package:provider/provider.dart';
import 'package:medicine_reminder/src/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/src/models/medicine_type.dart';
import 'package:medicine_reminder/src/screens/new_entry/editReminder.dart';
import 'package:medicine_reminder/main.dart';
import 'package:medicine_reminder/src/models/user.dart';
import 'package:medicine_reminder/src/models/currentUser.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController medinamecontroller = TextEditingController();

  TextEditingController medtypeController = TextEditingController();
  TextEditingController intervalController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('APP MENU'),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle_rounded),
              title: Text('view user Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProf(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.access_alarm_rounded),
              title: Text('add medicine reminder'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Addpillrem(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('view medical records'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewMedicalRecords(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services_outlined),
              title: Text('add medical record'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Addmedrecord(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                CurrentUser _currentUser = CurrentUser();
                _currentUser.SignOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF6F8FC),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: TopContainer(),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 7,
              child: BottomContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addpillrem(),
            ),
          );
        },
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 27),
          bottomRight: Radius.elliptical(50, 27),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Colors.purple,
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              "pilliminder",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 64,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            color: Colors.purple,
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Center(
              child: Text(
                "Number of pill reminders",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@override
class BottomContainer extends StatefulWidget {
  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
// class BottomContainer extends StatelessWidget {
  Store _store = new Store();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadReminder(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Medicines> medicines = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;
                  print(_store.getUserid);

                  if (data['uid'] == _store.userid)
                    medicines.add(Medicines(
                        rId: doc.documentID,
                        medicineName: data['MedicineName'],
                        dosage: data['dosage'],
                        medicineType: data['medicineType'],
                        interval: data['interval'],
                        startTime: data['StartTime']));
                }
                return ListView.builder(
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: Icon(Icons.alarm_on_outlined),
                          title: Text(medicines[index].medicineName),
                          subtitle: Column(
                            children: <Widget>[
                              Text(medicines[index].medicineType),
                              Text(medicines[index].startTime),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          trailing: Wrap(children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.purple,
                              onPressed: () {
                                Navigator.pushNamed(context, '/Editreminder',
                                    arguments: medicines[index]);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_sharp),
                              color: Colors.red,
                              onPressed: () {
                                _store.deleteProduct(medicines[index].rId);
                                Navigator.pop(context);
                              },
                            ),
                          ]),
                        )),
                    itemCount: medicines.length);
              } else {
                return Center(
                    child: Text(
                  "Press + to add a medicine reminder",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFC9C9C9),
                      fontWeight: FontWeight.bold),
                ));
              }
            }));
  }
}
// Widget build(BuildContext context) {
//   return new Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//     stream: _store.loadReminder(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         for (var doc in snapshot.data.documents) {
//           var data = doc.data;
//           return Container();
//         }
//       } else if (snapshot.data.documents == 0) {
//         return Container(
//           color: Color(0xFFF6F8FC),
//           child: Center(
//             child: Text(
//               "Press + to add a Mediminder",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 24,
//                   color: Color(0xFFC9C9C9),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//       } else {
//         return Container(
//           color: Color(0xFFF6F8FC),
//           child: GridView.builder(
//             padding: EdgeInsets.only(top: 12),

//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             itemCount: snapshot.data.length,

//             itemBuilder: (context, index) {
//               List<Medicines> medicines = [];
//               return MedicineCard(medicines[index]);
//             },
//           ),
//         );
//       }
//     },
//   ));
// }
