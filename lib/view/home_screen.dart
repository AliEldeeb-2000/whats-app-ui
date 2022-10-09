import 'package:flutter/material.dart';
import 'package:whats_up_ui/view/calls_view.dart';
import 'package:whats_up_ui/view/chat%20list%20view.dart';
import 'package:whats_up_ui/view/setting.dart';
import 'package:whats_up_ui/view/status_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePageState();
}

var fabIcon = Icons.message;
late TabController tabController;

class _HomePageState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    tabController = TabController(initialIndex: 0, vsync: this, length: 4)
      ..addListener(() {
        switch (tabController.index) {
          case 0:
            fabIcon = Icons.camera_alt_outlined;
            break;
          case 1:
            fabIcon = Icons.chat;
            break;
          case 2:
            fabIcon = Icons.camera_alt_outlined;
            break;
          case 3:
            fabIcon = Icons.message;
            break;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            enabled: true,
            icon: const Icon(Icons.more_vert_outlined),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: GestureDetector(onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingScreen()),),
                child: const Text('new group') ),
              ),
              const PopupMenuItem(child: Text('linked Group')),
            ],
          ),
        ],
        title: const Text('Whats Up'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              child: Icon(Icons.camera_alt_outlined),
            ),
            Tab(child: Text('CHATS')),
            Tab(
              child: Text('STATUS'),
            ),
            Tab(
              child: Text('CALLS'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Icon(Icons.camera_alt),
          ChatListView(),
          StatusView(),
          CallsView()
        ],
      ),
    );
  }
}
