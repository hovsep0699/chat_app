import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/gaps.dart';
import '../../../../core/extensions/size_extension.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../resources/assets/assets.gen.dart';
import '../../../utils/widget/simple_app_bar_widget.dart';
import '../../../utils/widget/text_input_widget.dart';
import '../../auth/provider/auth_provider.dart';
import '../provider/chat_provider.dart';

@RoutePage()
class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatDetailsContent();
  }
}

class ChatDetailsContent extends ConsumerWidget {
  ChatDetailsContent({super.key});

  final TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(chatNotifierProvider.notifier);
    final state = ref.watch(chatNotifierProvider);
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: SimpleAppBarWidget(
        title: Text(
                '${state.currentChat?.participants[0].firstname ?? ''} ${state.currentChat?.participants[0].lastname ?? ''}'),
        onLeadingPress: (_) {
          notifier.selectChat('');
          context.router.maybePop();
        },
        leadingIcon: Assets.icons.arrowLeftS
            .svg(colorFilter: ColorFilter.mode(ColorScheme.of(context).tertiary, BlendMode.srcIn)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                    itemCount: state.currentMessages.length,
                    itemBuilder: (context, index) {
                      final message = state.currentMessages[index];
                      return Align(
                          alignment: message.sender.id == authState.user!.id
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child:
                              Text(message.message, style: body1.copyWith(color: defaultTextColor)));
                    },
                  ),
                ),
              ),
          Padding(
            padding: Gaps.large.paddingBottom + Gaps.large.paddingHorizontal,
            child: TextInputWidget(
                controller: _typeController,
                hintText: 'message',
                onSubmit: (value) {
                  notifier.sendMessage(
                       _typeController.text, state.selectedChatId!);
                },
              ),
            ),
        ],
      ),
    );
  }
}
