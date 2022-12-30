import 'package:case_alura/core/widgets/button/button_custom.dart';
import 'package:case_alura/core/widgets/circular/circular_progress_custom.dart';
import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:case_alura/modules/movies/controller/movies_controller.dart';
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
    return Observer(
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: controller.loading
            ? const Center(
                child: CircularProgressCustom(),
              )
            : Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
                              label: const Text('Adicionar aos Favoritos',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                              onPressed: () {
                                dataBase.setMovie(
                                    idMovie: controller.onyMovieModel.id!,
                                    title: controller.onyMovieModel.title!,
                                    posterPath:
                                        controller.onyMovieModel.posterPath!,
                                    overview:
                                        controller.onyMovieModel.overview!,
                                    voteAverage:
                                        controller.onyMovieModel.voteAverage!,
                                    runtime: controller.onyMovieModel.runtime!,
                                    releaseDate:
                                        controller.onyMovieModel.releaseDate!);
                              },
                              color: Colors.yellow,
                              width: MediaQuery.of(context).size.width * .8,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Título: ${controller.onyMovieModel.title}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Lançamento: ${controller.onyMovieModel.releaseDate}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RatingBarIndicator(
                              rating: double.parse(
                                      controller.onyMovieModel.voteAverage!) /
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sinopse: ${controller.onyMovieModel.overview!}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Duração: ${controller.onyMovieModel.runtime!} min',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
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
                                    'https://image.tmdb.org/t/p/w500${controller.onyMovieModel.posterPath}'),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
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
