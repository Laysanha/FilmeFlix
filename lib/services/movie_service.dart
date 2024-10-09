import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = '8de3c7efb0eb64b6704484a500de3f87';
  final String baseUrl = 'https://api.themoviedb.org/3';

  //Bucar filmes
  Future<List<dynamic>> fetchPopularMovies() async {
   final response = await http.get(
     Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=pt-BR&page=1')
   );

   if (response.statusCode == 200){
     final data = json.decode(response.body);
     return data['results'];
   } else {
     throw Exception('Erro ao carregar filmes');
   }
  }
}