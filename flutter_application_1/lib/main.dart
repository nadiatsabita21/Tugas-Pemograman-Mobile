import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 1 PM',
      theme: ThemeData(primarySwatch: Colors.blue), 
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Column & Row'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              _buildHeader(),
              const SizedBox(height: 20),

              
              Expanded(
                child: isWide ? _buildWideLayout() : _buildNarrowLayout(),
              ),

              const SizedBox(height: 20),

              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.dashboard, size: 32, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard Contoh',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Layout',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Tambah'),
        ),
      ],
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Column(
            children: [
              _buildCard(title: 'Profil', height: 140),
              const SizedBox(height: 12),
              Expanded(
                child: _buildCard(title: 'Menu', content: _buildMenuList()),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          flex: 5,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildStatCard('Users', '1.234')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildStatCard('Sales', '567')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildStatCard('Visits', '8.901')),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _buildCard(
                  title: 'List Item',
                  content: _buildItemList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        _buildCard(title: 'Profil', height: 120),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildStatCard('Users', '1.234')),
            const SizedBox(width: 8),
            Expanded(child: _buildStatCard('Sales', '567')),
            const SizedBox(width: 8),
            Expanded(child: _buildStatCard('Visits', '8.901')),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: _buildCard(title: 'List Item', content: _buildItemList()),
        ),
        const SizedBox(height: 12),
        _buildCard(title: 'Menu', content: _buildMenuList(), height: 120),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text('© 2025 Contoh Aplikasi')),
        TextButton(onPressed: () {}, child: const Text('Help')),
        const SizedBox(width: 8),
        ElevatedButton(onPressed: () {}, child: const Text('Logout')),
      ],
    );
  }

  Widget _buildCard({required String title, Widget? content, double? height}) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 138, 138),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: content ?? const Center(child: Text('Nadia113')),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [Icon(Icons.trending_up, size: 16)],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    final menu = ['Dashboard', 'Users', 'Settings', 'Reports', 'Help'];
    return ListView.separated(
      itemCount: menu.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, idx) {
        return ListTile(
          leading: CircleAvatar(child: Text(menu[idx][0])),
          title: Text(menu[idx]),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildItemList() {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (context, i) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.article),
            title: Text('Item #${i + 1}'),
            subtitle: const Text('Deskripsi singkat item.'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right),
            ),
          ),
        );
      },
    );
  }
}