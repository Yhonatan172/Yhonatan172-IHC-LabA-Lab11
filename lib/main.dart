import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyecto_final_ihc/states/theme_state.dart';
import 'pages/LoginPage.dart';
import 'aplication_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeState>(create: (_) => ThemeState())
      ],
      child: Consumer<ThemeState>(
        builder: (context, state, child) {
          return MaterialApp(
            title: 'Aplicacion IHC',
            theme: state.currentTheme,
            home: LoginPage(),
            supportedLocales: [
              Locale('en'),
              Locale('es'),
              Locale('pt'),
            ],
            localizationsDelegates: [
              AplicacionLocalizations.delegate,
              GlobalMaterialLocalizations.delegate, //carga todos los idiomas
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
