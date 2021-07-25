import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";

  void calculateBMI() {
    setState(() {

      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height*12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0)
      &&((_heightController.text.isNotEmpty || inches > 0)
          && (_weightController.text.isNotEmpty || weight > 0))){
       result = weight/(inches * inches ) * 703; // the BMI

        // reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
              print(_resultReading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 18.5
        && result < 25){
          _resultReading = "Great shape!";
          print(_resultReading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 25.0
            && result < 30){
          _resultReading = "Overweight";
        }else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }


      }else {
        result = 0.0;
      }

    });

     _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            Image.asset('images/bmilogo.png',
            height: 85.0,
            width: 75.0,),

            Container(
              margin: const EdgeInsets.all(20.0),
              height: 290.0,
              width: 320.0,
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                          hintText: 'e,g 34',
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Height',
                        hintText: 'e,g 6.5',
                        icon: new Icon(Icons.insert_comment)
                    ),
                  ),

                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Weight',
                        hintText: 'e,g 180',
                        icon: new Icon(Icons.line_weight)
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(20.6)),

                  // calculate button
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: calculateBMI,
                      color: Colors.pinkAccent,
                      child: Text('calculate'),
                      textColor: Colors.white
                    ),
                  ),

                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$_finalResult",
                style: TextStyle(
                   color: Colors.blueAccent,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9
                ),),

                Padding(padding: const EdgeInsets.all(5.0)),

                Text("$_resultReading",
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9
                  ),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
