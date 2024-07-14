import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Example of using a professional font
      ),
      home: BookDetailsScreen(),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final String bookTitle = 'Build and Sustain a Career in Engineering';
  final String author = 'Anindya Chatterjee';
  final String publishedDate = '2021-02-14';
  final double rating = 2.0;
  final int ratingsCount = 1;
  final String description =
      '"A must read for students standing at the edge of choosing their careers, and for others to look back and help the next generation." Dr. Vijay Patel, Technology Director, Flight control laws LCA, IFCS, ADA Bangalore. "An excellent collection of personal experiences and a narrative interspersed with real advice, opinions and actionable insights that can guide generations. A must read." Rajat Jain, business mentor for early stage startups, ex MD, Xerox India and Walt Disney India. "This remarkable book works at many levels. At one, it is a lucidly explained guide that, with the lightest of touch, hand-holds and empowers students to prepare them for what lies beyond the classroom. At another, it is a veritable manual for our work and life. As technology reshapes both, the book offers invaluable insight into what each means and how we can better navigate the increasingly permeable walls between the two." Raj Kamal Jha, engineer, journalist, novelist, and Chief Editor of The Indian Express. Blurb: Many career advice books are written by senior managers and entrepreneurs for senior managers and entrepreneurs. Other career advice books are written by people whose career consists of giving career advice. This book is written for young engineers by an engineering professor who is currently engaged in teaching and research. The book emphasizes a long-term view. Engineering is not learned in four years. If you are alert, and keep learning and integrating ideas along the way, then you slowly build up a type of understanding that newcomers cannot match. This helps you build a sustainable career. Do not be distracted by the apparent success of a few people who seem to take shortcuts. For most people, statistics will apply. For most people, and therefore probably for you as well, success will be more likely if you develop long term value.';
  final List<String> genres = ['Technology & Engineering'];
  final String imageUrl =
      'http://books.google.com/books/content?id=SLEcEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue.shade200, Colors.blue.shade400],
                ),
              ),
              child: Center(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                  width: 180,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookTitle,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    author,
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Published: $publishedDate',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 30,
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    children: genres.map((genre) {
                      return Chip(
                        label: Text(genre),
                        backgroundColor: Colors.blue[100],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle add to my books button press
                      },
                      child: Text(
                        'Add to My Books',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
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
