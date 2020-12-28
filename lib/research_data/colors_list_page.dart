import 'package:findadmissionaffiliate/views/bottom_navigation/home.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/institutes.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/students.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: const Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => HomePage()),
              );
              // push another route
            },
          ),
        ),
      ),
    );
  }
}

class Institute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: const Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => InstitutePage()),
              );
              // push another route
            },
          ),
        ),
      ),
    );
  }
}

class Student extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: const Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => StudentPage()),
              );
              // push another route
            },
          ),
        ),
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: const Text('Go!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => HomePage()),
              );
              // push another route
            },
          ),
        ),
      ),
    );
  }
}
