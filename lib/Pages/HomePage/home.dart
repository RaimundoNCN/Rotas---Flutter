import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();
  List<String> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // erro da linha 20 a 35
  _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = prefs.getStringList('tasks');
    if (tasks != null) {
      setState(() {
        _tasks = tasks;
      });
    }
  }

  _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', _tasks);
  }
  // erro!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 38)),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Second Screen'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Nova tarefa',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira uma tarefa';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _tasks.add(_taskController.text);
                      _taskController.clear();
                    });
                    _saveTasks();
                  }
                },
                child: const Text('Adicionar'),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      color: const Color.fromARGB(255, 223, 208, 240),
                      child: ListTile(
                        title: Text(_tasks[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _tasks.removeAt(index);
                            });
                            _saveTasks();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              //ElevatedButton(
              //  onPressed: () {
              //    Navigator.pushNamed(context, '/second');
              //  },
              //  child: const Text('Second Screen'),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
