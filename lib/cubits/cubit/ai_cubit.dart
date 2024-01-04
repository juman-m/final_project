import 'package:bloc/bloc.dart';
import 'package:final_project/cubits/cubit/ai_state.dart';
import 'package:final_project/networking/networking_ai.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(AiState(chatMessages: [], isLoading: false));

  void sendMessage(String message) async {
    emit(AiState(chatMessages: state.chatMessages, isLoading: true));

    final answerGpt = await Networking().connectGpt(msg: message);

    final newChatMessages = [
      ...state.chatMessages,
      AiData(title: message, isUser: true),
      AiData(title: answerGpt, isUser: false),
    ];

    emit(AiState(chatMessages: newChatMessages, isLoading: false));
  }
}

