class Note {
  int _note;
  String _comment;
  int _idUser;
  int _idPoster;

  Note(
      this._note,
      this._comment,
      this._idUser,
      this._idPoster);

  int get note => _note;

  set note(int value) {
    _note = value;
  }


  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  int get idUser => _idUser;

  set idUser(int value) {
    _idUser = value;
  }

  int get idPoster => _idPoster;

  set idPoster(int value) {
    _idPoster = value;
  }

}