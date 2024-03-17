import 'package:flutter/material.dart';

class CreateToDoForm extends StatefulWidget {
  final Future<void> Function(String, String) create;

  const CreateToDoForm({super.key, required this.create});

  @override
  CreateToDoFormState createState() => CreateToDoFormState();
}

class CreateToDoFormState extends State<CreateToDoForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _title = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: null,
                  onSaved: (newValue) {
                    setState(() {
                      _description = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.create(_title, _description).then((_) {
                        Navigator.pop(context, true);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(milliseconds: 500),
                          content: Text("Todo created :- $_title"),
                          backgroundColor: Colors.green,
                        ));
                      }).catchError((_) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text("Unable to create ToDo."),
                          backgroundColor: Colors.red,
                        ));
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]))
      ],
    );
  }
}
