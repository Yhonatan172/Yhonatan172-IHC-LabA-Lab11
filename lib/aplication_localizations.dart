import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class AplicacionLocalizations {
  final String localeName;

  AplicacionLocalizations(this.localeName);
  static const LocalizationsDelegate<AplicacionLocalizations> delegate =
      _AplicacionLocalizationsDelegate();

  YamlMap translations;
  YamlMap translationsEn;
  YamlMap translationsPt;

  Future load() async {
    String yamlString = await rootBundle.loadString('lang/${localeName}.yml');
    translations = loadYaml(yamlString);
    String yamlString1 = await rootBundle.loadString('lang/en.yml');
    translationsEn = loadYaml(yamlString1);
    String yamlString2 = await rootBundle.loadString('lang/pt.yml');
    translationsPt = loadYaml(yamlString2);
  }

  dynamic t(String key) {
    try {
      var keys = key.split(".");
      dynamic translated = translations;
      keys.forEach((k) => translated = translated[k]);
      if (translated == null) {
        return _tEn(key);
      }
      return translated;
    } catch (e) {
      return _tEn(key);
    }
  }

  dynamic _tEn(String key) {
    try {
      var keys = key.split(".");
      dynamic translated = translationsEn;
      keys.forEach((k) => translated = translated[k]);
      if (translated == null) {
        return "Key not found: $key";
      }
      return translated;
    } catch (e) {
      return "Key not found: $key";
    }
  }

  dynamic _tPt(String key) {
    try {
      var keys = key.split(".");
      dynamic translated = translationsPt;
      keys.forEach((k) => translated = translated[k]);
      if (translated == null) {
        return "Key not found: $key";
      }
      return translated;
    } catch (e) {
      return "Key not found: $key";
    }
  }

  static AplicacionLocalizations of(BuildContext context) {
    return Localizations.of<AplicacionLocalizations>(
        context, AplicacionLocalizations);
  }
}

class _AplicacionLocalizationsDelegate
    extends LocalizationsDelegate<AplicacionLocalizations> {
  const _AplicacionLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    //
    return ['es', 'en', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AplicacionLocalizations> load(Locale locale) async {
    var t = AplicacionLocalizations(locale.languageCode);
    await t.load();
    return t;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AplicacionLocalizations> old) {
    return false;
  }
}
