import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan untuk mengimpor halaman home Anda

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool _isFormVisible = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isFormVisible = true;
      });
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with gradient and light overlay
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade900, Colors.blueGrey.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Animated Login Form aligned to top (start)
          FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 100), // Padding from the top and sides
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligning to the start
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 40), // Space between title and form
                    _buildTextInput(
                      hint: 'Username',
                      icon: Icons.person_outline,
                    ),
                    SizedBox(height: 20),
                    _buildTextInput(
                      hint: 'Password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        // Forgot password logic
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Perform login action
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => home()), // Navigasi ke halaman home setelah login
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.blueGrey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: Colors.blueGrey.shade400,
                        elevation: 10,
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextInput({required String hint, required IconData icon, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[300]),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[300]),
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
