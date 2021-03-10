import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicine_reminder/src/models/medicalinfo.dart';
import 'package:medicine_reminder/src/screens/user/addMedicalRecord.dart';
import 'package:medicine_reminder/src/screens/user/editmedicalRecord.dart';
import 'package:medicine_reminder/src/services/store.dart';
import 'package:medicine_reminder/src/services/auth.dart';

class ViewMedicalRecords extends StatefulWidget {
  @override
  _ViewMedicalRecords createState() => _ViewMedicalRecords();
}

class _ViewMedicalRecords extends State<ViewMedicalRecords> {
  void initState() {
    super.initState();
  }

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
                        //     builder: (context) => UserProf(),
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
                        //  builder: (context) => Addpillrem(),
                        ));
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services_outlined),
              title: Text('Medical Record'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewMedicalRecords(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                // Update the state of the app.
                // ...
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
              builder: (context) => ViewMedicalRecords(),
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
              "MedicalRecord",
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
                "Viewing Medical Records",
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
class BottomContainer extends StatelessWidget {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadmedicalrec(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MedicalInfo> medicalinfo = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;
                  medicalinfo.add(MedicalInfo(
                      medinfoId: doc.documentID,
                      bloodsugar: data['bloodsugar'],
                      bloodpressure: data['bloodpressure'],
                      weight: data['weight'],
                      height: data['height'],
                      heartrate: data['heartrate'],
                      respiratoryrate: data['respiratoryrate']));
                }
                return ListView.builder(
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: Icon(Icons.account_circle_sharp),
                          title: Text('check your medical records'),
                          subtitle: Column(
                            children: <Widget>[
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    rows: const <DataRow>[
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text('Blood Sugar')),
                                          DataCell(Text('Blood Pressure')),
                                          DataCell(Text('Weight')),
                                          DataCell(Text('Height')),
                                          DataCell(Text('Heart Rate')),
                                          DataCell(Text('Respiratory Rate')),
                                        ],
                                      ),
                                    ],
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                              medicalinfo[index].bloodsugar)),
                                      DataColumn(
                                          label: Text(medicalinfo[index]
                                              .bloodpressure)),
                                      DataColumn(
                                          label:
                                              Text(medicalinfo[index].weight)),
                                      DataColumn(
                                          label:
                                              Text(medicalinfo[index].height)),
                                      DataColumn(
                                          label: Text(
                                              medicalinfo[index].heartrate)),
                                      DataColumn(
                                          label: Text(medicalinfo[index]
                                              .respiratoryrate)),
                                    ],
                                  )),

                              // Text(medicalinfo[index].bloodsugar),
                              // Text(medicalinfo[index].bloodpressure),
                              // Text(medicalinfo[index].weight),
                              // Text(medicalinfo[index].height),
                              // Text(medicalinfo[index].heartrate),
                              // Text(medicalinfo[index].respiratoryrate),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          trailing: Wrap(children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.purple,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        settings: RouteSettings(
                                            arguments: medicalinfo[index]),
                                        builder: ((context) =>
                                            Editmedicalrecord())));
                                // Navigator.pushNamed(
                                //     context, '/Editmedicalrecord',
                                //     arguments: medicalinfo[index]);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_sharp),
                              color: Colors.red,
                              onPressed: () {
                                _store.deletemedicalrec(
                                    medicalinfo[index].medinfoId);
                                // this is the line that is causing the issue, this one goes back to the previous screen
                                // Navigator.pop(context);
                              },
                            ),
                          ]),
                        )),
                    itemCount: medicalinfo.length);
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
