import 'package:contact_appnew/screens/view_contact.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

//this is contactapp new barnch
class ContactList extends StatelessWidget {
  final List<Contact> contact;
  final Function deleteTx;
  ContactList(this.contact, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
      height: 1000,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      foregroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(ctx).pushNamed(
                          ViewContact.routeName,
                          arguments: {
                            'firstName': contact[index].firstName,
                            'lastName': contact[index].lastName,
                            'phone': contact[index].phone,
                            'email': contact[index].email,
                            'index': contact[index],
                          },
                        );
                      },
                      splashColor: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        //color: Colors.white,
                        margin: EdgeInsets.all(10),
                        //padding: EdgeInsets.all(10),
                        child: Text(
                          contact[index].firstName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () => deleteTx(contact[index].phone),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
        itemCount: contact.length,
      ),
    );
  }
}
