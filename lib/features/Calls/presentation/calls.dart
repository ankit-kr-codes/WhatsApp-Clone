import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/features/Calls/data/favourites_data.dart';
import 'package:whatsapp_clone/features/Calls/data/recent_call_data.dart';
import 'package:whatsapp_clone/features/Calls/domain/recent_calls.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        cacheExtent: 1000,
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Favourites",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.darkGrey,
                ),
              ),
              Text(
                "More",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            cacheExtent: 1000,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: favouritesData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        favouritesData[index].imagePath,
                        isAntiAlias: true,
                        gaplessPlayback: true,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        favouritesData[index].name,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),

                    const Wrap(
                      children: [
                        Icon(Icons.call_outlined, size: 28),
                        SizedBox(width: 25),
                        Icon(Icons.videocam_outlined, size: 28),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20),
          const Text(
            "Recent",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 15),
          ListView.builder(
            cacheExtent: 1000,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: recentCallList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        recentCallList[index].imagePath,
                        isAntiAlias: true,
                        gaplessPlayback: true,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recentCallList[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  recentCallList[index].callAction ==
                                          Respond.declined
                                      ? AppColors.red
                                      : AppColors.black,
                            ),
                          ),
                          Wrap(
                            children: [
                              Icon(
                                recentCallList[index].lastCallStatus ==
                                        Status.incoming
                                    ? Icons.call_received
                                    : Icons.call_made,

                                color:
                                    recentCallList[index].lastCallStatus ==
                                            Status.incoming
                                        ? AppColors.red
                                        : AppColors.primaryGreen,
                              ),
                              const SizedBox(width: 10),
                              Text(recentCallList[index].lastCallDate),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      recentCallList[index].lastCallType == Type.videoCall
                          ? Icons.videocam_outlined
                          : Icons.call_outlined,

                      size: 28,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
