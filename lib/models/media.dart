class Media {
  int _index;
  int _idPoster;
  String _path;

  Media(this._index,
      this._idPoster,
      this._path);

  int get index => _index;

  set index(int value) {
    _index = value;
  }


  int get idPoster => _idPoster;

  set idPoster(int value) {
    _idPoster = value;
  }


  String get path => _path;

  set path(String value) {
    _path = value;
  }

}



