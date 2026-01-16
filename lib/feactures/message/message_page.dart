import 'package:auto_route/auto_route.dart';
import 'package:app_fishing/extensions/context.dart';
import 'package:app_fishing/feactures/message/bloc/bloc_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class MessagePage extends StatefulWidget {
  const MessagePage({
    @PathParam('id') required this.idPerson,
    super.key,
  });

  ///
  final String idPerson;

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final SupabaseClient supabase = Supabase.instance.client;

  void _onSendMessage(String? v, BuildContext context) {
    context.read<BlocMessage>().add(
      BlocMessageSendMessagesEvent(
        text: _controller.text,
        idPerson: widget.idPerson,
      ),
    );
    _controller.clear();
    _hacerScrollAlFinal();
  }

  // @override
  // void didUpdateWidget(covariant MessagePage oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   context.read<BlocMessage>().add(
  //     BlocMessageLoadMessagesEvent(idPerson: widget.idPerson),
  //   );
  //   context.read<BlocMessage>().add(
  //     BlocMessageGetMessagesEvent(idPerson: widget.idPerson),
  //   );
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _hacerScrollAlFinal();
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _hacerScrollAlFinal() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final supabase = context.supabase;
    final user = supabase.auth.currentUser;

    return BlocProvider(
      create: (context) => BlocMessage(supabase: supabase)
        ..add(BlocMessageGetMessagesEvent(idPerson: widget.idPerson))
        ..add(BlocMessageHearMessagesEvent(idPerson: widget.idPerson)),
      child: BlocBuilder<BlocMessage, BlocMessageState>(
        builder: (context, state) {
          if (state is BlocMessageStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BlocMessageStateError) {
            return Center(child: Text(state.errorMessage));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  key: ValueKey(state.messages.length),
                  controller: _scrollController,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final msg = state.messages[index];
                    final esMio = msg.user_id == user?.id;

                    return Align(
                      alignment: esMio
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: esMio ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(msg.text),
                      ),
                    );
                  },
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Escribe un mensaje...',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        onSubmitted: (v) => _onSendMessage(v, context),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => _onSendMessage(null, context),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
