class ChannelToFollowModel {
  String channelName;
  String channelProfilePic;
  double followers;
  bool isFollowed;

  ChannelToFollowModel({
    required this.channelName,
    required this.channelProfilePic,
    required this.followers,
    this.isFollowed = false,
  });
}
