import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './views/home/home.dart';
import './views/Signature/signature.dart';
import 'package:firebase_core/firebase_core.dart';
import './views/Signature/signature.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCWGVo-LkH8z34qbRSfg_sAlAi85Sc-aJU",
    appId: "1:961868720175:android:5d9a6819b369342f437eda",
    messagingSenderId: "961868720175",
    projectId: "ksbapp-ffc6d",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => MyHomePage(),
        'sign': (context) => MyHomePage1(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  FirebaseAuth auth = FirebaseAuth.instance;
  // form key
  final _formKey = GlobalKey<FormState>();

  // text editing controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  //check for user

  // ignore: empty_constructor_bodie
  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Engineers Panel"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset("image/img1.png")),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0)
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Email', hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password', hintText: 'Enter secure password'),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(color: Color(0xFF01579B), borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    color: Color(0xFF01579B),
                    onPressed: () {
                      try {
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text).then((value) {
                          Navigator.of(context).pushNamed('home');
                        });
                      } on FirebaseAuthException catch (e) {
                        AlertDialog(
                          title: Text('vccc'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e.message')));
                        print(e.message);
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
