import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/gaps.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/size_extension.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../l10n/localizations_utils.dart';
import '../../../utils/widget/submit_button_widget.dart';
import '../../../utils/widget/text_input_widget.dart';
import '../provider/auth_notifier.dart';
import '../provider/auth_provider.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginContent();
  }
}

class LoginContent extends ConsumerWidget {
  LoginContent({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authNotifierProvider.notifier);
    final state = ref.watch(authNotifierProvider);
    
    ref.listen(authNotifierProvider.select((value) => value), (oldState, state) {
      if (state.userStatus == UserStatus.success) {
        context.router.replaceAll([const ChatRoute()]);
        notifier.resetAfterSubmit();
      } else if (state.userStatus == UserStatus.failure) {
        context.showSnackBarMessage(state.error ?? appLocalizations.lblUnableSignup);
        notifier.resetAfterSubmit();
      }
    });
    return Scaffold(
      body: Center(
          child: Padding(
            padding: Gaps.large.paddingHorizontal,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appLocalizations.appName, style: header1.copyWith(color: ColorScheme.of(context).primary)),
                    Gaps.larger.spaceVertical,
                    Text(
                      appLocalizations.lblLogin,
                      style: header1.copyWith(fontSize: 16),
                    ),
                    Align(
                      child: Text(
                        appLocalizations.lblEnterPassword,
                        style: body1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.larger.spaceVertical,
                    TextInputWidget(
                      controller: _emailController,
                      hintText: appLocalizations.hintYourEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return appLocalizations.lblEmailRequire;
                        } else if (!EmailValidator.validate(value)) {
                          return appLocalizations.lblValidEmail;
                        }
                        return null;
                      },
                    ),
                    Gaps.larger.spaceVertical,
                    TextInputWidget(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: appLocalizations.hintYourPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return appLocalizations.lblRequirePassword;
                        } else if (value.length < 6) {
                          return appLocalizations.lblPasswordLength;
                        }
                        return null;
                      },
                    ),
                    Gaps.larger.spaceVertical,
                    SubmitButtonWidget(
                        titleColor: ColorScheme.of(context).surface,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            notifier.login( _emailController.text,
                              _passwordController.text);
                          }
                        },
                        title: appLocalizations.btnLogin,
                        backgroundColor: ColorScheme.of(context).primary,
                        isLoading: state.userStatus == UserStatus.loading),
                    Constants.sizedBoxHeightMiddle.spaceVertical,
                    Text(appLocalizations.lblSignUp,
                        style: header1.copyWith(fontSize: 16)),
                    const SizedBox(height: Gaps.medium),
                    Text(appLocalizations.lblNotYetRegistered, style: body1),
                    Gaps.large.spaceVertical,
                    SubmitButtonWidget(
                      titleColor: ColorScheme.of(context).primary,
                      onPressed: () {
                        context.router.push(const SignupRoute());
                      },
                      title: appLocalizations.lblSignUp,
                      backgroundColor: ColorScheme.of(context).onPrimary,
                      borderColor: ColorScheme.of(context).primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
