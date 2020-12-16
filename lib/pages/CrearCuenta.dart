import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/User.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  Widget renderNameInput(BuildContext context) {
     AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(hintText: localizations.t('crearC.usuario')),
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return localizations.t('crearC.usuario');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderLastNameInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(hintText: localizations.t('crearC.apellidos')),
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return localizations.t('crearC.apellidos');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderEmailInput(BuildContext context) {
      AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('crearC.correo'), labelText: localizations.t('crearC.correo2')),
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return localizations.t('crearC.validarC');
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
            hintText: localizations.t('crearC.password'), labelText:localizations.t('ingreso.password') ),
        obscureText: true,
        /* <-- Aquí */
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return localizations.t('validadores.password');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderRetypePasswordInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('ingreso.password'), labelText: localizations.t('crearC.validar')),
        obscureText: true,
        /* <-- Aquí */
        validator: (String value) {
          if (value.isEmpty) {
            //si no se tiene nada se retorna eel erroe
            return localizations.t('validadores.password');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderLoginButton(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(localizations.t('crearC.crear')),
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => User(
                //titleController.text,
                //dateController.text,
                ),
          ));
        },
      ),
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
              child: Text(localizations.t('crearC.face')),
            ),
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
              child: Text(localizations.t('crearC.google')),
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
     AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.t('crearC.cuenta')),
      ),
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
                  "assets/images/logo.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.scaleDown,
                ),
              ),
              renderNameInput(context),
              renderLastNameInput(context),
              renderEmailInput(context),
              renderPasswordInput(context),
              renderRetypePasswordInput(context),
              renderLoginButton(context),
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
