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
    return Observer(
      builder: (_) => Expanded(
        child: ListView.builder(
          itemCount: controller.moviesTodo.results!.length,
          itemBuilder: (context, index) {
            var todo = controller.moviesTodo.results![index];
            return Text(todo.title!);
          },
        ),
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
        title: const Text("Filmes em cartaz"),
      ),
      body: Column(
        children: [
          stateManagement(controller.state),
        ],
      ),
    );
  }
}
