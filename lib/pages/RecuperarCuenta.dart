import 'package:flutter/material.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/screens/home_recovery.dart';

class RecuperarCuenta extends StatefulWidget {
  @override
  _RecuperarCuentaState createState() => _RecuperarCuentaState();
}

class _RecuperarCuentaState extends State<RecuperarCuenta> {
  Widget renderMostarTexto(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        localizations.t('recuperarCuenta.texto'),
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget renderEmailInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('recuperarCuenta.correo'),
            labelText: localizations.t('recuperarCuenta.correolabel')),
        validator: (String value) {
          if (value.isEmpty) {
            return localizations.t('recuperarCuenta.validar');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderEnvioButton(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(localizations.t("recuperarCuenta.button")),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(localizations.t("recuperarCuenta.title")),
              content: Text(localizations.t("recuperarCuenta.content")),
              actions: <Widget>[
                FlatButton(
                  child: Text(localizations.t("recuperarCuenta.ok")),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CodigoVerificacion(),
                    ));
                  },
                ),
              ],
            ),
          ).then((result) {
            print(result);
          });
        },
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
        title: Text(localizations.t("recuperarCuenta.appBar")),
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
              renderMostarTexto(context),
              renderEmailInput(context),
              renderEnvioButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

class CodigoVerificacion extends StatefulWidget {
  @override
  _CodigoVerificacionState createState() => _CodigoVerificacionState();
}

class _CodigoVerificacionState extends State<CodigoVerificacion> {
  Widget renderVerificaciondInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('codigoV.input'),
            labelText: localizations.t('codigoV.inputLabel')),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return localizations.t('codigoV.validar');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderActualizarButton(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(localizations.t('codigoV.button')),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(localizations.t('codigoV.dialogT')),
              content: Text(localizations.t('codigoV.dialogC')),
              actions: <Widget>[
                FlatButton(
                  child: Text(localizations.t('codigoV.cancel')),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(localizations.t('codigoV.cancel'));
                  },
                ),
                FlatButton(
                  child: Text(localizations.t('codigoV.ok')),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeRecovery(),
                    ));
                  },
                ),
              ],
            ),
          ).then((result) {
            print(result);
          });
        },
      ),
    );
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.t('codigoV.appBar')),
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
              renderVerificaciondInput(context),
              renderActualizarButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
