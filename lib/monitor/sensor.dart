import 'package:flutter/material.dart';
import 'package:aware/monitor/result1.dart';
import 'package:aware/monitor/history.dart';
import 'package:aware/monitor/analysis.dart';
import 'package:validators/validators.dart' as validator;
import 'analysis.dart';
import 'model.dart';
import 'constantsResultWindow.dart';
import 'package:google_fonts/google_fonts.dart';
class Sensor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Monitoring System',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected:(String choice){
                  if(choice == Constants.History){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => History()));
                  }
                  else if(choice == Constants.Analysis){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Analysis()));
                  }
                },
              itemBuilder: (BuildContext context){
                return Constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),);
                })
                    .toList();
              }
              ,)
          ],
        ),
        body: TestForm(),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  // Model model = Model();

  Metric metric = Metric();
  MetricStore store = MetricStore();
  var txtController1 = TextEditingController();
  var txtController2 = TextEditingController();
  var txtController3 = TextEditingController();
  void txtClear(){
    txtController1.clear();
    txtController2.clear();
    txtController3.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(25,0,25,0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Temperature(°C)',
                border: OutlineInputBorder(),
              ),
              validator: (String value){
                if(value.isEmpty){
                  return 'Enter value for temperature';
                }
                return null;
              },
              onSaved: (String value){
                 setState(() {
                   metric.temperature = double.parse(value);
                 });
              },
              keyboardType: TextInputType.number,
              controller: txtController1,
            ),
          ),
          SizedBox(height:15,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25,0,25,0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'SpO2(%)',
                border: OutlineInputBorder(),
              ),
              validator: (String value){
                if(value.isEmpty){
                  return 'Enter value for SpO2';
                }
                return null;
              },
              onSaved: (String value){
                setState(() {
                  metric.spo2 = double.parse(value);
                });

              },
              keyboardType: TextInputType.number,
              controller: txtController2,
            ),
          ),
          SizedBox(height:15,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25,0,25,0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile No.',
                border: OutlineInputBorder(),
              ),
              validator: (String value){
                if(value.isEmpty){
                  return 'Enter valid mobile no';
                }
                return null;
              },
              onSaved: (String value){
                setState(() {
                  metric.mobile = value;
                });

              },
              keyboardType: TextInputType.number,
              controller: txtController3,
            ),
          ),

          RaisedButton(
            color: Colors.blueAccent,
            
            padding: const EdgeInsets.all(12),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                txtClear();
                this.store.store(this.metric, DateTime.now().millisecondsSinceEpoch);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Result1(store: this.store)));
              }

            },
            child: Text(
              'Get Result',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height:110,),
        ],
      ),
    );

  }

}





