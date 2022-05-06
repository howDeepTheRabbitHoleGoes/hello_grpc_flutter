//import 'dart:js_util';

import 'package:hello_grpc_flutter/protos/hello.pbgrpc.dart' ;
import 'package:hello_grpc_flutter/protos/hello.pb.dart' as pbdart;
import 'package:grpc/grpc.dart';

class HelloService {

  static HelloClient? client;

  HelloService(){
    // The host argument in ClientChannel is obtained thanks to ngrok (an OS utilities command)
    // $ ngrok tcp 127.0.0.1:50051 
    //You should register at https://dashboard.ngrok.com/signup to make the "tcp" works
    // On Ubuntu, you should be running: $ ngrok authtoken Your_AuthToken 
    //You can find "Your_AuthToken" on your dashboard at: https://dashboard.ngrok.com/get-started/your-authtoken
    // the address you should connect your flutter code is the one on "Forwarding" property as Follows
    //Forwarding                    tcp://8.tcp.ngrok.io:13667 -> 127.0.0.1:50051 
    // As you can notice, you should only take: "8.tcp.ngrok.io" as your host
    // the port property is "13667" in our example code 
    // the server is running using Golang on localhost:50051. The code for that is available on 
    // this repository
    client = HelloClient(
      ClientChannel(
        "8.tcp.ngrok.io",
        port: 13667,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          //codecRegistry:
          //CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
        ),
      ),
    );
  }

  Future <pbdart.Response> sendMessage(String yourName) async{
    print ("Sending...");
     return client!.say(
      pbdart.Request()
        ..name = yourName,
    );
  }
}


