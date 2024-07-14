// import 'package:flutter/material.dart';
// import 'package:odoo_bug_busters/book_front.dart';
// import 'package:odoo_bug_busters/home_page.dart';
// import 'package:odoo_bug_busters/input_user_details.dart';
// import 'package:odoo_bug_busters/profileperson.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Library Management System',
//       theme: ThemeData( 
//         primarySwatch: Colors.blue,
//       ),
//       home: LibraryPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(BookLibraryApp());
}

class BookLibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookLibraryScreen(),
    );
  }
}

class BookLibraryScreen extends StatefulWidget {
  @override
  _BookLibraryScreenState createState() => _BookLibraryScreenState();
}

class _BookLibraryScreenState extends State<BookLibraryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genres'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: 'Fantasy'),
            Tab(text: 'Non-Fiction'),
            Tab(text: 'Drama'),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildBookList(),
                _buildBookList(),
                _buildBookList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement your navigation logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextScreen()),
                );
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What would you like to read?',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildBookList() {
    final books = [
      {
        'title': 'Harry Potter and the Philosopher\'s Stone',
        'date': '04-11-2001',
        'rating': 5,
        'image': 'assets/meal_icon.png',
      },
      {
        'title': 'Harry Potter and the Goblet of Fire',
        'date': '08-07-2000',
        'rating': 5,
        'image': 'assets/meal_icon.png',
      },
    ];

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                book['image'] as String,
                fit: BoxFit.cover,
                width: 50,
                height: 70,
              ),
            ),
            title: Text(book['title'] as String),
            subtitle: Text(book['date'] as String),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: List.generate(
                    book['rating'] as int,
                    (index) => const Icon(Icons.star, color: Colors.yellow, size: 20),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: book),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final Map<String, dynamic> book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title'] as String),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  book['image'] as String,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              book['title'] as String,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Release Date: ${book['date'] as String}'),
            SizedBox(height: 8),
            Row(
              children: List.generate(
                book['rating'] as int,
                (index) => const Icon(Icons.star, color: Colors.yellow, size: 20),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Book description goes here...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('This is the next screen.'),
      ),
    );
  }
}
