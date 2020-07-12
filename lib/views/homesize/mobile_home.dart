import 'package:flutter/material.dart';
import 'package:landing_page/core/api/movie_api.dart';
import 'package:landing_page/core/models/movies_models.dart';
import 'package:landing_page/core/models/result_model.dart';
import 'package:landing_page/utils/progress.dart';

// ignore: must_be_immutable
class Homob extends StatefulWidget {
  Api api;
  Movies movies;
  Result result;
  Homob({this.movies, this.result, this.api});
  @override
  _HomobState createState() => _HomobState();
}

class _HomobState extends State<Homob> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder<Movies>(
      future: Api.getMovies(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(child: Text(widget.movies.page.toString()));
        } else {
          return Center(child: spinkit);
        }
      },
    );
  }
}
