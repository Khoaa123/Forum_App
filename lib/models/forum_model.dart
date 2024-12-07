class ForumModel {
  final int id;
  final String name;
  final String? categoryName;
  final int threadCount;
  final int totalComments;
  final LatestThread? latestThread;

  ForumModel({
    required this.id,
    required this.name,
    this.categoryName,
    required this.threadCount,
    required this.totalComments,
    this.latestThread,
  });

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel(
      id: json['id'],
      name: json['name'],
      categoryName: json['categoryName'],
      threadCount: json['threadCount'],
      totalComments: json['totalComments'],
      latestThread: json['latestThread'] != null
          ? LatestThread.fromJson(json['latestThread'])
          : null,
    );
  }
}

class LatestThread {
  final int id;
  final String title;
  final String displayName;
  final String userId;
  final DateTime createdAt;
  final String avatarUrl;

  LatestThread({
    required this.id,
    required this.title,
    required this.displayName,
    required this.userId,
    required this.createdAt,
    required this.avatarUrl,
  });

  factory LatestThread.fromJson(Map<String, dynamic> json) {
    return LatestThread(
      id: json['id'],
      title: json['title'],
      displayName: json['displayName'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      avatarUrl: json['avatarUrl'],
    );
  }
}
