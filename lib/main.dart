import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Name: " + mydata[index]['name'],style: TextStyle(fontSize: 30.0),),
                        Text("Age:" + mydata[index]['age'],style: TextStyle(fontSize: 20.0),),
                        Text("Height: " + mydata[index]['height'],style: TextStyle(fontSize: 20.0),),
                        Text("Gender: " + mydata[index]['gender'],style: TextStyle(fontSize: 20.0),),
                        Text("Hair: " + mydata[index]['hair_color'],style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
