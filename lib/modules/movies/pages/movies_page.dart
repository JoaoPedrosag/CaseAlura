import 'package:case_alura/core/widgets/button/button_custom.dart';
import 'package:case_alura/modules/movies/controller/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final controller = MoviesController();
  _start() {
    return Container();
  }

  _success() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.moviesTodo.results!.length,
        itemBuilder: (context, index) {
          var todo = controller.moviesTodo.results![index];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 300,
                child: Column(
                  children: [
                    SizedBox(
                      child: IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        onPressed: () {},
                      ),
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
                      height: 500,
                      width: 460,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                            fit: BoxFit.cover,
                            'https://image.tmdb.org/t/p/w500${todo.posterPath}'),
                      ),
                    ),
                    Text(
                      todo.title!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  stateManagement(HomeState state) {
    print(state);
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
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
        centerTitle: true,
        actions: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Observer(builder: (_) {
            return stateManagement(controller.state);
          })
        ],
      ),
    );
  }
}
