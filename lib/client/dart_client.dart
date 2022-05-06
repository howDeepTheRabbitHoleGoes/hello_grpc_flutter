//import 'package:grpc/grpc.dart'
//import 'package:hello_grpc_flutter/protos/hello.pbgrpc.dart' ;
//import 'package:hello_grpc_flutter/protos/hello.pb.dart';

import 'package:grpc/grpc.dart';
import 'package:hello_grpc_flutter/protos/hello.pbgrpc.dart';

Future<void> main (List<String> args) async {
  final channel = ClientChannel(
    '8.tcp.ngrok.io',
    port: 13667, 
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      //codecRegistry:
        //  CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  final stub = HelloClient(channel);

  final name = args.isNotEmpty ? args[0] : 'world';
  
  try {
    final response = await stub.say(
      Request()..name = name,
      //options: CallOptions(compression: const GzipCodec())
    );
    print('Greeter client received: ${response.message}' );   
  }
  catch(e) {
    print('Caught error: $e');

  }
  await channel.shutdown();
}

