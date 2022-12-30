import 'package:case_alura/core/widgets/container/container_custom.dart';
import 'package:case_alura/core/widgets/text/text_custom.dart';
import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
            const SizedBox(
              height: 20,
            ),
            TextCustom(label: (todo['title'])),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                    fit: BoxFit.cover,
                    'https://image.tmdb.org/t/p/w500/${todo['poster_path']}'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextCustom(label: 'Sinopse do filme:'),
            ContainerCustom(
              label: todo['overview'],
            ),
            TextCustom(label: 'Duracao: ${todo['runtime']} minutos'),
            TextCustom(label: 'Data de lancamento: ${todo['release_date']}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(label: 'Nota: ${todo['vote_average']}'),
                const SizedBox(
                  width: 10,
                  height: 20,
                ),
                RatingBarIndicator(
                  rating: double.parse(todo['vote_average']) / 2,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                controller.deleteMovie(todo['idMovie']);
                controller.getAllMovies();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Remover dos Favoritos',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star_purple500_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
          ],
        );
      },
    );
  }
}
