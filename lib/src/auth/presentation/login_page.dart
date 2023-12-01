import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/common_ui/utils/colors/common_colors.dart';
import 'package:flutter_bloc_basic/common_ui/widgets/button/primary_button_text_only.dart';
import 'package:flutter_bloc_basic/src/auth/presentation/bloc/login_bloc.dart';
import 'package:flutter_bloc_basic/src/employee/list_employee/presentation/list_employee.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../../common_ui/utils/text_style/common_text_style.dart';
import '../../../common_ui/widgets/textfield/common_textfield.dart';
import '../../../core/data/local/app_preferences.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _bloc;
  final _inputFormKey = GlobalKey<FormState>();
  AppPreferences? _prefs;

  final TextEditingController emailController = TextEditingController() ;
  final TextEditingController passController = TextEditingController() ;

  bool _isShowPassword = false;

  @override
  void initState() {
    super.initState();
    _bloc = LoginBloc(
      preferences: GetIt.instance(),
      loginUseCase: GetIt.instance()
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _prefs = GetIt.instance<AppPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is LoginLoadingState) {
              _showLoading();
            } else if (state is LoginSuccessState) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                ListEmployeePage.route,
                    (route) => false,
              );
            } else if (state is LoginFailedState) {
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                  backgroundColor: CommonColors.whiteF8,
                  msg: state.data.error?.message ?? '',
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  textColor: CommonColors.black21,
                  fontSize: 16.0
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _inputFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 64),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login to Transisi",
                        style: CommonTypography.roboto18.copyWith(
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  CommonTextField(
                    label: 'Email',
                    hint: 'example@email.com',
                    controller: emailController,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    validators: const [
                      CommonTextFieldValidator.noEmpty,
                      CommonTextFieldValidator.email
                    ],
                  ),
                  const SizedBox(height: 24),
                  CommonTextField(
                    label: 'Password',
                    hint: '',
                    controller: passController,
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    inputAction: TextInputAction.done,
                    isObscureText: true,
                    isShowObscuredText: _isShowPassword,
                    onSuffixClick: onPasswordToggleClick,
                    validators: const [
                      CommonTextFieldValidator.noEmpty,
                    ],
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: PrimaryButtonTextOnly(
                      textColor: Colors.white,
                      onTap: _onLogin,
                      label: "Login",
                      fontSize: 15,
                      backgroundColor: CommonColors.blueB5,
                      isActive: true,
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }

  void _onLogin() {
    if (_inputFormKey.currentState?.validate() == true) {
      _bloc.add(
        LoginInitEvent(
            email: emailController.text,
            password: passController.text,
        ),
      );
    }
  }

  void _showLoading() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }

  void onPasswordToggleClick(bool isShow) {
    setState(() {
      _isShowPassword = isShow;
    });
  }
}