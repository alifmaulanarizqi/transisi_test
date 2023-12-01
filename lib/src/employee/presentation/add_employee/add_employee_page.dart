import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../../../../common_ui/utils/colors/common_colors.dart';
import '../../../../common_ui/utils/text_style/common_text_style.dart';
import '../../../../common_ui/widgets/button/primary_button_text_only.dart';
import '../../../../common_ui/widgets/textfield/common_textfield.dart';
import '../list_employee/list_employee_page.dart';
import 'bloc/add_employee_bloc.dart';

class AddEmployeePage extends StatefulWidget {
  static const route = '/employee/add';

  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  late AddEmployeeBloc _bloc;
  final _inputFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController() ;
  final TextEditingController _jobController = TextEditingController() ;

  @override
  void initState() {
    super.initState();
    _bloc = AddEmployeeBloc(
        addEmployeeUseCase: GetIt.instance()
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _jobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: CommonColors.blueB5,
        title: Text(
          'Add Employee',
          style: CommonTypography.roboto20.copyWith(
              fontWeight: FontWeight.w600,
              color: CommonColors.white
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AddEmployeeBloc, AddEmployeeState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is AddEmployeeLoadingState) {
              _showLoading();
            } else if (state is AddEmployeeSuccessState) {
              _displayToast(
                message: 'Successfully add employee'
              );

              _nameController.clear();
              _jobController.clear();

              Future.delayed(const Duration(seconds: 1)).then((value) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  ListEmployeePage.route,
                      (route) => false,
                );
              });
            } else if (state is AddEmployeeFailedState) {
              _displayToast(
                  message: state.data.error?.message ?? ''
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _inputFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  CommonTextField(
                    label: 'Name',
                    hint: 'John Doe...',
                    controller: _nameController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    validators: const [
                      CommonTextFieldValidator.noEmpty,
                    ],
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    label: 'Job',
                    hint: 'Mechanic...',
                    controller: _jobController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    inputAction: TextInputAction.done,
                    validators: const [
                      CommonTextFieldValidator.noEmpty,
                    ],
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PrimaryButtonTextOnly(
                      textColor: Colors.white,
                      onTap: _onSubmit,
                      label: "Submit",
                      fontSize: 15,
                      backgroundColor: CommonColors.blueB5,
                      isActive: true,
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_inputFormKey.currentState?.validate() == true) {
      _bloc.add(
        AddEmployeeInitEvent(
          name: _nameController.text,
          job: _jobController.text,
        ),
      );
    }
  }

  void _displayToast({
    required String message
  }) {
    Navigator.of(context).pop();
    Fluttertoast.showToast(
        backgroundColor: CommonColors.whiteF8,
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: CommonColors.black21,
        fontSize: 16.0
    );
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
}