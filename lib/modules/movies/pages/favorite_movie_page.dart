import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:flutter/material.dart';
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
            ? Center(
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
              )
            : Container(
                child: Text('Favorite Movies'),
              ));
  }
}
