class User {
  int _idUser;
  int _credits;
  String _login;
  String _password;

  User(this._idUser, this._credits, this._login, this._password);

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }

  int get credits => _credits;

  set credits(int value) {
    _credits = value;
  }

  String get login => _login;

  set login(String value) {
    _login = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }
}
