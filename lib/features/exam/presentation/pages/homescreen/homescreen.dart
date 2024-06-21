import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: Text(
                  'Welcome to my Coding Exam',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 50, 101, 188),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('API Integration'),
              ),
            ),
            Image.asset('asset/images/awsprofile.png'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 58, 110, 153),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Text(
              'Powered by inventi.ph',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
