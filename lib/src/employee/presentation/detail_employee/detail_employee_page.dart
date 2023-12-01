import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common_ui/utils/colors/common_colors.dart';
import '../../../../common_ui/utils/text_style/common_text_style.dart';
import '../../../../core/utils/value_extension.dart';
import 'arg/detail_employee_arg.dart';
import 'bloc/detail_employee_bloc.dart';

class DetailEmployeePage extends StatefulWidget {
  static const route = '/employee/detail';

  const DetailEmployeePage({Key? key}) : super(key: key);

  @override
  State<DetailEmployeePage> createState() => _DetailEmployeePageState();
}

class _DetailEmployeePageState extends State<DetailEmployeePage> {
  late DetailEmployeeBloc _bloc;

  int _employeeId = 0;

  @override
  void initState() {
    super.initState();

    _bloc = DetailEmployeeBloc(detailEmployeeUseCase: GetIt.instance());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var args = cast<DetailEmployeeArg>(
      ModalRoute.of(context)?.settings.arguments,
    );
    var animeId = args?.id ?? 0;
    _employeeId = animeId;

    _bloc.add(DetailEmployeeInitEvent(id: _employeeId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.blueB5,
        title: Text(
          'Detail Employee',
          style: CommonTypography.roboto20.copyWith(
              fontWeight: FontWeight.w600,
              color: CommonColors.white
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<DetailEmployeeBloc, DetailEmployeeState>(
          bloc: _bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if(state is DetailEmployeeFailedState) {
              return Column(
                children: [
                  _buildFailedDetailEmployee(state: state),
                  ElevatedButton(
                    onPressed: () {
                      _bloc.add(DetailEmployeeInitEvent(
                        id: _employeeId,
                      ));
                    },
                    child: const Text('Refresh'),
                  ),
                ],
              );
            } else if (state is DetailEmployeeLoadingState) {
              return _buildShimmerLoading();
            }

            return _buildDetailEmployee(state: state);
          },
        ),
      ),
    );
  }

  Widget _buildDetailEmployee({
    required DetailEmployeeState state,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPhotoProfile(
            url: state.data.employeeDto.avatar,
            fullName: '${state.data.employeeDto.firstName} ${state.data.employeeDto.lastName}'
          ),
          const SizedBox(
            height: 18,
          ),
          _buildCard(
            label: 'First Name',
            cardValue: state.data.employeeDto.firstName,
            icon: Icons.first_page_rounded
          ),
          const SizedBox(
            height: 4,
          ),
          _buildCard(
              label: 'Last Name',
              cardValue: state.data.employeeDto.lastName,
              icon: Icons.last_page_rounded
          ),
          const SizedBox(
            height: 4,
          ),
          _buildCard(
            label: 'Email',
            cardValue: state.data.employeeDto.email
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoProfile({
    required String url,
    required String fullName,
  }) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 260,
          color: CommonColors.blueB5,
        ),
        Positioned(
          bottom: 80,
          child: ClipOval(
            child: Image.network(
              url,
              fit: BoxFit.cover,
              width: 130,
              height: 130,
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
        ),
        Positioned(
          bottom: 30,
          child: Text(
            fullName,
            style: CommonTypography.roboto20.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: CommonColors.white
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String label,
    required String cardValue,
    IconData? icon = Icons.email_rounded
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Card(
        color: CommonColors.whiteFB,
        elevation: 1,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                icon,
                size: 35,
                color: CommonColors.blue9F,
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardValue,
                    style: CommonTypography.roboto16.copyWith(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    label,
                    style: CommonTypography.roboto14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFailedDetailEmployee({
    required DetailEmployeeState state,
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

  Widget _buildShimmerLoading() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                color: CommonColors.blueB5,
              ),
              Positioned(
                bottom: 80,
                child: Shimmer.fromColors(
                  baseColor: CommonColors.greyD1,
                  highlightColor: CommonColors.greyBD,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: const BoxDecoration(
                      color: CommonColors.greyD1,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Shimmer.fromColors(
                  baseColor: CommonColors.greyD1,
                  highlightColor: CommonColors.greyBD,
                  child: Container(
                    height: 30,
                    width: 250,
                    color: CommonColors.greyD1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Shimmer.fromColors(
              baseColor: CommonColors.greyD1,
              highlightColor: CommonColors.greyBD,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: CommonColors.greyD1,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Shimmer.fromColors(
              baseColor: CommonColors.greyD1,
              highlightColor: CommonColors.greyBD,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: CommonColors.greyD1,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Shimmer.fromColors(
              baseColor: CommonColors.greyD1,
              highlightColor: CommonColors.greyBD,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: CommonColors.greyD1,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}