import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var InchController = TextEditingController();
  var result = "";
  var bgcolor;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("yourBMI"),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your weight '),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height(in feet) '),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: InchController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height(in Inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = InchController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          // BMI calculation

                          var iWT = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var totalinch = (iFt * 12) + iInch;
                          var totalCm = totalinch * 2.54;
                          var totalMeter = totalCm / 100;

                          var bmi = iWT / (totalMeter * totalMeter);
                          var msg = "";

                          if (bmi > 25) {
                            msg = "You are over Weight";
                            bgcolor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You are underWeight";
                            bgcolor = Colors.red.shade200;
                          } else {
                            msg = "You are Healthy!! ";
                            bgcolor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks!!";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(
                    height: 19,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
