import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/AddPage.dart';
import 'package:proyecto_final_ihc/pages/Application.dart';
import 'package:proyecto_final_ihc/pages/Bell.dart';
import 'package:proyecto_final_ihc/pages/User.dart';
import 'package:proyecto_final_ihc/widgets/category_selector.dart';
import 'package:proyecto_final_ihc/widgets/favorite_contacts.dart';
import 'package:proyecto_final_ihc/widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            builder: (context) => HomeScreen(
                //titleController.text,
                //dateController.text,
                ),
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
            builder: (context) => Bell(
                //titleController.text,
                //dateController.text,
                ),
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
            builder: (context) => User(
                //titleController.text,
                //dateController.text,
                ),
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
      backgroundColor: Colors.black, //Theme.of(context).primaryColor,
      appBar: AppBar(
        /*leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),*/
        backgroundColor: Colors.black, //algo de prymary que esta en el main
        title: Text(
          localizations.t('add.chat'),
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //elevation: 0,
        //highlightElevation: 0,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPage(),
          ));
        },
        //backgroundColor: Colors.blue,
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
