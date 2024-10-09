import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  final String genre;

  const MovieCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 280,
          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            )
          )
    ),
        Container(height: 16),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        Text(
          genre,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          rating,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }
}
