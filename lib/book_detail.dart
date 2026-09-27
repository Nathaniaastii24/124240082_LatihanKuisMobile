import 'package:flutter/material.dart';

import 'models/book_models.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            book.imageUrl.startsWith('http')
                ? Image.network(
                    book.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    book.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  ),

            const SizedBox(height: 20),

            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text('Penulis: ${book.author}'),
            Text('Tahun terbit: ${book.year}'),
            Text('Genre: ${book.genre}'),
            Text('Penerbit: ${book.publisher}'),
            Text('Jumlah halaman: ${book.pages}'),
            Text('Rating: ${book.rating}'),

            const SizedBox(height: 20),

            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(book.description),
          ],
        ),
      ),
    );
  }
}
