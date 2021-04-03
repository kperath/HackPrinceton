import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    CollectionReference projects =
        FirebaseFirestore.instance.collection("projects");

    final titleController = TextEditingController();
    final aboutController = TextEditingController();
    final requiresController = TextEditingController();

    void addProject() {
      // Call the user's CollectionReference to add a new user
      projects
          .add({
            'title': titleController.text,
            'about': aboutController.text,
            'members': ["@chris", "@jon"],
            'requires': requiresController.text.split(",")
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      titleController.clear();
      aboutController.clear();
      requiresController.clear();
    }

    return SafeArea(
      child: Scaffold(
          body: new SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(),
          child: new Container(
            child: new Center(
              child: Container(
                height: 700,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text(
                        'Project Details',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xff263284),
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        controller: titleController,
                        decoration: new InputDecoration(
                          labelText: "Project Name *",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "This field can not be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        controller: requiresController,
                        decoration: new InputDecoration(
                          labelText: "Tech Stack*",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "This field can not be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Github",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "This field can not be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.url,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new TextFormField(
                        controller: aboutController,
                        decoration: new InputDecoration(
                          labelText: "Description*",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "This field can not be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      // DropDownButtonStack(),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "We are looking for*",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "This field can not be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        child: RaisedButton(
                            elevation: 5,
                            color: Color(0xff263284),
                            child: Text(
                              'Add',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            onPressed: () {
                              addProject();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
