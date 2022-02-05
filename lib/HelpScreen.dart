import 'package:flutter/material.dart';
import 'main.dart';
import 'MyDrawer.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  String text = """
    В проекте Flutter реализовать страницу авторизации, содержащую поля для ввода номера телефона и пароля. После нажатия на кнопку "Войти" сверять учётные данные с заранее заданными в исходном коде значениями. При успешной авторизации перейти на главный экран. В случае ввода неверных данных вывести сообщение пользователю.
    На главном экране приложения отобразить список пользователей, загруженный из сети по запросу https://jsonplaceholder.typicode.com/users. Для хранения данных пользователей создать класс User с полями, идентичными структуре ответа https://jsonplaceholder.typicode.com/users/1. В списке отобразить только основные данные пользователя - id, имя и email
    При нажатии на пункт списка открыть экран с детальной информацией о пользователе, а также отобразить список его задач, полученный по запросу https://jsonplaceholder.typicode.com/todos?userId=1. Элементы списка задач должны содержать флажки (checkbox), отмеченные в соответствии со значением поля completed данной задачи.
    Все экраны приложения (кроме экрана авторизации) должны иметь панели AppBar и NavigationDrawer, содержащие кнопки для перехода между экранами
  """;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Справка по заданию'),
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
                Text('Справка по заданию',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.indigo,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)
                ),
                Text(text,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)
                ),
              ],
            ),
          )
      ),
    );
  }
}
