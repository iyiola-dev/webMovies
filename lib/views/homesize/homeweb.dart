import 'package:flutter/material.dart';
import 'package:landing_page/core/api/movie_api.dart';
import 'package:landing_page/core/models/movies_models.dart';
import 'package:landing_page/core/models/result_model.dart';
import 'package:landing_page/utils/progress.dart';
import 'package:landing_page/utils/size_config.dart';

class HomeWeb extends StatelessWidget {
  Api api;
  Movies movies;
  Result result;
  HomeWeb({this.api, this.movies, this.result});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder<Movies>(
      future: Api.getMovies(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
              itemCount: snapshot.data.result.length,
              itemBuilder: (BuildContext context, int index) {
                Result movie = snapshot.data.result[index];
                var posterPath =
                    "https://image.tmdb.org/t/p/w500" + movie.backdropPath;
                var imageUrl =
                    "https://image.tmdb.org/t/p/w500" + movie.posterPath;
                return Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posterPath)),
                  ),
                  child: Center(
                    child: Container(
                      height: Config.yMargin(context, 27.5),
                      width: Config.xMargin(context, 14),
                      child: GridTile(
                        footer: new GridTileBar(
                          backgroundColor: Colors.black45,
                          title: new Text(movie.title),
                        ),
                        child: new GestureDetector(
                          onTap: () {},
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(child: spinkit);
        }
      },
    );
  }
}
