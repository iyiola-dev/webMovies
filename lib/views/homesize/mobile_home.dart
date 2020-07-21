import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/core/api/movie_api.dart';
import 'package:landing_page/core/models/movies_models.dart';
import 'package:landing_page/core/models/result_model.dart';
import 'package:landing_page/utils/progress.dart';
import 'package:landing_page/utils/size_config.dart';

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
    final posterpath = 'http://image.tmdb.org/t/p/w500';
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder<Movies>(
      future: Api.getMovies(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(12.0),
            height: height,
            width: width,
            child: GridView.builder(
                itemCount: snapshot.data.result.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // childAspectRatio: (MediaQuery.of(context).size.width / 2.5) /
                  //     MediaQuery.of(context).size.height,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Result movie = snapshot.data.result[index];
                  var imageURL =
                      "https://image.tmdb.org/t/p/w500" + movie.posterPath;
                  return Container(
                    padding: const EdgeInsets.all(5),
                    child: GridTile(
                      footer: new GridTileBar(
                        backgroundColor: Colors.black45,
                        title: new Text(movie.title),
                      ),
                      child: new GestureDetector(
                        onTap: () {},
                        child: Image.network(
                          imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return Center(child: spinkit);
        }
      },
    );
  }
}
