import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:discover_movie/api/movies_api.dart';
import 'package:discover_movie/models/movie.dart';
import 'package:discover_movie/models/response.dart';
import 'package:discover_movie/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  final String title = 'Discover Movie Home Page';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Text(
                      'What\'s Popular',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 305.0,
                    child: FutureBuilder<Response<Movie>>(
                      future: fetchPopularMovies(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Response<Movie> response = snapshot.data;
                          List<Movie> movies = response.results;
                          int count = response.results.length;

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 5.0);
                            },
                            itemCount: count,
                            itemBuilder: (context, index) {
                              Movie movie = movies[index];
                              String title = movie.title.length > 12
                                  ? movie.title.substring(0, 12)
                                  : movie.title;
                              String subTitle = new DateFormat.yMMMMd('en_US')
                                  .format(movie.releaseDate);
                              String image =
                                  'https://www.themoviedb.org/t/p/w220_and_h330_face/${movie.posterPath}';

                              return CardWidget(
                                image: image,
                                title: title,
                                subTitle: subTitle,
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
