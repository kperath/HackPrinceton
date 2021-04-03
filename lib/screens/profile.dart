import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => new ProfileState();
}

class ProfileState extends State<Profile> {
  double screenHeight;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          // appBar: AppBar(
          //   elevation: 0,
          //   //brightness: Brightness.light,
          //   backgroundColor: Color(0xff263284),
          //   title: Text(
          //     'Profile',
          //   ),
          //   leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       size: 20,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          backgroundColor: Colors.white,
          body: Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.white,
              child: new SingleChildScrollView(
                child: new ConstrainedBox(
                  constraints: new BoxConstraints(),
                  child: new Container(
                    child: new Center(
                      child: new Column(
                        children: [
                          new CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://e7.pngegg.com/pngimages/643/98/png-clipart-computer-icons-avatar-mover-business-flat-design-corporate-elderly-care-microphone-heroes-thumbnail.png'),
                            radius: 70,
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Full Name *",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Name can not be empty";
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
                              labelText: "Contact Number*",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Contact number cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          DropDownButtonGender(),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          // Column(
                          //     crossAxisAlignment: CrossAxisAlignment.stretch,
                          //     children: [DropDownButtonStack()]),
                          // new Padding(padding: EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Github*",
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
                            decoration: new InputDecoration(
                              labelText: "Devpost",
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
                            decoration: new InputDecoration(
                              labelText: "Portfolio",
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
                            decoration: new InputDecoration(
                              labelText: "Skills*",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Skills cannot be empty";
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
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Short Intro*",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
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
                                  'Save',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }
}

class DropDownButtonGender extends StatefulWidget {
  DropDownButtonGender({Key key}) : super(key: key);

  @override
  _DropDownButtonGenderState createState() => _DropDownButtonGenderState();
}

class _DropDownButtonGenderState extends State<DropDownButtonGender> {
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Male', 'Female', 'Others']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.black54)),
        );
      }).toList(),
    );
  }
}

class DropDownButtonStack extends StatefulWidget {
  DropDownButtonStack({Key key}) : super(key: key);

  @override
  _DropDownButtonStackState createState() => _DropDownButtonStackState();
}

class _DropDownButtonStackState extends State<DropDownButtonStack> {
  String dropdownValue = 'Web Developer';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Web Dev',
        'Mobile Dev',
        'Graphics',
        'UI/UX',
        'Product',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.black54)),
        );
      }).toList(),
    );
  }
}
