import 'package:contact_appnew/screens/contact_list.dart';

import 'package:contact_appnew/screens/new_contact.dart';
import 'package:contact_appnew/screens/view_contact.dart';
import 'package:flutter/cupertino.dart';
import './models/contact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Contact> userContacts = [];

  void _addNewContact(
      String firstName1, String lastName1, String phone1, String email1) {
    final newContact = Contact(
      firstName: firstName1,
      lastName: lastName1,
      phone: phone1,
      email: email1,
    );

    setState(() {
      userContacts.add(newContact);
    });
  }

  void deleteContact(String phone) {
    setState(() {
      userContacts.removeWhere((tx) => tx.phone == phone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            'CONTACTS',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.grey[400],
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewContactScreen(_addNewContact),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ContactList(userContacts, deleteContact),
            ],
          ),
        ),
      ),
      routes: {
        ViewContact.routeName: (ctx) =>
            ViewContact(userContacts, deleteContact),
      },
    );
  }
}
