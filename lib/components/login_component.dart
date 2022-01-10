import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:smart_baby/screens/base_screen.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({
    Key? key,
  }) : super(key: key);

  @override
  LoginComponentState createState() {
    return LoginComponentState();
  }
}

class LoginComponentState extends State<LoginComponent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Card(
            margin: EdgeInsets.all(35),
            elevation: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextFormField(
                    controller: nameEditingController,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 35.0, fontWeight: FontWeight.bold),
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Thanks for the input!')),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BaseScreen(
                                    name: nameEditingController.text,
                                  )));
                    }
                  },
                  child: const Text(
                    'Enter',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter the name then tap the cards to learn about them!',
                  style: klabelTextStyle,
                )
              ],
            ),
          ),
        ));
  }
}
