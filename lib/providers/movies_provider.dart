import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'f300c0c4fec58fb3c3189f3b4fb9930a';
  final String _lenguage = 'es-ES';

  MoviesProvider() {
    getOnDiplayMovies();
  }

  getOnDiplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _lenguage, 'page': '1'});

    final res = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(res.body);

    print(nowPlayingResponse.results);
  }
}
