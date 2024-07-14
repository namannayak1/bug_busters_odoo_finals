import 'package:finals_oddo/screens/user_books_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.lightBlueAccent],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Implement drawer functionality
          },
        ),
        title: const Center(
          child: Text(
            'Library Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Implement notifications functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3383CD), Color(0xFF11249F)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/images/Naman_pic.jpg'),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Naman Nayak',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'namannayak2003@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 1),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // User Details Section
            const Text(
              'User Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.black),
                      title: Text('Username', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('namannayak', style: TextStyle(fontSize: 18)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.black),
                      title: Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('namannayak2003@gmail.com', style: TextStyle(fontSize: 18)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.black),
                      title: Text('Contact Number', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('+91 9876543210', style: TextStyle(fontSize: 18)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.bookmark, color: Colors.black),
                      title: Text('Favorite Genre', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('Mystery', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Borrowed Books Section
            const Text(
              'Your Books',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  // Navigate to screen showing all borrowed books
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const YourBooksScreen()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.library_books, color: Colors.black),
                        title: Text('Borrowed Books', style: TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text('5', style: TextStyle(fontSize: 18)),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Preferences Section
            const Text(
              'Preferences',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.bookmark_border, color: Colors.black),
                      title: Text('Preferred Authors', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('Agatha Christie, J.K. Rowling', style: TextStyle(fontSize: 18)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.local_library, color: Colors.black),
                      title: Text('Reading Goals', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('Read 30 books this year', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Sign Out Section
            const Text(
              'Sign Out',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.black),
                    title: Text('Sign Out', style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

