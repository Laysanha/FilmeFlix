import 'package:film_flix/services/movie_service.dart';
import 'package:film_flix/utils/genre_map.dart';
import 'package:flutter/material.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  MovieCarouselState createState() => MovieCarouselState();
}

class MovieCarouselState extends State<MovieCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  final MovieService _movieService = MovieService();

  late Future<List<dynamic>> _movies;
  @override
  void initState() {
    super.initState();
    _movies = _movieService.fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _movies,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError){
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData){
          final movies = snapshot.data ?? [];
          return PageView.builder(
            controller: _pageController,
            itemCount: movies.length,
            itemBuilder: (context, index){
              final movie = movies[index];
              final String imageUrl = 'https://image.tmdb.org/t/p/w500${movie['poster_path']}';
              final String title = movie['title'];
              final String rating =  '${movie['vote_average']} Rating';

              //Usar genero dos filmes:
              final List<int> genreIds = List<int>.from(movie['genre_ids']);
              final genres = genreIds.map((id) => genreMap[id]).where((genre) => genre != null).join(', ');

              return MovieCard(
                imageUrl: imageUrl,
                title: title,
                rating: rating,
                genre: genres,
              );
            }
          );
        } else { return const Center(child: Text('Deu ruim :('),); }
      } 
    );
  }
}
