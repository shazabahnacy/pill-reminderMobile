import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/models/medicine.dart';
import 'package:medicine_reminder/src/provider/editpage.dart';
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
class BottomContainer extends StatelessWidget {
  final _store = Store();
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

class MedicineCard extends StatelessWidget {
  final Medicines medicine;

  MedicineCard(this.medicine);

  Hero makeIcon(double size) {
    if (medicine.medicineType == "Bottle") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image(image: AssetImage('assets/images/bottle 1.png')),
      );
    } else if (medicine.medicineType == "Pill") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image(image: AssetImage('assets/images/pill photo.png')),
      );
    } else if (medicine.medicineType == "Syringe") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image(image: AssetImage('assets/images/syringe.jpg')),
      );
    } else if (medicine.medicineType == "Tablet") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image(image: AssetImage('assets/images/tablets.png')),
      );
    }
    return Hero(
      tag: medicine.medicineName + medicine.medicineType,
      child: Icon(
        Icons.error,
        color: Color(0xFF3EB16F),
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        highlightColor: Colors.white,
        splashColor: Colors.grey,
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                      );
                    });
              },
              transitionDuration: Duration(milliseconds: 500),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                makeIcon(50.0),
                Hero(
                  tag: medicine.medicineName,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      medicine.medicineName,
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF3EB16F),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  medicine.interval == 1
                      ? "Every " + medicine.interval.toString() + " hour"
                      : "Every " + medicine.interval.toString() + " hours",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC9C9C9),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// return GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     childAspectRatio: .8,
//   ),
//   itemBuilder: (context, index) => Padding(
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     child: GestureDetector(
//       onTapUp: (details) async {
//         double dx = details.globalPosition.dx;
//         double dy = details.globalPosition.dy;
//         double dx2 = MediaQuery.of(context).size.width - dx;
//         double dy2 = MediaQuery.of(context).size.width - dy;
//         await showMenu(
//             context: context,
//             position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
//             items: [
//               MyPopupMenuItem(
//                 onClick: () {
//                   // Navigator.pushNamed(context, '/Editreminder',
//                   // arguments: medicines[index]);
//                   //                      Provider.of<CartItem>(context, listen: false)
//                   // .editreminder(medicines);

//                   Navigator.pushNamed(context, '/Editreminder',
//                       arguments: medicines[index]);
//                 },
//                 child: Text('Edit'),
//               ),
//               MyPopupMenuItem(
//                 onClick: () {
//                   _store.deleteProduct(medicines[index].rId);
//                   Navigator.pop(context);
//                 },
//                 child: Text('Delete'),
//               ),
//             ]);
//         // return MedicineCard(medicines[index]);
//       },
//       child: Stack(
//         children: <Widget>[
//           Positioned.fill(
//             child: Image(
//                 fit: BoxFit.scaleDown,
//                 image:
//                     AssetImage('assets/images/bottle 1.png')),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Opacity(
//               opacity: .6,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 60,
//                 color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: 10, vertical: 5),
//                   child: Column(
//                     crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         medicines[index].medicineName,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(medicines[index].medicineType)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   ),
//   itemCount: medicines.length,
// );
