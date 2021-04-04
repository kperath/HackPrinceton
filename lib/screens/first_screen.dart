import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackprinceton/bottomNav.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../service/client_sdk_service.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

class FirstScreen extends StatefulWidget {
  static final String id = 'first';
  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  bool showSpinner = false;
  String atSign;
  ClientSdkService clientSdkService = ClientSdkService.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            children: [
              Image.network(
                  'https://image.freepik.com/free-vector/business-team-putting-together-jigsaw-puzzle-isolated-flat-vector-illustration-cartoon-partners-working-connection-teamwork-partnership-cooperation-concept_74855-9814.jpg'),
              ListView(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: 180,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://atsign.dev/assets/img/@dev.png',
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                            title: Text(
                              'Log In',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            subtitle: DropdownButton<String>(
                              hint: Text('\tPick an @sign'),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black87),
                              underline: Container(
                                height: 2,
                                color: Color(0xff263284),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  atSign = newValue;
                                });
                              },
                              value: atSign != null ? atSign : null,
                              items: at_demo_data.allAtsigns
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 50,
                            child: RaisedButton(
                              elevation: 5,
                              color: Color(0xff263284),
                              child: Text(
                                'Login',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              onPressed: _login,
                            ),
                          ),
                        ],
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

  // TODO: Write _login method
  /// Use onboard() to authenticate via PKAM public/private keys.
  _login() async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });
    if (atSign != null) {
      String jsonData = clientSdkService.encryptKeyPairs(atSign);
      clientSdkService.onboard(atsign: atSign).then((value) async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      }).catchError((error) async {
        await clientSdkService.authenticate(atSign,
            jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      });
    }
  }
}
