import 'dart:convert';

import 'package:rank_and_go/models/media.dart';

class Poster {
  int _idPoster;
  String _description;
  String _title;
  bool _state;
  int _creditsAllow;
  bool _commentEnable;
  int _idUser;
  TypeNote _typeNotation;
  Media _media1;
  Media _media2;
  Media _media3;

  Poster(
      this._idPoster,
      this._description,
      this._title,
      this._state,
      this._creditsAllow,
      this._commentEnable,
      this._idUser,
      this._typeNotation,
      this._media1,
      this._media2,
      this._media3);

  int get idPoster => _idPoster;

  set idPoster(int value) {
    _idPoster = value;
  }

  String get descrption => _description;

  set descrption(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  bool get state => _state;

  set state(bool value) {
    _state = value;
  }

  int get creditsAllow => _creditsAllow;

  set creditsAllow(int value) {
    _creditsAllow = value;
  }

  bool get commentEnable => _commentEnable;

  set commentEnable(bool value) {
    _commentEnable = value;
  }

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }

  TypeNote get typeNotation => _typeNotation;

  set typeNotation(TypeNote value) {
    _typeNotation = value;
  }
}

enum TypeNote { oneToFive, oneToTwenty, yesOrNot }
