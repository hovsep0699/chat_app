import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/gaps.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/date_time_extension.dart';
import '../../../../core/extensions/random_extension.dart';
import '../../../../core/extensions/size_extension.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../domain/entities/chat/chat_entity.dart';
import '../../../../l10n/localizations_utils.dart';
import '../../../../resources/assets/assets.gen.dart';
import '../../../utils/widget/simple_app_bar_widget.dart';
import '../../../utils/widget/text_input_widget.dart';
import '../../auth/provider/auth_notifier.dart';
import '../../auth/provider/auth_provider.dart';
import '../provider/chat_notifier.dart';
import '../provider/chat_provider.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatContent();
  }
}

class ChatContent extends ConsumerWidget {
  const ChatContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final chatNotifier = ref.read(chatNotifierProvider.notifier);
    final state = ref.watch(chatNotifierProvider);
    final authState = ref.watch(authNotifierProvider);
    // return const CustomGoogleMap(
    //   center: LatLng(50, 50),
    //   markerHeight: 32,
    //   markerWidth: 32,
    //   markerIconUrl: 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/Vfs2TrX1YcYjsm2UcxI2/assets/njvods72h5xe/Location.png',
    // );
    ref.listen(authNotifierProvider.select((value) => value), (oldState, state) {
      if (state.status == AuthStatus.unauthenticated) {
        context.router.replaceAll([const LoginRoute()]);
      }
    });
    ref.listen(chatNotifierProvider.select((value) => value), (oldState, state) {
      if (state.status == ChatStatus.failure) {
        context.showSnackBarMessage(state.error ?? appLocalizations.unknownErrorMessage);
      }
    });
    return Scaffold(
      appBar: SimpleAppBarWidget(
        onTrailingPress: () => authNotifier.logout(),
      ),
      body: Center(
        child: Padding(
          padding: (Gaps.large + Gaps.small).paddingHorizontal,
          child: Column(
            children: [
              Gaps.large.spaceVertical,
              TextInputWidget(
                  prefix: Assets.icons.search.svg(
                      colorFilter: const ColorFilter.mode(darkGreyN, BlendMode.srcIn),
                      height: 40,
                      width: 40),
                  controller: TextEditingController(),
                  hintText: 'Search',
                  onChanged: (value) => chatNotifier.searchChat(value)),
              Gaps.larger.spaceVertical,
              if (state.filteredChats.isEmpty)
                const SizedBox.shrink()
              else
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = state.filteredChats[index];
                      return Padding(
                        padding: Gaps.small.paddingVertical,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: index == 0
                                      ? const BorderSide(width: 2, color: defaultListTileColor)
                                      : BorderSide.none,
                                  bottom: const BorderSide(width: 2, color: defaultListTileColor))),
                          child: ListTile(
                            isThreeLine: true,
                            trailing: Text(chat.lastUpdate?.formatRelative ?? '',
                                style:
                                    body3.copyWith(fontWeight: FontWeight.w500, color: darkGreyN)),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Random().randomColor, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                '${chat.participants[0].firstname[0]}${chat.participants[0].lastname[0]}',
                                style: body1.copyWith(color: white),
                              )),
                            ),
                            title: Text(
                              '${chat.participants[0].firstname} ${chat.participants[0].lastname} ',
                              style: body1.copyWith(color: defaultTextColor),
                            ),
                            subtitle: RichText(
                                text: TextSpan(children: [
                              if (chat.messages.isNotEmpty &&
                                  chat.messages.last.sender.id == authState.user!.id)
                                TextSpan(
                                    text: 'Me: ', style: body1.copyWith(color: defaultTextColor)),
                              TextSpan(
                                  text: chat.messages.isNotEmpty
                                      ? chat.messages.last.message
                                      : 'No messages',
                                  style: body1.copyWith(color: darkGreyN)),
                            ])),
                            onTap: () {
                              chatNotifier.selectChat(chat.id);
                              // context.read<ChatBloc>().add(ChatEvent.getCh)
                              chatNotifier.getMessages(chat.id);
                              context.router.push(const ChatDetailsRoute());
                              // Navigate to the chat details screen or open chat
                              // context.router.push(ChatDetailRoute(chatId: chat.id));
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Gaps.medium.spaceVertical,
              if (state.users.isEmpty)
                const SizedBox.shrink()
              else
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return Padding(
                        padding: Gaps.small.paddingVertical,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: index == 0
                                      ? const BorderSide(width: 2, color: defaultListTileColor)
                                      : BorderSide.none,
                                  bottom: const BorderSide(width: 2, color: defaultListTileColor))),
                          child: ListTile(
                            isThreeLine: true,
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Random().randomColor, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                '${user.firstname[0]}${user.lastname[0]}',
                                style: body1.copyWith(color: white),
                              )),
                            ),
                            title: Text(
                              '${user.firstname} ${user.lastname}',
                              style: body1.copyWith(color: defaultTextColor),
                            ),
                            subtitle: RichText(
                                text: TextSpan(children: [
                              TextSpan(text: 'New Chat', style: body1.copyWith(color: darkGreyN)),
                            ])),
                            onTap: () {
                              chatNotifier.createChat(ChatEntity(
                                  id: '',
                                  participants: [user],
                                  lastUpdate: DateTime.now(),
                                  messages: []));
                              // context.router.push(ChatDetailRoute(chatId: chat.id));
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
