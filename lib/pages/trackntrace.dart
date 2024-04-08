import 'package:flutter/material.dart';

class TracknTrace extends StatefulWidget {
  const TracknTrace({super.key});

  @override
  State<TracknTrace> createState() => _TracknTraceState();
}

class _TracknTraceState extends State<TracknTrace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(),
      backgroundColor: Colors.white,
        body: Center(
        child: Text("Track 'n' trace", style: TextStyle(color: Colors.black),),
      ),
    );
  }
}