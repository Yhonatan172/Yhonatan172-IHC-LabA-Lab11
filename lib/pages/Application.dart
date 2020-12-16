import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/Options.dart';
import 'package:proyecto_final_ihc/pages/search.dart';
import 'AddPage.dart';
import 'Bell.dart';
import '../screens/home_screen.dart';
import 'User.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Widget home() {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Application(),
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
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 80.0,
        ),
        // backgroundColor: Colors.black,
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
          IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ));
              }),
        ],
        automaticallyImplyLeading: false,
        // leading: Container(),
      ),
      body: Container(
        //color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Cabecera(),
            Container(
              height: 10,
            ),
            ContenedorPublicaciones(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //elevation: 0,
        //highlightElevation: 0,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPage(),
          ));
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
        ),
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

class Cabecera extends StatelessWidget {
  const Cabecera({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          //color: Colors.white,
          border: Border.all(
            color: Colors.black, //<--- border color
            width: 1,
          ),
        ),
        height: 25,
        width: 200,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
                child: RaisedButton(
                  color: Colors.deepPurple[300],
                  child: Text(
                    localizations.t("boton.amigos"),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Application(),
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.elliptical(20, 20)),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    localizations.t("boton.amigos"),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.deepPurple[300],
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Application(),
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.elliptical(20, 20)),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContenedorPublicaciones extends StatelessWidget {
  const ContenedorPublicaciones({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white10,
      padding: const EdgeInsets.only(bottom: 10),
      height: 500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Publicacion(
            imag: "assets/images/imagen4.jpeg",
            imgUser: "assets/images/sophia.jpg",
            nameUser: 'sophia',
          ),
          Publicacion(
            imag: "assets/images/imagen2.jpg",
            imgUser: "assets/images/greg.jpg",
            nameUser: 'greg',
          ),
          Publicacion(
            imag: "assets/images/imagen3.jpeg",
            imgUser: "assets/images/james.jpg",
            nameUser: 'james',
          ),
          Publicacion(
            imag: "assets/images/imagen5.jpeg",
            imgUser: "assets/images/john.jpg",
            nameUser: 'john',
          ),
          Publicacion(
            imag: "assets/images/imagen6.jpeg",
            imgUser: "assets/images/steven.jpg",
            nameUser: 'steven',
          ),
          Publicacion(
            imag: "assets/images/imagen7.jpeg",
            imgUser: "assets/images/olivia.jpg",
            nameUser: 'olivia',
          ),
          Publicacion(
            imag: "assets/images/imagen8.jpeg",
            imgUser: "assets/images/user.jpg",
            nameUser: 'Yhona',
          ),
        ],
      ),
    );
  }
}

class Publicacion extends StatelessWidget {
  final String imag;
  final String imgUser;
  final String nameUser;
  const Publicacion({
    Key key,
    @required this.imag,
    @required this.imgUser,
    @required this.nameUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      //color: Colors.white,
      width: 310,
      height: 450,
      child: Column(
        children: <Widget>[
          ImagenReporte(imag: imag),
          UsuarioUbicacion(imgUser: imgUser, nameUser: nameUser),
          Reporte(),
        ],
      ),
    );
  }
}

class Reporte extends StatelessWidget {
  const Reporte({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleReport(),
        BodyReport(),
        MoverHaciaMapas(),
      ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(localizations.t('reporte.title'),
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.justify),
    );
  }
}

class BodyReport extends StatelessWidget {
  const BodyReport({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(localizations.t('reporte.body').toUpperCase(),
          style: TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.justify),
    );
  }
}

class MoverHaciaMapas extends StatelessWidget {
  const MoverHaciaMapas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        //color: Colors.green,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Bell(),
            ));
          },
          child: Text(
            localizations.t('reporte.maps'),
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class UsuarioUbicacion extends StatelessWidget {
  const UsuarioUbicacion({
    Key key,
    @required this.imgUser,
    @required this.nameUser,
  }) : super(key: key);

  final String imgUser;
  final String nameUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Bell(),
              ));
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(360.0),
                      child: Image.asset(
                        this.imgUser,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  Text(
                    '@${this.nameUser}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 60,
          ),
          Container(
            child: Icon(Icons.location_on),
          ),
          Text('TX 04000'),
        ],
      ),
    );
  }
}

class ImagenReporte extends StatelessWidget {
  const ImagenReporte({
    Key key,
    @required this.imag,
  }) : super(key: key);

  final String imag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 360,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(this.imag),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              VerReporte(),
              Corazon(),
            ],
          ),
        ],
      ),
    );
  }
}

class VerReporte extends StatelessWidget {
  const VerReporte({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RaisedButton(
              color: Colors.white,
              child: Text(
                localizations.t('reporte.verrep'),
                style: TextStyle(
                  //fontSize: 10,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Application(),
                ));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white),
              ),
            ),
            Text(
              '10 min agos',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Corazon extends StatelessWidget {
  const Corazon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          children: [
            IconButton(
                icon: Icon(FontAwesomeIcons.heart),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
                }),
            Text('10',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
