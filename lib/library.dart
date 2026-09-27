import 'package:flutter/material.dart';

import 'models/book_models.dart';
import 'book_detail.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          BookModel book = bookList[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: book),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: book.imageUrl.startsWith('http')
                        ? Image.network(
                            book.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            book.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      book.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Text(book.author),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
