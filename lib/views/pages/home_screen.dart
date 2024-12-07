import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voz_app/view_models/category_view_model.dart';
import 'package:voz_app/views/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trang chủ'),
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFF183254),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF23497b),
                ),
                accountName: const Text(
                  'Tên người dùng',
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: const Text(
                  'user@example.com',
                  style: TextStyle(color: Colors.white70),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(
                      'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Color(0xFF8cb0de)),
                title: const Text(
                  'Trang chủ',
                  style: TextStyle(color: Color(0xFF8cb0de)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.category, color: Color(0xFF8cb0de)),
                title: const Text(
                  'Danh mục',
                  style: TextStyle(color: Color(0xFF8cb0de)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categories');
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.notifications, color: Color(0xFF8cb0de)),
                title: const Text(
                  'Thông báo',
                  style: TextStyle(color: Color(0xFF8cb0de)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
              ListTile(
                leading: const Icon(Icons.message, color: Color(0xFF8cb0de)),
                title: const Text(
                  'Tin nhắn',
                  style: TextStyle(color: Color(0xFF8cb0de)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/messages');
                },
              ),
              const Divider(color: Colors.white30),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF8cb0de)),
                title: const Text(
                  'Hồ sơ cá nhân',
                  style: TextStyle(color: Color(0xFF8cb0de)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF8cb0de)),
                title: const Text(
                  'Cài đặt',
                  style: TextStyle(color: Color(0xFF8cb0de)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Color(0xFF8cb0de)),
                title: const Text(
                  'Đăng xuất',
                  style: TextStyle(color: Color(0xFF8cb0de)),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Consumer<CategoryViewModel>(
          builder: (context, categoryViewModel, child) {
            if (categoryViewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (categoryViewModel.error != null) {
              return Center(child: Text('Error: ${categoryViewModel.error}'));
            } else {
              return ListView.builder(
                itemCount: categoryViewModel.categories.length,
                itemBuilder: (context, index) {
                  final category = categoryViewModel.categories[index];
                  return CategoryWidget(category: category);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
