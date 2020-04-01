import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_mobx/widgets/custom_icon_button.dart';
import 'package:todo_mobx/widgets/custom_input.dart';
import 'package:todo_mobx/stores/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        darkTheme: ThemeData.dark().copyWith(
          accentColor: Colors.teal,
          accentColorBrightness: Brightness.dark,
          dividerColor: Colors.white,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.teal),
        ),
        theme: ThemeData.light(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TodoListStore list = TodoListStore();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lista de Tarefas',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w100),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Observer(builder: (_) {
          return ListView.separated(
            separatorBuilder: (_, __) => Divider(),
            itemCount: list.todos.length,
            itemBuilder: (BuildContext _, int index) {
              return Observer(builder: (_) {
                final todo = list.todos[index];
                return ListTile(
                  title: Text(
                    todo.task.toUpperCase(),
                    style: TextStyle(
                        decoration:
                            todo.done ? TextDecoration.lineThrough : null,
                        color: todo.done ? Colors.teal : Colors.white,
                        fontSize: 20, fontWeight: FontWeight.w200),
                  ),
                  onTap: todo.toggleDone,
                  onLongPress: () => list.removeTodo(index),
                );
              });
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                elevation: 0,
                enableDrag: true,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (_) {
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3 +
                        MediaQuery.of(context).viewInsets.bottom,
                    child: Material(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Adicionar Tarefa',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w100),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15,
                                left: 15,
                                right: 15,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Observer(builder: (_) {
                              return CustomInput(
                                controller: controller,
                                enabled: true,
                                onChanged: list.addTitle,
                                hint: 'Tarefa',
                                suffix: list.isValid
                                    ? CustomIconButton(
                                        radius: 15,
                                        iconData: Icons.arrow_forward_ios,
                                        onTap: () {
                                          list.addTodo();
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                                  (_) => controller.clear());
                                          Navigator.pop(context);
                                        })
                                    : null,
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                  );
                });
          },
          elevation: 0,
          child: Icon(
            Icons.add,
            size: 35,
          ),
        ));
  }
}
