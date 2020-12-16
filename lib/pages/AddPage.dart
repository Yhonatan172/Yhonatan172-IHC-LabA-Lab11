import 'package:flutter/material.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/Application.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(localizations.t('crearReport.title')),
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Text(localizations.t('crearReport.iconText')),
                iconSize: 100.0,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Application(),
                  ));
                })
          ]),
      body: Container(
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 400,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        UserReport(),
                      ],
                    ),
                  ),
                  TitleReport(),
                  ContentReport(),
                  AgregarImagen(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class AgregarImagen extends StatelessWidget {
  const AgregarImagen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return RaisedButton(
      color: Colors.white,
      child: Row(
        children: [
          Icon(Icons.photo),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              localizations.t('crearReport.button'),
              style: TextStyle(
                //fontSize: 10,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.white),
      ),
    );
  }
}

class ContentReport extends StatelessWidget {
  const ContentReport({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      child: TextFormField(
        maxLines: 8,
        maxLength: 1000,
        decoration:
            InputDecoration(labelText: localizations.t('crearReport.content')),
      ),
    );
  }
}

class TitleReport extends StatelessWidget {
  const TitleReport({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      child: TextFormField(
        maxLines: 2,
        maxLength: 30,
        decoration: InputDecoration(
            labelText: localizations.t('crearReport.titleReport')),
      ),
    );
  }
}

class UserReport extends StatelessWidget {
  const UserReport({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(360.0),
              child: Image.asset(
                'assets/images/sophia.jpg',
                width: 40,
                height: 40,
              ),
            ),
          ),
          Text(
            'sophia',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
