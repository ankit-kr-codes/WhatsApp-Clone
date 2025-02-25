import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/features/Home/data/user_data.dart';
import 'package:whatsapp_clone/features/Home/domain/filters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filterList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryGreen,
            fontSize: 24,
          ),
        ),
        actions: [
          const Icon(Icons.qr_code, size: 24),
          const SizedBox(width: 25),
          const Icon(Icons.camera_alt_outlined, size: 24),
          const SizedBox(width: 25),
          const Icon(Icons.more_vert, size: 24),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 25, right: 5),
                  child: Icon(Icons.search),
                ),
                hintText: "Search...",
                fillColor: AppColors.grey,
                hoverColor: AppColors.grey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: filterList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filterList[index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color:
                            selectedFilter == filterList[index]
                                ? AppColors.secondaryGreen
                                : AppColors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          filterList[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color:
                                selectedFilter == filterList[index]
                                    ? AppColors.darkGreen
                                    : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: userList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: InteractiveViewer(
                                  panEnabled: false,
                                  minScale: 0.5,
                                  maxScale: 2,
                                  child: SizedBox(
                                    width: 350,
                                    height: 350,
                                    child: Image.asset(
                                      userList[index].imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              userList[index].imagePath,
                              fit: BoxFit.cover,
                              height: 60,
                              width: 60,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.4,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userList[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userList[index].message,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: mediaQuery.width * 0.1),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(userList[index].date),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        useLegacyColorScheme: false,
        selectedItemColor: AppColors.primaryGreen,
        unselectedLabelStyle: const TextStyle(color: AppColors.black),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: AppColors.darkGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        // iconSize: 30,
        items: [
          const BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(Icons.chat_outlined),
          ),
          const BottomNavigationBarItem(
            label: "Updates",
            icon: Icon(Icons.donut_large),
          ),
          const BottomNavigationBarItem(
            label: "Communities",
            icon: Icon(Icons.groups_outlined),
          ),
          const BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(Icons.call_outlined),
          ),
        ],
      ),
    );
  }
}
