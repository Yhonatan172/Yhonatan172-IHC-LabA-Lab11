import 'package:flutter/material.dart';

class SearchPublication extends StatefulWidget {
  @override
  _SearchPublicationState createState() => _SearchPublicationState();
}

class _SearchPublicationState extends State<SearchPublication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busqueda'),
      ),
    );
  }
}
