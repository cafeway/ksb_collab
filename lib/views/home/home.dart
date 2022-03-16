import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _authenticated = false;

  var label;

  void _increment() {
    setState(() {
      _counter++;
      print('$_counter');
    });
  }

  //text editing controllers
  TextEditingController Client = TextEditingController();
  TextEditingController TotalKMS = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController Department = TextEditingController();
  TextEditingController Sitelocation = TextEditingController();
  TextEditingController Recomendation = TextEditingController();
  TextEditingController ActionRequired = TextEditingController();
  TextEditingController VehicleReg = TextEditingController();
  TextEditingController OtherSitesVisited = TextEditingController();
  TextEditingController MileageAtSite = TextEditingController();
  TextEditingController Engname = TextEditingController();
  TextEditingController Engcontact = TextEditingController();
  TextEditingController Clientname = TextEditingController();
  TextEditingController Clientcontact = TextEditingController();
  TextEditingController Engsignature = TextEditingController();
  TextEditingController Clientsignature = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, String> data = {};
    data = ModalRoute.of(context).settings.arguments as Map;
    if (data != null) {
      if (data['signee'] == 'engineer') {
        Engsignature.text = data['data'];
      }
      if (data['signee'] == 'client') {
        Clientsignature.text = data['data'];
      }
    }

    FirebaseAuth auth = FirebaseAuth.instance;

    String username = '';
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null){

    //   } else {
    //     Navigator.pushNamed(context, '/login');
    //   }
    // });
    Color themecolor = Color(0xFF01579B);
    Padding(padding: EdgeInsets.all(20.0));
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF01579B),
                ),
                child: Text("Hello"),
              ),

              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              //   leading: const Icon(
              //     Icons.verified_user_rounded,
              //     color: Colors.purple,
              //   ),
              //   title: Text(
              //     "Doctors Profile",
              //     style: TextStyle(fontSize: 16),
              //   ),
              // ),
              Divider(
                thickness: 1.5,
                endIndent: 4.0,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.settings,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                thickness: 1.5,
                endIndent: 4.0,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.chat,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Chat",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                thickness: 1.5,
                endIndent: 4.0,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.notifications,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                thickness: 1.5,
                endIndent: 4.0,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.phone,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Support",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                thickness: 1.5,
                endIndent: 4.0,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.share,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Share",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                thickness: 1.5,
                endIndent: 4.0,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('home');
                },
                leading: const Icon(
                  Icons.logout,
                  color: Color(0xFF0D47A1),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                thickness: 1.5,
                endIndent: 4.0,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                  leading: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Color(0xFF0D47A1),
                    child: Icon(Icons.book),
                  ),
                  title: Text(
                    "Terms and conditions",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        // actions
        actions: const <Widget>[
          Icon(Icons.search),
          SizedBox(width: 10.0),
        ],

        // Title
        centerTitle: true,
        title: Title(
          color: Colors.black,
          child: const Text("Eng Thomas"),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 5.0),
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Client,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Client', hintText: 'Mr. Thomas'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Date,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Date', hintText: 'e.g 01/04/2021'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Department,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Department', hintText: 'Finance'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Sitelocation,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'SiteLocation', hintText: 'Nairobi,Kenya'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Recomendation,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Recomendation', hintText: 'We recommend  adding more steel bars '),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: ActionRequired,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'ActionRequired', hintText: 'ActionRequired'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Transport',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: VehicleReg,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Vehicle Registration', hintText: 'kcb f5y7'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: OtherSitesVisited,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'others', hintText: 'others'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: MileageAtSite,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'mileage', hintText: '40 miles'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: TotalKMS,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'total kms', hintText: '40'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Particulars',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Engname,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Eng name', hintText: 'eng brian'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Engcontact,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'eng contact', hintText: '0743******'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Clientname,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'clients name', hintText: 'brian'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: Clientcontact,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'clients contact', hintText: '0743*******'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Signatures',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    Navigator.of(context).pushNamed('sign', arguments: 'engineer');
                  },
                  controller: Engsignature,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Eng Signature', hintText: 'Sign'),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    Navigator.of(context).pushNamed('sign', arguments: 'client');
                  },
                  controller: Clientsignature,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'clients signature', hintText: 'Sign'),
                ),
              ),
              SizedBox(height: 10),
              MaterialButton(
                color: Color(0xFF01579B),
                onPressed: () {
//                    Client.clear
//  TotalKMS.clear
// Date.clear
//    Department.clear = TextEditingController();
//   TextEditingController Sitelocation.clear = TextEditingController();
//   TextEditingController Recomendation.clear = TextEditingController();
//   TextEditingController ActionRequired.clear = TextEditingController();
//   TextEditingController VehicleReg.clear = TextEditingController();
//   TextEditingController OtherSitesVisited.clear = TextEditingController();
//   TextEditingController MileageAtSite.clear = TextEditingController();
//   TextEditingController Engname.clear = TextEditingController();
//   TextEditingController Engcontact.clear= TextEditingController();
//   TextEditingController Clientname.clear = TextEditingController();
//   TextEditingController Clientcontact.clear = TextEditingController();
//   TextEditingController Engsignature.clear = TextEditingController();
//   TextEditingController Clientsignature.clear = TextEditingController();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('The Form Data Was successfully uploaded tp the cloud'),
                    backgroundColor: Colors.blue,
                  ));
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ]),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
