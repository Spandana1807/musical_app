import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musical_app/details.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


void main() {
  runApp(MusicApp());
}

class MusicApp extends StatefulWidget {
  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
StreamSubscription sub;
bool isConnected = false;

  void initState() {
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((result) {
     setState(() {
       isConnected = (result != ConnectivityResult.none);
     } );
    });
  }
  @override
  void dispose(){
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.music_note, color: Colors.black),
            title: Text(
              'Playlists',
              style: TextStyle(color: Colors.black),
            )),

        body: _buildListView(context),
        child: isConnected? Text('connected', style: TextStyle(fontSize: 30),): Icon(Icons.wifi_off),

      ),
    );
  }
}

ListView _buildListView(BuildContext context) {

  return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
          title: Text(' Track_ID #$index'),
          subtitle: Text('The Subtitle'),
          leading: Icon(Icons.music_note_sharp),
          trailing : IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed:(){
                Navigator.push(
               context,
               MaterialPageRoute(
               builder: (context) => DetailsPage(index),
           ),
          );
         }),
          ),
        );
      });
}
