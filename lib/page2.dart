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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Muhammad Yazid Wiliadi';
  String school = 'SMK Wikrama Bogor';
  String about = 'Halo! Nama saya Yazid, seorang pemuda energik dari Kabupaten Bogor, Jawa Barat. Saya lahir di Padang pada tanggal 28 November 2006. Saat ini, saya masih bersekolah di SMK Wikrama Bogor dan sedang duduk di kelas 12.';
  String history = 'Saya memulai pendidikan dari SD di SDN Cisarua 1, kemudian melanjutkan ke PonPes Al Riyadl, dan saat ini sedang menempuh pendidikan di SMK Wikrama Bogor. Selama di Wikrama, saya telah mengerjakan berbagai proyek dan membangun portofolio.';
  String skills = 'PHP\nRuby\nJavascript';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(
                    name: name,
                    school: school,
                    about: about,
                    history: history,
                    skills: skills,
                  ),
                ),
              );

              if (result != null) {
                setState(() {
                  name = result['name'];
                  school = result['school'];
                  about = result['about'];
                  history = result['history'];
                  skills = result['skills'];
                });
              }
            },
          ),
        ],
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
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              school,
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
              content: about,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 16),
            buildInfoCard(
              context,
              icon: Icons.history_edu_outlined,
              title: 'History',
              content: history,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 16),
            buildInfoCard(
              context,
              icon: Icons.code_outlined,
              title: 'Skill',
              content: skills,
              backgroundColor: Colors.white,
            ),
          ],
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

class EditPage extends StatefulWidget {
  final String name;
  final String school;
  final String about;
  final String history;
  final String skills;

  const EditPage({
    Key? key,
    required this.name,
    required this.school,
    required this.about,
    required this.history,
    required this.skills,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController nameController;
  late TextEditingController schoolController;
  late TextEditingController aboutController;
  late TextEditingController historyController;
  late TextEditingController skillsController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    schoolController = TextEditingController(text: widget.school);
    aboutController = TextEditingController(text: widget.about);
    historyController = TextEditingController(text: widget.history);
    skillsController = TextEditingController(text: widget.skills);
  }

  @override
  void dispose() {
    nameController.dispose();
    schoolController.dispose();
    aboutController.dispose();
    historyController.dispose();
    skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField('Name', nameController),
            buildTextField('School', schoolController),
            buildTextField('About', aboutController, maxLines: 5),
            buildTextField('History', historyController, maxLines: 5),
            buildTextField('Skills', skillsController, maxLines: 3),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'school': schoolController.text,
                  'about': aboutController.text,
                  'history': historyController.text,
                  'skills': skillsController.text,
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
