import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/src/employee/presentation/add_employee/add_employee_page.dart';
import 'package:flutter_bloc_basic/src/employee/presentation/detail_employee/arg/detail_employee_arg.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../common_ui/utils/colors/common_colors.dart';
import '../../../../common_ui/utils/text_style/common_text_style.dart';
import '../detail_employee/detail_employee_page.dart';
import 'bloc/list_employee_bloc.dart';

class ListEmployeePage extends StatefulWidget {
  static const route = '/employee';

  const ListEmployeePage({Key? key}) : super(key: key);

  @override
  State<ListEmployeePage> createState() => _ListEmployeePageState();
}

class _ListEmployeePageState extends State<ListEmployeePage> {
  late ListEmployeeBloc _bloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _bloc = ListEmployeeBloc(listEmployeeUseCase: GetIt.instance())
      ..add(const ListEmployeeInitEvent(
          page: 1));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
  }

  void _onScroll() async {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      if (_bloc.stateData.employeeDto.length <
          _bloc.stateData.total) {
        _bloc.isLoadingPagination = true;
        _bloc.add(ListEmployeeInitEvent(
            page: _bloc.stateData.page + 1),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: CommonColors.blueB5,
        title: Text(
          'List Employee',
          style: CommonTypography.roboto20.copyWith(
            fontWeight: FontWeight.w600,
            color: CommonColors.white
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocConsumer<ListEmployeeBloc, ListEmployeeState>(
            bloc: _bloc,
            listener: (context, state) {},
            builder: (context, state) {
              if(state is ListEmployeeFailedState) {
                return Column(
                  children: [
                    _buildFailedListEmployee(state: state),
                    ElevatedButton(
                      onPressed: () {
                        _bloc.add(const ListEmployeeInitEvent(
                          page: 1,
                        ));
                      },
                      child: const Text('Refresh'),
                    ),
                  ],
                );
              } else if (state is ListEmployeeLoadingState) {
                return _buildShimmerLoading();
              } else if (state is ListEmployeeEmptyState) {
                return _buildEmptyListEmployee(state: state);
              }

              return _buildListEmployee(state: state);
            }
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddEmployeePage.route,
          );
        },
        backgroundColor: CommonColors.blue9F,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 30,
          color: CommonColors.white,
        ),
      ),
    );
  }

  Widget _buildListEmployee({
    required ListEmployeeState state,
  }) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: state.data.employeeDto.length,
      itemBuilder: (context, index) {
        bool lastIndex = index == _bloc.stateData.total - 1;

        if(index < _bloc.stateData.employeeDto.length - 1 || lastIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailEmployeePage.route,
                arguments: DetailEmployeeArg(
                    id: state.data.employeeDto[index].id
                ),
              );
            },
            child: Card(
              color: CommonColors.whiteFB,
              elevation: 1,
              child: Row(
                children: [
                  SizedBox(
                    height: 130,
                    width: 100,
                    child: Image.network(
                      state.data.employeeDto[index].avatar,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${state.data.employeeDto[index].firstName} ${state.data.employeeDto[index].lastName}',
                          style: CommonTypography.roboto16,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'email: ${state.data.employeeDto[index].email}',
                          style: CommonTypography.roboto16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if(_bloc.stateData.employeeDto.length != _bloc.stateData.total) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return const SizedBox.shrink();
      }
    );
}

  Widget _buildFailedListEmployee({
    required ListEmployeeState state,
  }) {
    return Expanded(
        child: Center(
          child: Text(
            'Request Failed: ${state.data.error?.message}',
            style: CommonTypography.roboto16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        )
    );
  }

  Widget _buildEmptyListEmployee({
    required ListEmployeeState state,
  }) {
    return Expanded(
        child: Center(
          child: Text(
            'There is no employee',
            style: CommonTypography.roboto16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        )
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if(index == 0)
                const SizedBox(
                  height: 12,
                ),
              Shimmer.fromColors(
                baseColor: CommonColors.greyD1,
                highlightColor: CommonColors.greyBD,
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: CommonColors.greyD1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          );
        }
    );
  }
}