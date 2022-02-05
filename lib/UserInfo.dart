import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'main.dart';
import 'UserTodos.dart';
import 'MyDrawer.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {


  Future<List<UserTodos>> getTodoList() async {
    final id = widget.user.id;
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=' + id.toString() ));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((i) => UserTodos.fromJson(i)).toList();;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {

    Company? company = widget.user.company;

    return Scaffold(
      appBar: AppBar(
        title: Text('Список'),
        actions: [
          IconButton(
              onPressed: () => {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(title: 'Итоговая работа')), (Route<dynamic> route) => false)},
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(widget.user.name ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.indigo,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)
                ),
                Text(company!.name ?? "" ,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)
                ),
                Text('username: ' + (widget.user.username ?? ''),
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)
                ),
                Text(widget.user.email ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)
                ),
                Text(widget.user.phone ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)
                ),
                Text(widget.user.website ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black45,
                        fontSize: 14)
                ),
                Divider(),
                const Text("Задачи:",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.indigo,
                        fontSize: 20)
                ),
                FutureBuilder<List<UserTodos>>(
                  future: getTodoList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Checkbox(onChanged: (bool? value) {  }, value: snapshot.data![index].completed,
                                
                              ),
                              title: Text(snapshot.data![index].title ?? ''),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                )

              ],
            ),
          )
      ),
    );
  }
}
