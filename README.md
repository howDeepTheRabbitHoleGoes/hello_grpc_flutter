# hello_grpc_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Description
The host argument in ClientChannel is obtained thanks to ngrok (an OS utilities command) \n
 $ ngrok tcp 127.0.0.1:50051 

You should register at https://dashboard.ngrok.com/signup to make the "tcp" works \n
 On Ubuntu, you should be running: $ ngrok authtoken Your_AuthToken 

You can find "Your_AuthToken" on your dashboard at: https://dashboard.ngrok.com/get-started/your-authtoken 

the address you should connect your flutter code to is the one on "Forwarding" property as Follows 
Forwarding                    tcp://8.tcp.ngrok.io:13667 -> 127.0.0.1:50051 
As you can notice, you should only take: "8.tcp.ngrok.io" as your host 
the port property is "13667" in our example code \n
the server is running using Golang on localhost:50051. The code for that is available on 
this repository at: https://github.com/howDeepTheRabbitHoleGoes/hello_grpc/tree/master/hello_server