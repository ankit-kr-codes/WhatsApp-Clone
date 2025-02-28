enum Status { incoming, outgoing }

enum Respond { received, declined }

enum Type { voiceCall, videoCall }

class RecentCalls {
  final Status lastCallStatus;
  final Type lastCallType;
  final Respond callAction;
  String imagePath;
  String name;
  String lastCallDate;

  RecentCalls({
    required this.name,
    required this.imagePath,
    required this.lastCallStatus,
    required this.lastCallType,
    required this.lastCallDate,
    required this.callAction,
  });
}
