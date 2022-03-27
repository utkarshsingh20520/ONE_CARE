import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//predictedDisease.dart: Defines a Stateful widget gives a probabilistic match of diseases
// which matches best with given input symptoms list. Fetches symptom data for each disease from cloud firestore
// and matches it from the list got from symptomsInput.dart for a probabilistic match.

class PredictDisease extends StatefulWidget {
  final List<String> symptoms;
  PredictDisease({@required this.symptoms});
  @override
  _PredictDiseaseState createState() => _PredictDiseaseState();
}

class _PredictDiseaseState extends State<PredictDisease> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Map<String , int> priorityMap = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text("Predict Disease")
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _db.collection("diseases").snapshots(),
            builder: (context , snapshot) {
              if(snapshot.hasData){
                final diseases = snapshot.data.docs;
                List<Widget> predictedDiseases = [];
                for(var disease in diseases){
                  final diseaseData = disease.data();
                  priorityMap[disease.id] = 0;
                  for (var symptom in widget.symptoms){
                    if (diseaseData['symptoms'].contains(symptom)){
                      priorityMap[disease.id]++;
                    }
                  }
                }
                for (var out in priorityMap.keys){
                  if (priorityMap[out] > 0){
                    predictedDiseases.add(
                        Container(
                          width: double.infinity,
                          child: ListTile(
                            title: Text(
                                "$out",textAlign:TextAlign.justify ,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                ),
                            ),
                            subtitle: priorityMap[out] > 2.5 ? Text(
                              "High Probability",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.red,
                              ),
                            ) :  Text(
                              "Low Probability",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.red,
                              ),
                            )
                          ),
                        )
                    );
                  }
                }
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: predictedDiseases,
                  ),
                );
              }
              else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                  ),
                );
              }
            },
          )
      ),
    );
  }
}
