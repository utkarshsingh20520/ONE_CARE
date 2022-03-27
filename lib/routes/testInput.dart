import 'package:flutter/material.dart';
import '../routes/brainTumour.dart';
import '../routes/covidInput.dart';
import '../routes/diabetesInput.dart';
import '../routes/pneumoniaInput.dart';

// testInput.dart: Defines a stateless widget that gives the list of buttons for checking disease risk
// by uploading test results. As of now, we have only created for 4 diseases.

class TestInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "If You have test reports of following problems kindly Submit Here",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(
              //   height: 15,
              // ),
              // RaisedButton(
              //   color: Colors.blue[800],
              //   splashColor: Colors.indigo,
              //   hoverElevation: 67,
              //   // hoverColor: Colors.green,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(05),
              //     side: BorderSide(color: Colors.black87),
              //   ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  onPrimary: Colors.white70,
                  // splashColor: Colors.indigo,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Covid",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CovidInput(),
                    ),
                  );
                },
              ),
              // RaisedButton(
              //   color: Colors.blue[800],
              //   splashColor: Colors.indigo,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(05),
              //   ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  onPrimary: Colors.white70,
                  // splashColor: Colors.indigo,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Diabetes",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiabetesInput(),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          // RaisedButton(
          //   splashColor: Colors.indigo,
          //   color: Colors.blue[800],
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(05),
          //   ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  onPrimary: Colors.white70,
                  // splashColor: Colors.indigo,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Pneumonia",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PneumoniaInput(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  onPrimary: Colors.white70,
                  elevation: 10,
                  // splashColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Brain Tumour",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TumourInput()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
