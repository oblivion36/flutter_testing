import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final _formKey = GlobalKey<FormState>();
  String? name = '';
  String? surname = '';
  String? rollNo = '';
  String? division = '';
  String? standard = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Enter Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*required ';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Surname'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*required';
                  }
                  return null;
                },
                onSaved: (value) {
                  surname = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Roll No.',
                ),
                keyboardType:
                    TextInputType.number, // Set keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Allow only digits
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*required';
                  }

                  return null;
                },
                onSaved: (value) {
                  rollNo = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Division'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*required';
                  }
                  return null;
                },
                onSaved: (value) {
                  division = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Standard'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*required';
                  }
                  return null;
                },
                onSaved: (value) {
                  standard = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Submit your form data here

                    // Show a Snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Form submitted successfully'),
                        duration: Duration(
                            seconds: 2), // Adjust the duration as needed
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
