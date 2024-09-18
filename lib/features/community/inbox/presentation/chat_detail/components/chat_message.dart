class ChatMessage {
  final String text;
  final DateTime timeDate;
  final bool isCurrentUser;

  ChatMessage({
    required this.text,
    required this.timeDate,
    required this.isCurrentUser,
  });
}

List<ChatMessage> dummyMessages = [
  ChatMessage(
    text: "Hey, how are you?",
    timeDate: DateTime.now().subtract(const Duration(minutes: 5)),
    isCurrentUser: true,
  ),
  ChatMessage(
    text: "I'm good, thanks! How about you?",
    timeDate: DateTime.now().subtract(const Duration(minutes: 3)),
    isCurrentUser: false,
  ),
  ChatMessage(
    text: "I'm doing well too.",
    timeDate: DateTime.now().subtract(const Duration(minutes: 2)),
    isCurrentUser: true,
  ),
  ChatMessage(
    text: "Great to hear!",
    timeDate: DateTime.now().subtract(const Duration(minutes: 1)),
    isCurrentUser: false,
  ),
  ChatMessage(
    text: "Catch up later?",
    timeDate: DateTime.now(),
    isCurrentUser: true,
  ),
];
