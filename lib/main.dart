import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/asset_list.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/features/Calls/presentation/calls.dart';
import 'package:whatsapp_clone/features/Chat/presentation/chat.dart';
import 'package:whatsapp_clone/features/Communities/presentation/communities.dart';
import 'package:whatsapp_clone/features/Update/presentation/updates.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/chats",
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        observers: [HeroController()],
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: "/chats",
            pageBuilder:
                (context, state) => const NoTransitionPage(child: Chat()),
          ),
          GoRoute(
            path: "/updates",
            pageBuilder:
                (context, state) => const NoTransitionPage(child: Updates()),
          ),
          GoRoute(
            path: "/communities",
            pageBuilder:
                (context, state) =>
                    const NoTransitionPage(child: Communities()),
          ),
          GoRoute(
            path: "/calls",
            pageBuilder:
                (context, state) => const NoTransitionPage(child: Calls()),
          ),
        ],
      ),
    ],
  );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      preloadImages(context);
    });
  }

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
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.littleDarkGreen,
          foregroundColor: AppColors.white,
        ),
        fontFamily: "Helvetica",
      ),
      routerConfig: MyApp._router,
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
          const SizedBox(width: 10),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
      floatingActionButton:
          (_selectedIndex == 0)
              ? FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.message_rounded),
              )
              : (_selectedIndex == 1)
              ? FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add_a_photo_rounded),
              )
              : (_selectedIndex == 3)
              ? FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add_call),
              )
              : null,
    );
  }
}
