import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewContactScreen extends StatelessWidget {
  final Function addContact;
  NewContactScreen(this.addContact);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  void submitData() {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final phone = phoneController.text;
    final email = emailController.text;

    addContact(
      firstName,
      lastName,
      phone,
      email,
      // firstNameController.text,
      // lastNameController.text,
      // phoneController.text,
      // emailController.text
    );
    // onPressed: () {
    //   Navigator.pop(context);
    // },
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.08, 0.5],
                  colors: [Colors.red, Colors.white]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        submitData();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Done",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffE6E6E6),
                      radius: 65,
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                        ),
                        //onPressed: getImage,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              //height: 40,
                              padding: EdgeInsets.all(10),
                              child: Text('First Name'),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // height: 40,
                              child: TextField(
                                controller: firstNameController,
                                cursorColor: Colors.grey,
                                onSubmitted: (_) => submitData(),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                ),
                                // onChanged: (text) {
                                //   print(text);
                                // },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              // height: 40,
                              padding: EdgeInsets.all(10),
                              child: Text('Last Name'),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              //height: 40,
                              child: TextField(
                                controller: lastNameController,
                                cursorColor: Colors.grey,
                                onSubmitted: (_) => submitData(),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                ),
                                onChanged: (text) {
                                  print(text);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              //height: 40,
                              padding: EdgeInsets.all(10),
                              child: Text('mobile'),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // height: 40,
                              child: TextField(
                                controller: phoneController,
                                cursorColor: Colors.grey,
                                onSubmitted: (_) => submitData(),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                ),
                                onChanged: (text) {
                                  print(text);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              //height: 40,
                              padding: EdgeInsets.all(10),
                              child: Text('email'),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              //height: 40,
                              child: TextField(
                                controller: emailController,
                                cursorColor: Colors.grey,
                                onSubmitted: (_) => submitData(),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                ),
                                onChanged: (text) {
                                  print(text);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
