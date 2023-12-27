

class AiData {
  final String title;
  final bool isUser;

  AiData({required this.title, required this.isUser});
}

class AiState {
  final List<AiData> chatMessages;
  final bool isLoading;

  AiState({
    required this.chatMessages,
    required this.isLoading,
  });


}
