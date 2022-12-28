import 'dart:convert';
import 'dart:developer';

import 'package:case_alura/modules/movies/model/movies_model.dart';
import 'package:case_alura/modules/movies/service/i_movies.dart';
import 'package:http/http.dart' as http;

class MoviesImpl implements IMoviesService {
  @override
  Future<MoviesTodo> getMovies() async {
    try {
      final url = Uri.parse(
          "https://api.themoviedb.org/3/movie/now_playing?api_key=983928bb76ee533d2e6b4d52986438eb&language=pt-BR&page=1");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return MoviesTodo.fromJson(jsonDecode(response.body));
      }
      return MoviesTodo(movies: []);
    } on Exception catch (e) {
      log(e.toString());
      throw Exception("Erro ao buscar filmes");
    }
  }
}
