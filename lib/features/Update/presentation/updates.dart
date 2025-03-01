import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/features/Update/data/channel_data.dart';
import 'package:whatsapp_clone/features/Update/data/channels_to_follow_data.dart';
import 'package:whatsapp_clone/features/Update/data/status_data.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        cacheExtent: 1000,
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          //Status Section
          const Text(
            "Status",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              cacheExtent: 1000,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: statusList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatusView(statusList[index]);
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            statusList[index].statusImagePath,
                            isAntiAlias: true,
                            gaplessPlayback: true,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 120,
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.semiTransparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  statusList[index].profilePicPath,
                                  isAntiAlias: true,
                                  gaplessPlayback: true,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              Text(
                                statusList[index].name,
                                style: const TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Channels",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.darkGrey,
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.primaryGreen,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            cacheExtent: 1000,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: channelList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        channelList[index].channelProfilePic,
                        isAntiAlias: true,
                        gaplessPlayback: true,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            channelList[index].channelName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            channelList[index].message,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: mediaQuery.width * 0.1),
                    Text(
                      channelList[index].date,
                      style: const TextStyle(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "Channels to follow",
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
            itemCount: channelToFollowList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        channelToFollowList[index].channelProfilePic,
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
                            channelToFollowList[index].channelName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${channelToFollowList[index].followers}M followers",
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          channelToFollowList[index].isFollowed =
                              !channelToFollowList[index].isFollowed;
                        });
                      },
                      style: const ButtonStyle(
                        elevation: WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.secondaryGreen,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          channelToFollowList[index].isFollowed
                              ? "Followed"
                              : "Follow",
                          style: const TextStyle(
                            color: AppColors.littleDarkGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 160,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.white,
                  side: const BorderSide(color: AppColors.littleGrey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Explore more",
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Status View
class StatusView extends StatefulWidget {
  final dynamic status;

  const StatusView(this.status, {super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.black,
          title: Text(
            widget.status.name,
            style: const TextStyle(color: AppColors.white, fontSize: 20),
          ),
          actions: [const Icon(Icons.more_vert), const SizedBox(width: 10)],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(10),
                  value: _controller.value,
                  backgroundColor: AppColors.darkGrey,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.white,
                  ),
                );
              },
            ),
          ),
        ),
        body: Container(
          color: AppColors.black,
          alignment: Alignment.center,
          child: Image.asset(
            widget.status.statusImagePath,
            isAntiAlias: true,
            gaplessPlayback: true,
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
