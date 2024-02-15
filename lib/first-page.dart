// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
  late String? firstName;
  final TextEditingController textEditingController = TextEditingController();
  List<String> listItems = [];

  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Replace this Text Widget
              // and build the label and switch here
              // as children of the row.
              const Text('Enable Buttons'),
              Switch(
                  value: enabled,
                  onChanged: (bool onChangedValue) {
                    print('onChangedValue is $onChangedValue');
                    enabled = onChangedValue;
                    setState(() {
                      if (enabled) {
                        // Here we DO reset the count
                        // unlike the previous demo.
                        timesClicked = 0;
                        msg1 = 'Click Me';
                      }
                      if (enabled) {
                        msg2 = 'Reset';
                      }
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here
              // as children of the row.
              // For each button use a
              // "Visibility Widget" and its child
              // will be an "ElevatedButton"
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked++;
                      msg1 = 'Clicked $timesClicked';
                    });
                  },
                  child: Text(msg1),
                ),
              ),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timesClicked = 0;
                      msg1 = 'Clicked';
                    });
                  },
                  child: Text(msg2),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  TextFormField(
                    controller: textEditingController,
                    onChanged: (value) {
                      print(value);
                    },
                    onFieldSubmitted: (text) {
                      print('Submitted Name Text = $text');
                      // if (formKey.currentState!.validate()) {
                      //   print('valid name');
                      // }
                    },
                    validator: (input) {
                      return input!.length < 1 ? 'min 1 chars please' : null;
                    },
                    onSaved: (input) {
                      print('onSaved name: $input');
                      firstName = input;
                    },
                    maxLength: 20,
                    decoration: const InputDecoration(
                      //The border property is what makes a outlined
                      //textformfield instead of a filled one.
                      //border: OutlineInputBorder(),
                      icon: Icon(Icons.timelapse),
                      labelText: 'name',
                      helperText: 'min 1, max 20',
                      suffixIcon: Icon(
                        Icons.check_circle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              // listItems.add('firstName = $firstName');
                              textEditingController.clear();
                              MySnackBar(text: 'Hi $firstName').show();
                              setState(() {});
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
