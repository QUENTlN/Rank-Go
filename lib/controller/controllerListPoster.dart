import 'dart:async';

import 'package:mysql1/mysql1.dart';
import 'package:rank_and_go/models/media.dart';
import 'package:rank_and_go/models/poster.dart';

class ControllerListPoster {
  Future<List<Poster>> getPostersTimeLine(int idCur) async {
    var settings = new ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '',
        db: 'rankandgo');
    var conn = await MySqlConnection.connect(settings);
    var results = await conn.query('CALL selectAllPost(?) ', [idCur]);
    // ignore: deprecated_member_use
    List<Poster> desPosters;
    for (var row in results) {
      Media media1 = Media(row['media1']);
      Media media2 = Media(row['media2']);
      Media media3 = Media(row['media3']);
      Poster poster = Poster(
          row['id'],
          row['Description'],
          row['Title'],
          row['State'],
          row['CreditsAllow'],
          row['CommentEnable'],
          row['TypeNote'],
          row['IdUser'],
          media1,
          media2,
          media3);
      desPosters.add(poster);
    }
    return desPosters;
  }
}
