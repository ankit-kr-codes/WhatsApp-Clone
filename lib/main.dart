import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/features/Calls/presentation/calls.dart';
import 'package:whatsapp_clone/features/Chat/presentation/chat.dart';
import 'package:whatsapp_clone/features/Communities/presentation/communities.dart';
import 'dart:ui';

import 'package:whatsapp_clone/features/Update/presentation/updates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter _router = GoRouter(
    initialLocation: "/chats",
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child); // Persistent Layout
        },
        routes: [
          GoRoute(path: "/chats", builder: (context, state) => const Chat()),
          GoRoute(
            path: "/updates",
            builder: (context, state) => const Updates(),
          ),
          GoRoute(
            path: "/communities",
            builder: (context, state) => const Communities(),
          ),
          GoRoute(path: "/calls", builder: (context, state) => const Calls()),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Clone',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          surface: AppColors.white,
        ),
        fontFamily: "Helvetica",
      ),
      routerConfig: _router,
    );
  }
}

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  final List<String> _routes = ["/chats", "/updates", "/communities", "/calls"];
  final List<String> _titles = ["WhatsApp", "Updates", "Communities", "Calls"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(
            fontWeight:
                _selectedIndex != 0 ? FontWeight.normal : FontWeight.w600,
            color:
                _selectedIndex != 0
                    ? AppColors.darkGrey
                    : AppColors.primaryGreen,
            fontSize: 24,
          ),
        ),
        actions: [
          const Icon(Icons.qr_code, size: 24),
          const SizedBox(width: 10),

          if (_selectedIndex == 0 || _selectedIndex == 3)
            const Icon(Icons.camera_alt_outlined, size: 24),

          if (_selectedIndex == 1) const Icon(Icons.search, size: 24),

          const SizedBox(width: 10),
          const Icon(Icons.more_vert, size: 24),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        useLegacyColorScheme: false,
        selectedItemColor: AppColors.primaryGreen,
        unselectedLabelStyle: const TextStyle(color: AppColors.black),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: AppColors.darkGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          context.go(_routes[index]);
        },
        items: const [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(Icons.chat_outlined),
          ),
          BottomNavigationBarItem(
            label: "Updates",
            icon: Icon(Icons.donut_large),
          ),
          BottomNavigationBarItem(
            label: "Communities",
            icon: Icon(Icons.groups_outlined),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(Icons.call_outlined),
          ),
        ],
      ),
    );
  }
}
