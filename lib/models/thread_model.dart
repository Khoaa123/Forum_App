class ThreadModel {
  final int id;
  final String title;
  final String displayName;
  final int totalComments;
  final int viewCount;
  final String forumName;
  final bool isSticky;
  final String avatarUrl;
  final DateTime createdAt;

  final String tag;
  final String content;
  final List<Comment> comments;

  ThreadModel({
    required this.id,
    required this.title,
    required this.displayName,
    required this.totalComments,
    required this.viewCount,
    required this.forumName,
    required this.isSticky,
    required this.avatarUrl,
    required this.createdAt,
    required this.tag,
    required this.content,
    required this.comments,
  });

  factory ThreadModel.fromJson(Map<String, dynamic> json) {
    return ThreadModel(
      id: json['id'],
      title: json['title'],
      displayName: json['displayName'],
      totalComments: json['totalComments'],
      viewCount: json['viewCount'],
      forumName: json['forumName'],
      isSticky: json['isSticky'],
      avatarUrl: json['avatarUrl'] ??
          'https://res.cloudinary.com/dija8tzko/image/upload/v1721903149/Voz-Avatars/be46b1a8-f762-4ada-b847-2262eabc3241.png',
      createdAt: DateTime.parse(json['createdAt']),
      tag: json['tag'],
      content: json['content'],
      comments: (json['comments'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
    );
  }
}

class Comment {
  final int id;
  final String content;
  final DateTime createdAt;
  final String threadName;
  final String userName;
  final int? parentCommentId;
  final List<Comment> replies;
  final List<Reaction> reactions;

  Comment({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.threadName,
    required this.userName,
    this.parentCommentId,
    required this.replies,
    required this.reactions,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      threadName: json['threadName'],
      userName: json['userName'],
      parentCommentId: json['parentCommentId'],
      replies: (json['replies'] as List)
          .map((reply) => Comment.fromJson(reply))
          .toList(),
      reactions: (json['reactions'] as List)
          .map((reaction) => Reaction.fromJson(reaction))
          .toList(),
    );
  }
}

class Reaction {
  final int id;
  final int type;
  final String userName;
  final String userId;
  final DateTime createdAt;

  Reaction({
    required this.id,
    required this.type,
    required this.userName,
    required this.userId,
    required this.createdAt,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      id: json['id'],
      type: json['type'],
      userName: json['userName'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
