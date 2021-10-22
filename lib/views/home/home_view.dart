import 'package:famlicious_app/views/auth/login_view.dart';
import 'package:famlicious_app/views/chat/chat_view.dart';
import 'package:famlicious_app/views/favourite/favourite_view.dart';
import 'package:famlicious_app/views/profile/profile_view.dart';
import 'package:famlicious_app/views/timeline/timeline_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  int _currentIndex = 0;
  final List<Widget> _views = [
    const TimelineView(),
    const ChatView(),
    const FavouriteView(),
    const ProfileView()
  ];

  @override
  void initState() {
    // TODO: implement initState
    isUserAuth();
    super.initState();
  }

  isUserAuth() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _firebaseAuth.currentUser == null
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            // body: _views[_currentIndex],
            body: IndexedStack(
              children: _views,
              index: _currentIndex,
            ),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                selectedItemColor: Theme.of(context).iconTheme.color,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(UniconsLine.history), label: 'Timeline'),
                  BottomNavigationBarItem(
                      icon: Icon(UniconsLine.comment_dots), label: 'Chats'),
                  BottomNavigationBarItem(
                      icon: Icon(UniconsLine.heart_alt), label: 'Favourite'),
                  BottomNavigationBarItem(
                      icon: Icon(UniconsLine.user_md), label: 'Profile'),
                ]),
          );
  }
}
