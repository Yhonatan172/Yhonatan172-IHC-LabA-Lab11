import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/AddPage.dart';
import 'package:proyecto_final_ihc/pages/search.dart';

import 'Application.dart';
import '../screens/home_screen.dart';
import 'User.dart';

class Bell extends StatefulWidget {
  @override
  _BellState createState() => _BellState();
}

class _BellState extends State<Bell> {
  Widget home() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Application(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(
              FontAwesomeIcons.home,
            ),
          ),
        ),
      ),
    );
  }

  Widget friends() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(FontAwesomeIcons.userFriends),
          ),
        ),
      ),
    );
  }

  Widget bell() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Bell(),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(FontAwesomeIcons.bell),
          ),
        ),
      ),
    );
  }

  Widget user() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => User(),
          ));
        },
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Icon(FontAwesomeIcons.user),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.t('notificacion.title'),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchPublication(),
                ));
              }),
        ],
      ),
      body: ListaNotificaciones(),
      floatingActionButton: FloatingActionButton(
        //elevation: 0,
        //highlightElevation: 0,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPage()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        //color: Colors.yellow,
        child: Container(
          height: 60,
          child: Row(
            children: [
              home(),
              friends(),
              Expanded(
                child: Container(),
              ),
              bell(),
              user(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ListaNotificaciones extends StatelessWidget {
  const ListaNotificaciones({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //color: Colors.cyan,
      height: 800,
      width: 400,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              localizations.t('notificacion.subtitle'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Notificacion(
            userImagen: 'assets/images/greg.jpg',
            username: 'greg',
            usertext: localizations.t('notificacion.msj'),
          ),
          Notificacion(
            userImagen: 'assets/images/james.jpg',
            username: 'james',
            usertext: localizations.t('notificacion.msj'),
          ),
          Notificacion(
            userImagen: 'assets/images/sam.jpg',
            username: 'sam',
            usertext: localizations.t('notificacion.msj'),
          ),
          Notificacion(
            userImagen: 'assets/images/sophia.jpg',
            username: 'sophia',
            usertext: localizations.t('notificacion.msj'),
          ),
          Notificacion(
            userImagen: 'assets/images/olivia.jpg',
            username: 'olivia',
            usertext: localizations.t('notificacion.msj'),
          ),
          Notificacion(
            userImagen: 'assets/images/steven.jpg',
            username: 'steven',
            usertext: localizations.t('notificacion.msj'),
          ),
        ],
      ),
    );
  }
}

class Notificacion extends StatelessWidget {
  final String userImagen;
  final String username;
  final String usertext;
  const Notificacion({
    Key key,
    @required this.userImagen,
    @required this.username,
    @required this.usertext,
  }) : super(key: key);
  Widget renderDivisor() {
    return Container(
      //padding: const EdgeInsets.only(top: 1),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            //color: Colors.blue,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Application(),
                    ));
                  },
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        UserImage(
                          userImagen: this.userImagen,
                        ),
                        UserNotificacion(
                          username: this.username,
                          usertext: this.usertext,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          renderDivisor(),
        ],
      ),
    );
  }
}

class UserImage extends StatelessWidget {
  final String userImagen;
  const UserImage({
    @required this.userImagen,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(360.0),
        child: Image.asset(
          this.userImagen,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}

class UserNotificacion extends StatelessWidget {
  final String username;
  final String usertext;
  const UserNotificacion({
    Key key,
    @required this.username,
    @required this.usertext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      child: Column(
        children: [
          Container(
            width: 150,
            //color: Colors.green,
            child: Text(
              this.username,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(child: Text(this.usertext)),
          Container(
              width: 150,
              child: Text(
                localizations.t('notificacion.time'),
                style: TextStyle(fontSize: 12),
              )),
        ],
      ),
    );
  }
}
