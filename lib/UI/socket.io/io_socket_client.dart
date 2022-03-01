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
    connect();

  }

  void connect(){
    socket=IO.io("http://10.10.20.228:5000",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false,
    });
    socket!.connect();
    socket!.onConnect((data)=>print("Connected"));
  }

  @override
  void dispose() {
    socket!.disconnect(); // --> disconnects the Socket.IO client once the screen is disposed
    super.dispose();
  }


  // void initializeSocket(){
  // socket=io("http://127.0.0.1:3000",<String,dynamic>{
  //   "trsnsports":["websocket"],
  //   "autoConnect":false,
  // });
  // socket!.connect();
  // socket!.on('connect', (data){
  //   print(socket!.connected);
  // });
  // socket!.on('message', (data){
  //   print(data);
  // });
  // socket!.on('disconnect', (data) {
  //   print('disconnect');
  // });
  //
  // }

  // sendMessage(String message){
  //   socket!.emit("message",
  //   {
  //     "id":socket!.id,
  //     "message":message,
  //     "username":'vivek',
  //     "sentAt":DateTime.now().toLocal().toString()
  //   }
  //   );
  // }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SocketIO'),

      ),
      body: InkWell(

              onTap: (){
         connect();
      },
      child: const Text('SocketIO'
          ),),
    );
  }

}