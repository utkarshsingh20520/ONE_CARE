import 'package:flutter/material.dart';
import '../routes/diseaseInput.dart';
import '../routes/symptomsInput.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../routes/testInput.dart';

// homePage.dart: Defines the UI of the home page of the app. Contains a Static AppBar, TabBar and a TabViewController.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(FontAwesomeIcons.userMd),
                  alignment: Alignment.center,
                  onPressed: () {},
                  color: Colors.white,
                  iconSize: 34,
                  padding: EdgeInsets.only(left: 34),
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: FaIcon(FontAwesomeIcons.userMd),
                // ),
                // Align(alignment: Alignment.centerLeft,),
                title: Text('One-Care',style:TextStyle(fontWeight: FontWeight.bold),),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Symptoms',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      // text: 'Symptoms',
                      icon: FaIcon(FontAwesomeIcons.prescription),
                    ),
                    Tab(
                      child: Text(
                        'Tests',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.syringe,
                        size: 25,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Test Results',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      // text: 'Test Results',
                      icon: FaIcon(FontAwesomeIcons.clinicMedical),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                  children: [SymptomsInput(), DiseaseInput(), TestInput()]),
            )));
  }
}
