import 'dart:convert';
import 'dart:developer';

import 'package:case_alura/modules/movies/model/movie_video_model.dart';
import 'package:case_alura/modules/movies/model/movies_model.dart';
import 'package:case_alura/modules/movies/model/only_movie_model.dart';
import 'package:case_alura/modules/movies/service/i_movies.dart';
import 'package:http/http.dart' as http;

class MoviesImpl implements IMoviesService {
  @override
  Future<MoviesTodo> getMovies(int page) async {
    try {
      final url = Uri.parse(
          "https://api.themoviedb.org/3/movie/now_playing?api_key=983928bb76ee533d2e6b4d52986438eb&language=pt-BR&page=$page");
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

  @override
  Future<OnyMovieModel> getMovie(int id) async {
    try {
      final url = Uri.parse(
          "https://api.themoviedb.org/3/movie/$id?api_key=983928bb76ee533d2e6b4d52986438eb&language=pt-BR");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return OnyMovieModel.fromJson(jsonDecode(response.body));
      }
      return OnyMovieModel(movie: []);
    } on Exception catch (e) {
      log(e.toString());
      throw Exception("Erro ao buscar filmes");
    }
  }

  @override
  Future<MovieVideo> getVideoMovie(int id) async {
    try {
      final url = Uri.parse(
          "https://api.themoviedb.org/3/movie/$id/videos?api_key=983928bb76ee533d2e6b4d52986438eb&language=pt-BR");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return MovieVideo.fromJson(jsonDecode(response.body));
      }
      return MovieVideo(video: []);
    } on Exception catch (e) {
      log(e.toString());
      throw Exception("Erro ao buscar filmes");
    }
  }
}
