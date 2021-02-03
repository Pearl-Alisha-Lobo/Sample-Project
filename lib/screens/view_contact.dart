import 'package:flutter/material.dart';
import '../models/contact.dart';

class ViewContact extends StatelessWidget {
  static const routeName = '/view-contacts';
  final List<Contact> viewContact;
  final Function deleteTx;
  ViewContact(this.viewContact, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final firstName = routeArgs['firstName'];
    final lastName = routeArgs['lastName'];
    final phone = routeArgs['phone'];
    final email = routeArgs['email'];
    final index = routeArgs['index'];

    return Scaffold(
      backgroundColor: Colors.red[200],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.08, 0.5],
                  colors: [Colors.red, Colors.white])),
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
                      "Contacts",
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Edit",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70.0,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE6E6E6),
                    radius: 56,
                    child: Icon(
                      Icons.person,
                      size: 56.0,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  firstName.toString() + lastName.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Options(
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                      Options(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                      ),
                      Options(
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      Options(
                        icon: Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Message',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        ' Call    ',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'favourite',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputText(
                    labelText: Text(
                      'mobile no',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    textField: Text(
                      phone.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InputText(
                    labelText: Text(
                      'email id',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    textField: Text(
                      email.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      // deleteContact();
                      //  onPressed: () =>
                      deleteTx(viewContact[index].phone);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({this.icon});
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.red,
      child: icon,
    );
  }
}

class InputText extends StatelessWidget {
  InputText({this.labelText, this.textField});
  final Text labelText;
  final Text textField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                child: labelText,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                child: textField,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
