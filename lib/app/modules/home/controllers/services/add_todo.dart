//add todo screen
import 'package:FLUTTERPROJECT/app/provider/database2_appwrite.dart';
import 'package:FLUTTERPROJECT/app/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late TodoProvider todoProvider;
  void initState() {
    todoProvider = Provider.of<TodoProvider>(context, listen: false);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212325),
        title:  Text(
          "Tambahkan Catatan",
          style: GoogleFonts.kanit(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const Key('titleField'),
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter title";
                  }
                  return null;
                },
                onSaved: (newValue) => _title = newValue ?? "Title",
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('descriptionField'),
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
                onSaved: (newValue) => _description = newValue ?? "description",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                key: const Key('tambahkan'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    //save the form
                    _formKey.currentState!.save();
                    //navigate to home screen
                    try {
                      bool result = await DatabaseHelper.instance
                          .createTodo(title: _title, description: _description);
                      if (result) {
                        getData();
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Tambahkan Catatan successfully")));
                      }
                    } catch (e) {
                      //snackbar
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  }

                  Navigator.pop(context);
                },
                child: Text("Tambahkan",style: GoogleFonts.kanit(color: Colors.black),),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getData() async {
    await todoProvider.getTodo();
  }
}
