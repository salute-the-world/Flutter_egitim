import 'package:flutter/material.dart';
import 'package:flutter_application_todo/constansts/color.dart';
import 'package:flutter_application_todo/constansts/tasktype.dart';
import 'package:flutter_application_todo/model/task.dart';
import 'package:flutter_application_todo/screens/add_new_task.dart';
import 'package:flutter_application_todo/service/todo_service.dart';
import 'package:flutter_application_todo/todoitem.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*List<String> todo = ["Ders çalış", "5km koş", "Davete git"];
  List<String> completed = [
    "Çöpü çıkar",
    "Köpeği gezdir",
    "Nevresimi değiştir"
  ];*/
  List<Task> todo = [
    Task(
      type: TaskType.note,
      title: "Ders çalış",
      description: "Fizik sınavı",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "5km koş",
      description: "İdman",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calender,
      title: "Davete git",
      description: "Arkadaşının doğumgünü",
      isCompleted: false,
    )
  ];
  List<Task> completed = [
    Task(
      type: TaskType.contest,
      title: "5km koş",
      description: "İdman",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calender,
      title: "Davete git",
      description: "Arkadaşının doğumgünü",
      isCompleted: false,
    )
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidht = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Container(
                width: deviceWidht,
                height: deviceHeight / 3.3,
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/header.png"),
                        fit: BoxFit.cover)),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 20.2023",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getUncompletedTodos(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return TodoItem(
                                task: snapshot.data![index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: todoService.getCompletedTodos(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return TodoItem(
                                task: snapshot.data![index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(
                        addNewTask: (newTask) => addNewTask(newTask),
                      ),
                    ),
                  );
                },
                child: const Text("Add New Button"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
