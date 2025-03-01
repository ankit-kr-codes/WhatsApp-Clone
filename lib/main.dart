import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
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
      _preloadImages(context);
    });
  }

  void _preloadImages(BuildContext context) {
    List<String> images = [
      //Users
      'assets/image/Users/user1.webp',
      'assets/image/Users/user2.webp',
      'assets/image/Users/user3.webp',
      'assets/image/Users/user4.webp',
      'assets/image/Users/user5.webp',
      'assets/image/Users/user6.webp',
      'assets/image/Users/user7.webp',
      'assets/image/Users/user8.webp',
      'assets/image/Users/user9.webp',
      'assets/image/Users/user10.webp',
      'assets/image/Users/user11.webp',
      'assets/image/Users/user12.webp',
      'assets/image/Users/user13.webp',
      'assets/image/Users/user14.webp',
      'assets/image/Users/user15.webp',
      'assets/image/Users/user16.webp',

      //Status
      'assets/image/Status/cake.webp',
      'assets/image/Status/car_deal.webp',
      'assets/image/Status/google_hq.webp',
      'assets/image/Status/japan_streets.webp',
      'assets/image/Status/picnic.webp',
      'assets/image/Status/plane.webp',
      'assets/image/Status/school.webp',
      'assets/image/Status/stadium.webp',
      'assets/image/Status/streets_of_SF.webp',
      'assets/image/Status/theater.webp',

      //Channels
      'assets/image/Channels/amazon.webp',
      'assets/image/Channels/apple.webp',
      'assets/image/Channels/bbc.webp',
      'assets/image/Channels/google.webp',
      'assets/image/Channels/lg.webp',
      'assets/image/Channels/linux.webp',
      'assets/image/Channels/mcdonalds.webp',
      'assets/image/Channels/mercedes.webp',
      'assets/image/Channels/meta.webp',
      'assets/image/Channels/microsoft.webp',
      'assets/image/Channels/nike.webp',
      'assets/image/Channels/railway.webp',
      'assets/image/Channels/samsung.webp',
      'assets/image/Channels/tata.webp',
      'assets/image/Channels/tesla.webp',
      'assets/image/Channels/waymo.webp',
    ];

    for (String imagePath in images) {
      precacheImage(AssetImage(imagePath), context);
    }
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
