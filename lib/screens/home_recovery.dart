import 'package:flutter/material.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/User.dart';

class HomeRecovery extends StatefulWidget {
  @override
  _HomeRecoveryState createState() => _HomeRecoveryState();
}

class _HomeRecoveryState extends State<HomeRecovery> {
  Widget renderPasswordInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('recovery.password'),
            labelText: localizations.t('recovery.passLabel')),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return localizations.t('recovery.passValidar');
          }
          return null;
        },
        onSaved: (String value) {},
      ),
    );
  }

  Widget renderPasswordRetryInput(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: localizations.t('recovery.passRetry'),
            labelText: localizations.t('recovery.passLabel')),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return localizations.t('recovery.passValidar');
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
        child: Text(localizations.t("recovery.buttonT")),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(localizations.t('recovery.dialogT')),
              content: Text(localizations.t('recovery.dialogC')),
              actions: <Widget>[
                FlatButton(
                  child: Text(localizations.t('recovery.ok')),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => User(),
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
        title: Text(localizations.t('recovery.appBar')),
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
              renderPasswordInput(context),
              renderPasswordRetryInput(context),
              renderActualizarButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
