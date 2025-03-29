import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // buat variable current user
  final user = FirebaseAuth.instance.currentUser;

  // buat fungsi signOut
  void signOut() async {
    await FirebaseAuth.instance.signOut();

  }


  String getUserName() {
  if (user?.displayName != null) {
    return user!.displayName!;
  } else {
    // Ambil nama dari email sebelum '@'
    return user?.email?.split('@')[0] ?? 'User';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(onPressed: (() => signOut()), icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hai! Welcome, ${getUserName()}', style: TextStyle(fontSize: 20)),
            Text('${user?.email}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
