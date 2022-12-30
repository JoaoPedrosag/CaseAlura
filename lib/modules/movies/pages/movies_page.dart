import 'package:case_alura/core/widgets/button/button_custom.dart';
import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:case_alura/modules/movies/controller/movies_controller.dart';
import 'package:case_alura/modules/movies/pages/modal_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/widgets/circular/circular_progress_custom.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late final ScrollController _scrollController;
  final controller = Modular.get<MoviesController>();
  final dataBase = Modular.get<DataBaseController>();

  _start() {
    return Container();
  }

  _success() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: controller.moviesTodo.results!.length,
        itemBuilder: (context, index) {
          var todo = controller.moviesTodo.results![index];
          return Observer(
            builder: (_) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20,
                  width: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: IconButton(
                            icon: dataBase.ids.contains(todo.id)
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border_outlined),
                            onPressed: () {
                              if (dataBase.ids.contains(todo.id)) {
                                dataBase.deleteMovie(todo.id!);
                              } else {
                                dataBase.setMovie(
                                    idMovie: todo.id!,
                                    title: todo.title!,
                                    posterPath: todo.posterPath!,
                                    overview: todo.overview!,
                                    voteAverage: todo.voteAverage!,
                                    runtime: 0,
                                    releaseDate: todo.releaseDate!);
                              }
                              dataBase.getAllMovies();
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.getMovie(todo.id!);
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isDismissible: true,
                              isScrollControlled: true,
                              builder: (context) => const ModalBottom(),
                            );
                          },
                          child: Container(
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
                            height: MediaQuery.of(context).size.height * 0.63,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                  fit: BoxFit.cover,
                                  'https://image.tmdb.org/t/p/w500${todo.posterPath}'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Título: ${todo.title!}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Lançamento: ${todo.releaseDate!}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingBarIndicator(
                          rating: double.parse(todo.voteAverage!) / 2,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 45.0,
                          direction: Axis.horizontal,
                        ),
                        Text(
                          'Nota: ${todo.voteAverage!}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _error() {
    return Center(
      child: ButtonCustom(
        label: const Text('Tentar novamente',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          controller.start();
        },
        color: Colors.yellow,
        width: 300,
      ),
    );
  }

  _loading() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .60,
      child: const Center(
        child: CircularProgressCustom(),
      ),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.success:
        return _success();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();

      default:
    }
  }

  @override
  void initState() {
    super.initState();
    dataBase.getAllMovies();
    controller.start();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      infiniteScroll();
    });
  }

  infiniteScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        controller.state != HomeState.loading) {
      controller.start();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        actions: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    Modular.to.pushNamed('favorite');
                    dataBase.getAllMovies();
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            controller.page > 1
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: GestureDetector(
                      onTap: () {
                        controller.changePage();
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.first_page_rounded),
                          Text('Voltar'),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Observer(builder: (_) {
              return stateManagement(controller.state);
            })
          ],
        ),
      ),
    );
  }
}
