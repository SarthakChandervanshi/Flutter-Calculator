import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  operation(String text)
  {
    if(text == "C")
      {
        _output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      }
    else if(text == "+" || text == "-" || text == "*" || text == "/")
      {
        num1 = double.parse(output);
        operand = text;
        _output = "0";

      }
    else if(text == "=")
      {
        num2 = double.parse(output);

        if(operand == "+")
          {
            _output = (num1 + num2).toString();
          }
        if(operand == "-")
        {
          _output = (num1 - num2).toString();
        }
        if(operand == "*")
        {
          _output = (num1* num2).toString();
        }
        if(operand == "/")
        {
          _output = (num1 / num2).toString();
        }

        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      }
    else
      {
        _output = _output + text;
      }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }


  Widget Button(String number){
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(2),
          child: RawMaterialButton(
            onPressed: () { operation(number); },
            padding: EdgeInsets.all(10),
            child: Text(number,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 45),),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.white,width: 5)),
            fillColor: Colors.lightBlueAccent,
            splashColor: Colors.white,
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("CALCULATOR",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlueAccent,width: 5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("$output",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 100),),
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Row(
                  children: [
                    Button("9"),
                    Button("8"),
                    Button("7"),
                    Button("/"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Row(
                  children: [
                    Button("4"),
                    Button("5"),
                    Button("6"),
                    Button("*"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Row(
                  children: [
                    Button("3"),
                    Button("2"),
                    Button("1"),
                    Button("-"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Row(
                  children: [
                    Button("0"),
                    Button("C"),
                    Button("="),
                    Button("+"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

