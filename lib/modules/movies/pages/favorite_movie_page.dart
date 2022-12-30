import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class FavoriteMoviePage extends StatefulWidget {
  const FavoriteMoviePage({super.key});

  @override
  State<FavoriteMoviePage> createState() => _FavoriteMoviePageState();
}

class _FavoriteMoviePageState extends State<FavoriteMoviePage> {
  final controller = Modular.get<DataBaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Modular.to.pop();
          },
        ),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.movie_filter_sharp,
              color: Colors.black,
            ),
            Text(
              'Favorite Movies',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: controller.movies.isEmpty
          ? Observer(
              builder: (_) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset('assets/sad_heart.json'),
                    ),
                    const Text(
                      'Pi pi pi... estamos sem nenhum filme nos favoritos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Observer(builder: (_) => _list()),
    );
  }

  _list() {
    return ListView.builder(
      itemCount: controller.movies.length,
      itemBuilder: (context, index) {
        var todo = controller.movies[index];
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(todo['title']),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                    fit: BoxFit.cover,
                    'https://image.tmdb.org/t/p/w500/${todo['poster_path']}'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.blueGrey[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sinopse do filme:'),
                    Text('Votos do filme'),
                    Text('Duracao'),
                    Text('Data de lancamento'),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Remover dos Favoritos'),
                IconButton(
                  icon: const Icon(
                    Icons.star_purple500_outlined,
                    size: 20,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    controller.deleteMovie(todo['idMovie']);
                    controller.getAllMovies();
                  },
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
          ],
        );
      },
    );
  }
}
