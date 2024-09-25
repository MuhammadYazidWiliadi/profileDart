import 'package:flutter/material.dart';

void main() {
  runApp(Page2());
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'profile-pic',
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.jpeg'),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Muhammad Yazid Wiliadi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'SMK Wikrama Bogor',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 24),
              buildInfoCard(
                context,
                icon: Icons.person_outline,
                title: 'About',
                content:
                    'Halo! Nama saya Yazid, seorang pemuda energik dari Kabupaten Bogor, Jawa Barat. Saya lahir di Padang pada tanggal 28 November 2006. Saat ini, saya masih bersekolah di SMK Wikrama Bogor dan sedang duduk di kelas 12.',
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 16),
              buildInfoCard(
                context,
                icon: Icons.history_edu_outlined,
                title: 'History',
                content:
                    'Saya memulai pendidikan dari SD di SDN Cisarua 1, kemudian melanjutkan ke PonPes Al Riyadl, dan saat ini sedang menempuh pendidikan di SMK Wikrama Bogor. Selama di Wikrama, saya telah mengerjakan berbagai proyek dan membangun portofolio.',
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 16),
              buildInfoCard(
                context,
                icon: Icons.code_outlined,
                title: 'Skill',
                content: 'PHP\nRuby\nJavascript',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    required Color backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.amber, size: 28),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
            height: 16,
            indent: 0,
            endIndent: 0,
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
