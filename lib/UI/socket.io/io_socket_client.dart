import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIO extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _SocketIoState();
  }

}

class _SocketIoState extends State<SocketIO>{
  IO.Socket ?socket;
  @override
  void initState() {

    super.initState();
    initializeSocket();

  }

  /*void connect(){
    socket=IO.io("http://localhost:3000",<String,dynamic>{
      "transports":["websockets"],
     "autoConnect":false,
    });
    socket!.connect();
    print(socket!.connected);
    socket!.onConnect((data)=>print("Connected"));

    socket!.emit('/test',"Helloworld");
  }*/

  @override
  void dispose() {
    socket!.disconnect(); // --> disconnects the Socket.IO client once the screen is disposed
    super.dispose();
  }


  void initializeSocket(){
  socket=IO.io("http://172.31.16.1:3000",<String,dynamic>{
    "transports":["websockets"],
    "autoConnect":false,
  });
  socket!.connect();
  socket!.onConnect((data)=>print("Connected"));
  print(socket!.connected);


  }

  sendMessage(String message){
    socket!.emit("message",
    {
      "id":socket!.id,
      "message":message,
      "username":'vivek',
      "sentAt":DateTime.now().toLocal().toString()
    }
    );
  }
  var message;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SocketIO'),

      ),
      body:SizedBox(
        height: 40,
        child: Column(

          children: [
            TextField(
              onChanged:(value){
                setState(() {
                  message=value;
                });
              } ,
            ),
            InkWell(
              onTap: (sendMessage(message??'')),
              child: const Icon(Icons.send,
              color: Colors.blue,),
            )
          ],
        ),
      )

          
    
    );
  }

}