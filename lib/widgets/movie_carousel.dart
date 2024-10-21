import 'package:flutter/material.dart';
import 'package:film_flix/services/movie_service.dart';
import 'package:film_flix/utils/genre_map.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  MovieCarouselState createState() => MovieCarouselState();
}

class MovieCarouselState extends State<MovieCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  final MovieService _movieService = MovieService();

  // Lista de gêneros
  late Future<Map<int, List<dynamic>>> _moviesByGenre;

  @override
  void initState() {
    super.initState();
    _moviesByGenre = _fetchMoviesByGenres();
  }

  Future<Map<int, List<dynamic>>> _fetchMoviesByGenres() async {
    final Map<int, List<dynamic>> moviesMap = {};

    // Obtém filmes para cada gênero
    for (var genreEntry in genreMap.entries) {
      final genreId = genreEntry.key;
      List<dynamic> movies = await _movieService.fetchMoviesByGenre(genreId);
      moviesMap[genreId] = movies;
    }
    return moviesMap;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, List<dynamic>>>(
      future: _moviesByGenre,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final moviesByGenre = snapshot.data!;

          return ListView.builder(
            itemCount: moviesByGenre.keys.length,
            itemBuilder: (context, index) {
              final genreId = moviesByGenre.keys.elementAt(index);
              final movies = moviesByGenre[genreId] ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      genreMap[genreId] ?? 'Gênero Desconhecido',
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 480,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(), // Permitir rolagem lateral
                      child: Row(
                        children: movies.map((movie) {
                          final String imageUrl =
                              'https://image.tmdb.org/t/p/w500${movie['poster_path']}';

                          return Container(
                            width: MediaQuery.of(context).size.width * 0.45, // Largura do card
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: MovieCard(
                              imageUrl: imageUrl,
                              genre: genreMap[genreId] ?? 'Desconhecido',
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          );
        } else {
          return const Center(child: Text('Deu ruim :('));
        }
      },
    );
  }
}