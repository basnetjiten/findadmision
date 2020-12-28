import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationFilter extends StatefulWidget {
  @override
  _LocationFilterState createState() => _LocationFilterState();
}

class _LocationFilterState extends State<LocationFilter> {
  bool _canCheckBiometric = false;

  @override
  void initState() {
    //SitePreferences.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tileStyle = TextStyle(fontSize: 20.0, fontFamily: 'MyRaidPro');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Theme(
            data: Theme.of(context).copyWith(canvasColor: Color(0xffeef7fb)),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Drawer(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: <Widget>[
                      /* DrawerHeader(
                        decoration: BoxDecoration(color: Color(0xffeef7fb)),
                        child: Text("Filter", style: tileStyle),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Filter", style: tileStyle),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      ListTile(
                          title: Align(
                              alignment: Alignment(-1.1, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Location"),
                                  Icon(Icons.navigate_next)
                                ],
                              )),
                          onTap: () {}),
                      Divider(
                        thickness: 1.5,
                      ),
                      ListTile(
                        title: Align(
                            alignment: Alignment(-1.2, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tution Fee"),
                                Icon(Icons.navigate_next)
                              ],
                            )),
                        onTap: () async {},
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      ListTile(
                        title: Align(
                            alignment: Alignment(-1.2, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Use Fingerprint"),
                                Icon(Icons.navigate_next)
                              ],
                            )),
                        onTap: () async {},
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 10,
            bottom: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 27.0,
                      color: Colors.white,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
