import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/features/Chat/data/user_data.dart';
import 'package:whatsapp_clone/features/Chat/domain/filters.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          cacheExtent: 1000,
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
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
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 30,
              child: ListView.builder(
                cacheExtent: 1000,
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
            const SizedBox(height: 25),

            ListView.builder(
              cacheExtent: 1000,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          child: Image.asset(
                                            userList[index].imagePath,
                                            isAntiAlias: true,
                                            gaplessPlayback: true,
                                            filterQuality: FilterQuality.high,
                                            height: 350,
                                            width: double.maxFinite,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          width: double.infinity,
                                          color: AppColors.semiTransparent,
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: Text(
                                            userList[index].name,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 60,
                                      color: AppColors.white,
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.message_outlined,
                                            color: AppColors.primaryGreen,
                                            size: 28,
                                          ),
                                          Icon(
                                            Icons.info_outline_rounded,
                                            color: AppColors.primaryGreen,
                                            size: 28,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                              isAntiAlias: true,
                              gaplessPlayback: true,
                              filterQuality: FilterQuality.high,
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
    );
  }
}
