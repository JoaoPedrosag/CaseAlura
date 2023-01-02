import 'dart:convert';
import 'dart:developer';
import 'package:case_alura/core/const/api_utl.dart';
import 'package:case_alura/core/widgets/snack_custom/snack_bar_custom.dart';
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
          "${Links.base}now_playing?api_key=${Links.key}&${Links.language}&page=$page");
      final response = await http.get(url).timeout(const Duration(seconds: 5),
          onTimeout: () {
        SnackBarCustom.alert('Parece que você esta sem internet');
        throw Exception('timeout');
      });
      if (response.statusCode == 200) {
        return MoviesTodo.fromJson(jsonDecode(response.body));
      } else {
        SnackBarCustom.error('Parece que nossos servidores estão desligados');
        throw Exception('Unable to fetch movies from the REST API');
      }
    } on Exception catch (e) {
      log(e.toString());
      throw Exception("Erro ao buscar filmes");
    }
  }

  @override
  Future<OnyMovieModel> getMovie(int id) async {
    try {
      final url =
          Uri.parse("${Links.base}$id?api_key=${Links.key}&${Links.language}");
      final response = await http.get(url).timeout(const Duration(seconds: 5),
          onTimeout: () {
        SnackBarCustom.alert('Parece que você esta sem internet');
        throw Exception('timeout');
      });
      if (response.statusCode == 200) {
        return OnyMovieModel.fromJson(jsonDecode(response.body));
      } else {
        SnackBarCustom.error('Parece que nossos servidores estão desligados');
        throw Exception('Unable to fetch movies from the REST API');
      }
    } on Exception catch (e) {
      log(e.toString());
      throw Exception("Erro ao buscar filmes");
    }
  }

  @override
  Future<MovieVideo> getVideoMovie(int id) async {
    try {
      final url = Uri.parse(
          "${Links.base}$id/videos?api_key=${Links.key}&${Links.language}");
      final response = await http.get(url).timeout(const Duration(seconds: 5),
          onTimeout: () {
        SnackBarCustom.alert('Parece que você esta sem internet');
        throw Exception('timeout');
      });
      if (response.statusCode == 200) {
        return MovieVideo.fromJson(jsonDecode(response.body));
      } else {
        SnackBarCustom.error('Parece que nossos servidores estão desligados');
        throw Exception('Unable to fetch movies from the REST API');
      }
    } on Exception catch (e) {
      log(e.toString());
      throw Exception("Erro ao buscar filmes");
    }
  }
}
