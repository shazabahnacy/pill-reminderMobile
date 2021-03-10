import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/models/currentUser.dart';
import 'package:medicine_reminder/src/models/medsuggestion.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/screens/admin/AddMedSuggest.dart';
import 'package:medicine_reminder/src/screens/user/addMedicalRecord.dart';
import 'package:medicine_reminder/src/screens/user/userprofile.dart';
import 'package:provider/provider.dart';
import 'package:medicine_reminder/src/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_reminder/main.dart';
import 'package:medicine_reminder/src/screens/admin/editmedsuggest.dart';

class SO extends StatefulWidget {
  @override
  _SOState createState() => _SOState();
}

class _SOState extends State<SO> {
  void initState() {
    super.initState();
  }

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
          leading: IconButton(
              icon: Icon(Icons.exit_to_app_outlined),
              color: Colors.black,
              onPressed: () {
                CurrentUser _currentuser = CurrentUser();
                _currentuser.SignOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MyHomePage())));
                // drawer: Drawer(
                //   // Add a ListView to the drawer. This ensures the user can scroll
                //   // through the options in the drawer if there isn't enough vertical
                //   // space to fit everything.
                //   child: ListView(
                //     // Important: Remove any padding from the ListView.
                //     padding: EdgeInsets.zero,
                //     children: <Widget>[
                //       DrawerHeader(
                //         child: Text('APP MENU'),
                //         decoration: BoxDecoration(
                //           color: Colors.purple,
                //         ),
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.supervised_user_circle_rounded),
                //         title: Text('view user Profile'),
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   //     builder: (context) => UserProf(),
                //                   ));
                //         },
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.access_alarm_rounded),
                //         title: Text('add medicine reminder'),
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   //  builder: (context) => Addpillrem(),
                //                   ));
                //         },
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.medical_services_outlined),
                //         title: Text('Medical Record'),
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => ViewMedicalRecords(),
                //               ));
                //         },
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.logout),
                //         title: Text('LogOut'),
                //         onTap: () {
                //           // Update the state of the app.
                //           // ...
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              })),
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
              builder: (context) => AddMedSuggest(),
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
                "Viewing Medicine suggestions",
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         elevation: 0.0,
//       ),
//       drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('APP MENU'),
//               decoration: BoxDecoration(
//                 color: Colors.purple,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.supervised_user_circle_rounded),
//               title: Text('view user Profile'),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UserProf(),
//                     ));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.access_alarm_rounded),
//               title: Text('add medicine reminder'),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         // builder: (context) => Addpillrem(),
//                         ));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.medical_services_outlined),
//               title: Text('add medical record'),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Addmedrecord(),
//                     ));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('LogOut'),
//               onTap: () {
//                 // Update the state of the app.
//                 // ...
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         color: Color(0xFFF6F8FC),
//         child: Column(
//           children: <Widget>[
//             Flexible(
//               flex: 3,
//               child: TopContainer(),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Flexible(
//               flex: 7,
//               child: BottomContainer(),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         elevation: 4,
//         backgroundColor: Colors.purple,
//         child: Icon(
//           Icons.add,
//         ),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 //  builder: (context) => Addpillrem(),
//                 ),
//           );
//         },
//       ),
//     );
//   }
// }

// class TopContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.elliptical(50, 27),
//           bottomRight: Radius.elliptical(50, 27),
//         ),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 5,
//             color: Colors.grey[400],
//             offset: Offset(0, 3.5),
//           )
//         ],
//         color: Colors.purple,
//       ),
//       width: double.infinity,
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               bottom: 10,
//             ),
//             child: Text(
//               "pilliminder",
//               style: TextStyle(
//                 fontFamily: "Angel",
//                 fontSize: 64,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Divider(
//             color: Colors.purple,
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 0.0),
//             child: Center(
//               child: Text(
//                 "Number of pill reminders",
//                 style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

@override
class BottomContainer extends StatelessWidget {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadMedSuggetion(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MedSuggetion> medsuggestion = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;
                  medsuggestion.add(MedSuggetion(
                      mid: doc.documentID,
                      medName: data['medName'],
                      medDiscribtion: data['medDiscribtion'],
                      medDosage: data['medDosage'],
                      medRestriction: data['medRestriction'],
                      medSideEffects: data['Side medSideEffects']));
                }
                return ListView.builder(
                    itemBuilder: (context, index) => Padding(
                        // padding: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          leading: Icon(Icons.alarm_on_outlined),
                          title: Text(medsuggestion[index].medName),
                          subtitle: Column(
                            children: <Widget>[
                              Text(medsuggestion[index].medDiscribtion),
                              Text(medsuggestion[index].medRestriction),
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
                                            arguments: medsuggestion[index]),
                                        builder: ((context) =>
                                            EditmedSuggest())));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_sharp),
                              color: Colors.red,
                              onPressed: () {
                                _store.deleteProduct(medsuggestion[index].mid);
                                Navigator.pop(context);
                              },
                            ),
                          ]),
                        )),
                    itemCount: medsuggestion.length);
              } else {
                return Center(
                    child: Text(
                  "Press + to add a medicine reminder",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontSize: 24,
                      fontSize: 12,
                      color: Color(0xFFC9C9C9),
                      fontWeight: FontWeight.bold),
                ));
              }
            }));
  }
}

// @override
// class Container extends StatelessWidget {
//   final _store = Store();

//   Widget build(BuildContext context) {
//     return new Scaffold(
//         body: StreamBuilder<QuerySnapshot>(
//             stream: _store.loadMedSuggetion(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 List<MedSuggetion> medSuggetion = [];
//                 for (var doc in snapshot.data.documents) {
//                   var data = doc.data;
//                   medSuggetion.add(MedSuggetion(
//                       mid: doc.documentID,
//                       medName: data['medName'],
//                       medDiscribtion: data['medDiscribtion'],
//                       medDosage: data['medDosage'],
//                       medRestriction: data['medRestriction'],
//                       medSideEffects: data['medSideEffects']));
//                 }
//                 return ListView.builder(
//                     itemBuilder: (context, index) => Padding(
//                         // padding: EdgeInsets.symmetric(vertical: 8.0),
//                         padding: EdgeInsets.symmetric(vertical: 4.0),
//                         child: ListTile(
//                           leading: Icon(Icons.alarm_on_outlined),
//                           title: Text(medSuggetion[index].medName),
//                           subtitle: Column(
//                             children: <Widget>[
//                               Text(medSuggetion[index].medDiscribtion),
//                               Text(medSuggetion[index].medDosage),
//                               Text(medSuggetion[index].medRestriction),
//                               Text(medSuggetion[index].medSideEffects),
//                             ],
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                           ),
//                           trailing: Wrap(children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.edit),
//                               color: Colors.purple,
//                               onPressed: () {
//                                 Navigator.pushNamed(
//                                     context, '/EditMedSuggetion',
//                                     arguments: medSuggetion[index]);
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.delete_sharp),
//                               color: Colors.red,
//                               onPressed: () {
//                                 _store.deleteMedSuggetion(
//                                     medSuggetion[index].mid);
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ]),
//                         )),
//                     itemCount: medSuggetion.length);
//               } else {
//                 return Center(
//                     child: Text(
//                   "Press + to add a medicine Suggestion",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       // fontSize: 24,
//                       fontSize: 12,
//                       color: Color(0xFFC9C9C9),
//                       fontWeight: FontWeight.bold),
//                 ));
//               }
//             }));
//   }
// }
// // Widget build(BuildContext context) {
// //   return new Scaffold(
// //       body: StreamBuilder<QuerySnapshot>(
// //     stream: _store.loadReminder(),
// //     builder: (context, snapshot) {
// //       if (snapshot.hasData) {
// //         for (var doc in snapshot.data.documents) {
// //           var data = doc.data;
// //           return Container();
// //         }
// //       } else if (snapshot.data.documents == 0) {
// //         return Container(
// //           color: Color(0xFFF6F8FC),
// //           child: Center(
// //             child: Text(
// //               "Press + to add a Mediminder",
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                   fontSize: 24,
// //                   color: Color(0xFFC9C9C9),
// //                   fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //         );
// //       } else {
// //         return Container(
// //           color: Color(0xFFF6F8FC),
// //           child: GridView.builder(
// //             padding: EdgeInsets.only(top: 12),

// //             gridDelegate:
// //                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// //             itemCount: snapshot.data.length,

// //             itemBuilder: (context, index) {
// //               List<Medicines> medicines = [];
// //               return MedicineCard(medicines[index]);
// //             },
// //           ),
// //         );
// //       }
// //     },
// //   ));
// // }
