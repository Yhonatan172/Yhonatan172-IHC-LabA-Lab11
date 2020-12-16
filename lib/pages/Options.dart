import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_ihc/aplication_localizations.dart';
import 'package:proyecto_final_ihc/pages/LoginPage.dart';
import 'package:proyecto_final_ihc/states/theme_state.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AplicacionLocalizations localizations = AplicacionLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.t('option.appBar')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Consumer<ThemeState>(
              builder: (context, state, child) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(child: Text(localizations.t('option.darkmode'))),
                    Switch(
                      value: state.isDarkModeEnabled,
                      onChanged: (_) {
                        state.setDarkMode(!state.isDarkModeEnabled);
                      },
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                },
                child: Text(localizations.t('option.salir')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
