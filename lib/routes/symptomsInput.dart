import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/routes/predictedDisease.dart';

//symptomsInput.dart: Defines a Stateful Widget which takes the input of symptoms of the user and displays them in a form of list containing tiles.

class SymptomsInput extends StatefulWidget {
  @override
  _SymptomsInputState createState() => _SymptomsInputState();
}

class _SymptomsInputState extends State<SymptomsInput> {
  List<String> patientSymptoms = [];
  String symptom;

  List<Widget> convertToTile(List<String> symptomStrings) {
    List<Widget> symptomTile = [];
    for (int i = 0; i < symptomStrings.length; ++i) {
      symptomTile.add(Card(
        elevation: 2.5,
        child: ListTile(
          trailing: IconButton(
            icon: FaIcon(FontAwesomeIcons.times, color: Colors.blue[800]),
            onPressed: () {
              setState(() {
                symptomStrings.remove(symptomStrings[i]);
              });
            },
          ),
          title: Text(
            symptomStrings[i],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.5,
            ),
          ),
        ),
      ));
      symptomTile.add(SizedBox(
        height: 3,
      ));
    }
    symptomTile.add(
      FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PredictDisease(
                symptoms: symptomStrings,
              ),
            ),
          );
        },
        child: Container(
          width: 230,
          height: 45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Predict Disease",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.5,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: Colors.blue[800],
            border: Border.all(width: 1.0, color: Colors.blue[800]),
          ),
        ),
      ),
    );
    return symptomTile;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text(
            "Add Symptoms",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: TextField(
              onChanged: (value) {
                setState(() {
                  symptom = value;
                });
              },
              decoration: InputDecoration(
                hintText: "What problems are you facing",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(17.5),
                  ),
                  borderSide: BorderSide(color: Colors.blue[800], width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[800], width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
              ),
            ),
            trailing: IconButton(
              icon: FaIcon(FontAwesomeIcons.plusCircle,
                  color: Colors.blue[800], size: 35),
              onPressed: () {
                if (symptom != null && symptom.length != 0) {
                  setState(() {
                    patientSymptoms.add(symptom);
                    symptom = null;
                  });
                } else {
                  print("No symptom added");
                }
              },
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          patientSymptoms.length != 0
              ? Column(
                  children: convertToTile(patientSymptoms),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(
                    //   "Health is Wealth",
                    //   style: TextStyle(fontSize: 25,color: Colors.grey),
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "You look fit and fine",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        Text(
                          "Some Quotes on Health",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "“The human body has been designed to resist an infinite number of changes and attacks brought about by its environment. The secret of good health lies in successful adjustment to changing stresses on the body.” – Harry J. Johnson",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "“The cheerful mind perseveres, and the strong mind hews its way through a thousand difficulties.” – Swami Vivekananda",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "“It is health that is the real wealth, and not pieces of gold and silver.” – Mahatma Gandhi",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "“The doctor of the future will give no medicine, but will instruct his patients in care of the human frame, in diet, and in the cause and prevention of disease.” – Thomas Edison",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
