//import 'dart:js_util';

import 'package:flutter/material.dart';
//import 'package:hello_grpc_flutter/protos/hello.pbgrpc.dart';
import 'package:hello_grpc_flutter/protos/hello.pb.dart' as pbDart; 
import 'package:hello_grpc_flutter/services/hello_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter gRPC Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:   ResponsePage()//ResponsePage(HelloService()),
    );
  }
}



class ResponsePage extends StatefulWidget{
 

  _ResponsePageState createState() { return _ResponsePageState(
    
  );
  }
}

class _ResponsePageState extends State<ResponsePage>{
  final HelloService  service = HelloService();
  //ResponsePage(this.service);
  TextEditingController? controller;

  //Set<Response> responses = newObject();

  void initState() {
    super.initState();
    //responses = Set();
    controller = TextEditingController();
  }

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter gRPC Client Demo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: controller,
              ),  
              ),
              MaterialButton(
                child: Text("Submit"),
                onPressed: () async {
                  print("submitting");
                  //widget.service.sendMessage(controller!.text);
                pbDart.Response resp  = await service.sendMessage(controller!.text);
                 

                print (resp.message);
                  
                  
                },
                ),
          ],
        ),
      ),
    );
  }
}