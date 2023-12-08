part of 'messge_provider.dart';

class MessageNotifier extends Notifier<BaseState> {
  TextEditingController myQuery = TextEditingController();
  List<MessageEntity> messageList = [];
  late OpenAI openAI;
  Future<CompleteResponse?>? translateFuture;

  @override
  BaseState build() {
    openAI = OpenAI.instance.build(
      token: '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',
      baseOption: HttpSetup(),
      enableLog: true,
    );
    return const BaseState();
  }

  void sendQuery() async {
    MessageEntity myRequest = MessageEntity(
      user: 'user',
      message: myQuery.text.toString(),
    );
    messageList.insert(0, myRequest);
    final request = CompleteText(
      prompt: myQuery.text,
      maxTokens: 200,
      model: TextDavinci3Model(),
    );

    myQuery.text = '';
    state = state.copyWith(
      status: BaseStatus.initial,
    );
    translateFuture = openAI.onCompletion(request: request);
    try {
      CompleteResponse? completeResponse = await translateFuture;

      if (completeResponse != null && completeResponse.choices.isNotEmpty) {
        String response = completeResponse.choices.last.text ?? '';

        List<String> lines = response.split('\n');
        if (lines.length > 2) {
          lines = lines.sublist(2);
          response = lines.join('\n');
        }

        MessageEntity chatGPTResponse = MessageEntity(
          user: 'ChatGPT',
          message: response,
        );
        messageList.insert(0, chatGPTResponse);
        state = state.copyWith(
          status: BaseStatus.success,
        );
        Log.debug(response);
      } else {
        state = state.copyWith(
          status: BaseStatus.failure,
          error: 'Something went wrong',
        );
      }
    } catch (error) {
      state = state.copyWith(
        status: BaseStatus.failure,
        error: error.toString(),
      );
    }
  }
}
