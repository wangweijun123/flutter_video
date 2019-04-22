import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {

  MovieDetail({Key key, @required this.id, @required this.title}) : super(key:key);

  final String id;
  final String title;

  @override
  _MovieDetailState createState() {
    return new _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Text('id= ${widget.id}')
    );
  }
}