import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/RecuperarCuenta.dart';
import 'Application.dart';
import 'CrearCuenta.dart';

class LoginPage extends StatelessWidget {
  String passwordApli = "1234";
  String logAplic = "Frank";
  Widget renderEmailInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('ingreso.usuario'),
            labelText: localizations.t('ingreso.usuario')),
        validator: (String value) {
          if (value.isEmpty || !(logAplic == value)) {
            //si no se tiene nada se retorna eel erroe
            return localizations.t('validadores.usuario');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderPasswordInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('ingreso.password'),
            labelText: localizations.t('ingreso.password')),
        obscureText: true,
        /* <-- Aquí */
        validator: (String value) {
          if (value.isEmpty || !(passwordApli == value)) {
            //si no se tiene nada se retorna eel erroe
            return localizations.t('validadores.password');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderRecupPassword(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: InkWell(
          child: Text(
            //localizations.t('login.password'),
            localizations.t('recuperar.contrasena'),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecuperarCuenta(),
            ));
          }),
    );
  }

  Widget renderLoginButton(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(localizations.t('boton.ingreso')),
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Application(),
          ));
        },
      ),
    );
  }

  Widget renderCreateAccountLink(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: InkWell(
          child: Text(
            localizations.t('crear.cuenta'),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CrearCuenta(),
            ));
          }),
    );
  }

  Widget renderDivisor() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('O'),
          ),
          Expanded(child: Divider(height: 1)),
        ],
      ),
    );
  }

  Widget renderFacebookButton(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        color: Color.fromRGBO(59, 89, 152, 1),
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.facebookSquare),
            Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  localizations.t('ingresar.face'),
                )),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget renderGoogleButton(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: RaisedButton(
        color: Colors.red,
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(localizations.t('ingresar.ggle')),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        //decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Image.asset(
                  //"assets/images/logo_2.2.png",
                  "assets/images/logo.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                width: 10,
                height: 10,
              ),
              renderEmailInput(context),
              renderPasswordInput(context),
              renderRecupPassword(context),
              renderLoginButton(context),
              renderCreateAccountLink(context),
              renderDivisor(),
              renderFacebookButton(context),
              renderGoogleButton(context),
              Container(
                width: 10,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
