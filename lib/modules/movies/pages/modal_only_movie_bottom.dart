import 'package:case_alura/core/widgets/button/button_custom.dart';
import 'package:case_alura/core/widgets/circular/circular_progress_custom.dart';
import 'package:case_alura/core/widgets/snack_custom/snack_bar_custom.dart';
import 'package:case_alura/core/widgets/text/text_custom.dart';
import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:case_alura/modules/movies/controller/movies_controller.dart';
import 'package:case_alura/modules/movies/controller/play_video/play_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ModalBottom extends StatelessWidget {
  const ModalBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<MoviesController>();
    final dataBase = Modular.get<DataBaseController>();
    final watch = Modular.get<PlayVideoController>();
    return Observer(
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: controller.loading || controller.onlyMovieModel.id == null
            ? const Center(
                child: CircularProgressCustom(),
              )
            : Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    height: MediaQuery.of(context).size.height * .9,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonCustom(
                              label: dataBase.ids
                                      .contains(controller.onlyMovieModel.id!)
                                  ? const Text('Remover dos Favoritos',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ))
                                  : const Text('Adicionar aos Favoritos',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      )),
                              onPressed: () {
                                if (dataBase.ids
                                    .contains(controller.onlyMovieModel.id!)) {
                                  dataBase.deleteMovie(
                                      controller.onlyMovieModel.id!);
                                  dataBase.removeFavorite(
                                      controller.onlyMovieModel.id!);
                                } else {
                                  dataBase.setMovie(
                                      idMovie: controller.onlyMovieModel.id!,
                                      title: controller.onlyMovieModel.title!,
                                      posterPath:
                                          controller.onlyMovieModel.posterPath!,
                                      overview:
                                          controller.onlyMovieModel.overview!,
                                      voteAverage: controller
                                          .onlyMovieModel.voteAverage!,
                                      runtime:
                                          controller.onlyMovieModel.runtime!,
                                      releaseDate: controller
                                          .onlyMovieModel.releaseDate!);
                                }
                                dataBase.getAllMovies();
                                Modular.to.pop();
                              },
                              color: dataBase.ids
                                      .contains(controller.onlyMovieModel.id!)
                                  ? Colors.red
                                  : Colors.yellow,
                              width: MediaQuery.of(context).size.width * .8,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width * .8,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () async {
                                  await watch.getVideoMovie(
                                      controller.onlyMovieModel.id!);
                                  watch.key.isEmpty
                                      ? SnackBarCustom.error(
                                          'Trailer indisponivel')
                                      : Modular.to.pushNamed('watch');
                                },
                                icon: const Icon(Icons.movie_creation_sharp),
                                label: watch.loadingVideo
                                    ? const CircularProgressCustom()
                                    : const Text('Ver Trailer',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextCustom(
                              label:
                                  'Título: ${controller.onlyMovieModel.title}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextCustom(
                                label:
                                    'Sinopse: ${controller.onlyMovieModel.overview!}',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              height: MediaQuery.of(context).size.height * .7,
                              width: MediaQuery.of(context).size.width * .9,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    'https://image.tmdb.org/t/p/w500${controller.onlyMovieModel.posterPath}'),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextCustom(
                              label:
                                  'Lançamento: ${controller.onlyMovieModel.releaseDate}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextCustom(
                              label:
                                  'Nota do Filme ${controller.onlyMovieModel.voteAverage}',
                            ),
                            RatingBarIndicator(
                              rating: double.parse(
                                      controller.onlyMovieModel.voteAverage!) /
                                  2,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextCustom(
                              label:
                                  'Duração: ${controller.onlyMovieModel.runtime!} min',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonCustom(
                              label: const Text('Voltar',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onPressed: () {
                                Modular.to.pop();
                              },
                              color: Colors.yellow,
                              width: MediaQuery.of(context).size.width * .8,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
