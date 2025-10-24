import 'package:flutter/material.dart';

void main() {
  runApp(const ModernProfileApp());
}

class ModernProfileApp extends StatelessWidget {
  const ModernProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Layout Flutter',
      debugShowCheckedModeBanner: false,
      home: const ModernProfilePage(),
    );
  }
}

class ModernProfilePage extends StatelessWidget {
  const ModernProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF81C4FF), Color(0xFFB388FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 600),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://png.pngtree.com/png-vector/20221128/ourlarge/pngtree-hand-drawing-cartoon-career-woman-png-image_6483657.png',
                      ),
                    ),
                    const SizedBox(height: 15),

                
                    const Text(
                      'Nadia Tsabita',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Text(
                      'Mahasiswa',
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.person_add_alt),
                          label: const Text('Follow'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.message),
                          label: const Text('Message'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blueAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        InfoCard(
                          icon: Icons.phone,
                          label: 'Telepon',
                          value: '0896-8078-3294',
                          color: Colors.green,
                        ),
                        InfoCard(
                          icon: Icons.email,
                          label: 'Email',
                          value: 'nadiatsabita@gmail.com',
                          color: Colors.redAccent,
                        ),
                        InfoCard(
                          icon: Icons.location_on,
                          label: 'Alamat',
                          value: 'Pasuruan,Bangil',
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 10),

                    
                    const Text(
                      '© 2025 | Desain Layout Row & Column',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}