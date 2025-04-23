import 'package:flutter/material.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tampilPassword = true;

  Color primaryColor = Colors.deepPurple;
  Color backgroundColor = Colors.lightBlue[50]!;

  void showPassword() {
    setState(() {
      tampilPassword = !tampilPassword;
    });
  }

  void goToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Icon(Icons.lock_outline, size: 80, color: primaryColor),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "masukkan email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: tampilPassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "masukkan password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          tampilPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: showPassword,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: goToProfile,
                    child: const Text("Masuk"),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: showPassword,
                    child: Text(
                      tampilPassword
                          ? "Tampilkan Password"
                          : "Sembunyikan Password",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color selectedColor = Colors.deepPurple[50]!;

  final Map<String, Color> colorOptions = {
    'Ungu': Colors.deepPurple[50]!,
    'Kuning': Colors.yellow[100]!,
    'Biru': Colors.blue[100]!,
    'Putih': Colors.white,
    'Pink': Colors.pink[100]!,
  };

  String selectedColorName = 'Ungu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor,
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang di Halaman Profil!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 30),
            DropdownButton<String>(
              value: selectedColorName,
              onChanged: (value) {
                setState(() {
                  selectedColorName = value!;
                  selectedColor = colorOptions[value]!;
                });
              },
              items: colorOptions.keys.map((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text("Ganti Background: $key"),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
