import 'package:flutter/material.dart';
import 'ListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Итоговая работа',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Итоговая работа'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String phone = '';
  String password = '';


  @override
  Widget build(BuildContext context) {

    const BorderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: Color(0xFFECEFF1), width: 2)
    );


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                const Text("Итоговая работа",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 10,),
                const Text("Водопьянов Алексей Сергеевич",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)
                ),
                SizedBox(height: 20,),
                const Text("Телефон и пароль: 123456789 zxcvbnm",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo,
                        fontSize: 10,
                        fontWeight: FontWeight.normal)
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Телефон',
                    labelText: 'Телефон',
                  ),
                  onChanged: (text) {
                    phone = text;
                  },
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Пароль',
                    labelText: 'Пароль',
                  ),
                  onChanged: (text) {
                    password = text;
                  },
                  autofocus: false,
                  obscureText: true,
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: () {
                    if(phone == '123456789' && password == 'zxcvbnm'){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ListPage()), (Route<dynamic> route) => false);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Логин или пароль не верны"),
                      ));
                    }

                  },
                  color: Colors.indigo,
                  textColor: Colors.white,
                  child: const Text('Войти'),
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
