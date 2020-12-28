import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/research_data/bottom_navigation.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/home.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/institutes.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/morepage.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/student_index.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tabbed extends StatefulWidget {
  @override
  _TabbedState createState() => _TabbedState();
}

class _TabbedState extends State<Tabbed> {
  int _currentTab = 0;

  final List<CustomTab> tabs = <CustomTab>[
    CustomTab(
      child: HomePage(),
    ),
    CustomTab(
      child: InstitutePage(),
    ),
    CustomTab(
      child: StudentIndexPage(),
    ),
    CustomTab(
      child: Transaction(),
    ),
    CustomTab(
      child: MorePage(),
    ),
  ];

  Future<Null> _setTab(int index) async {
    if (_currentTab == index) {
      if (Navigator.of(tabs[index].tabContext).canPop()) {
        Navigator.of(tabs[index].tabContext)
            .popUntil((Route<dynamic> r) => r.isFirst);
      }
      return;
    }
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          _buildStack(),
          _buildTabs(),
        ],
      ),
    );
  }

  Widget _buildStack() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: IndexedStack(
          sizing: StackFit.expand,
          index: _currentTab,
          children: tabs,
        ),
      ),
    );
  }

  SvgPicture buildSvgPicture(String asset) {
    return SvgPicture.asset(
      asset,
      height: 24,
      width: 24,
    );
  }

  buildMoreIcon(String asset) {
    return SvgPicture.asset(
      asset,
      height: 5,
      width: 5,
    );
  }

  Widget _buildTabs() {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: AppTheme.darkGreyBGColour,
          border: Border(
            top: BorderSide(color: Color.fromRGBO(58, 66, 86, 0.3)),
          ),
        ),
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {
                _setTab(0);
              },
              child: Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    color: setColor(_currentTab),
                    icon: _currentTab == 0
                        ? buildSvgPicture(
                      'assets/dashboard_filled.svg',
                    )
                        : buildSvgPicture(
                      'assets/dashboard_outln.svg',
                    ),
                    onPressed: () {
                      _setTab(0);
                    },
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: _currentTab == 0
                            ? Colors.white
                            : AppTheme.navInactiveColor,
                        fontSize: 12.0),
                  )
                ],
              ),
            ),

            InkWell(
              onTap: (){
                _setTab(1);
              },
              child: Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    color: setColor(_currentTab),
                    icon: _currentTab == 1
                        ? buildSvgPicture(
                      'assets/colluges_filled.svg',
                    )
                        : buildSvgPicture(
                      'assets/colluges_outln.svg',
                    ),
                    onPressed: () {
                      _setTab(1);
                    },
                  ),
                  Text(
                    "Institutes",
                    style: TextStyle(
                        color: _currentTab == 1
                            ? Colors.white
                            : AppTheme.navInactiveColor,
                        fontSize: 12.0),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                _setTab(2);
              },
              child: Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    color: setColor(_currentTab),
                    icon: _currentTab == 2
                        ? buildSvgPicture(
                      'assets/profile_filled.svg',
                    )
                        : buildSvgPicture(
                      'assets/profile_outln.svg',
                    ),
                    onPressed: () {
                      _setTab(2);
                    },
                  ),
                  Text(
                    "Students",
                    style: TextStyle(
                        color: _currentTab == 2
                            ? Colors.white
                            : AppTheme.navInactiveColor,
                        fontSize: 12.0),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                _setTab(3);
              },
              child: Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    color: setColor(_currentTab),
                    icon: _currentTab == 3
                        ? buildSvgPicture(
                      'assets/transaction_filled.svg',
                    )
                        : buildSvgPicture(
                      'assets/transaction_outln.svg',
                    ),
                    onPressed: () {
                      _setTab(3);
                    },
                  ),
                  Text(
                    "Transactions",
                    style: TextStyle(
                        color: _currentTab == 3
                            ? Colors.white
                            : AppTheme.navInactiveColor,
                        fontSize: 12.0),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                _setTab(4);
              },

              child: Column(
                children: [
                  IconButton(
                    iconSize: 30.0,
                    color: setColor(_currentTab),
                    icon: _currentTab == 4
                        ? buildMoreIcon(
                      'assets/more_filled.svg',
                    )
                        : buildMoreIcon(
                      'assets/more_outln.svg',
                    ),
                    onPressed: () {
                      _setTab(4);
                    },
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                        color: _currentTab == 4
                            ? Colors.white
                            : AppTheme.navInactiveColor,
                        fontSize: 12.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  setColor(int currentTab) {
    if (currentTab == 0) {
      return Colors.white;
    } else if (currentTab == 1) {
      return Colors.white;
    } else if (currentTab == 2) {
      return Colors.white;
    } else if (currentTab == 3) {
      return Colors.white;
    } else if (currentTab == 4) {
      return Colors.white;
    } else {
      return AppTheme.navInactiveColor;
    }
  }
}
