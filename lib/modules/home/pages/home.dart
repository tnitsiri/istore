import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:istore/models/department.model.dart';
import 'package:istore/services/api.service.dart';
import 'package:istore/services/notify.service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // ANCHOR State
  late ApiService _apiService;

  List<DepartmentModel> _departments = [];
  bool _isFetching = true;

  // ANCHOR Fetch departments
  Future<bool> _fetchDepartments() async {
    bool isSuccess = false;

    try {
      Response response = await _apiService.dio.get(
        'departments',
      );

      List<DepartmentModel> departments = (response.data as List).map(
        (data) {
          return DepartmentModel.fromJson(
            data,
          );
        },
      ).toList();

      if (mounted) {
        setState(() {
          _departments = departments;
        });
      }

      isSuccess = true;
    } on DioException catch (_) {
      if (mounted) {
        NotifyService.toast(
          context,
          message: 'Unable to fetch departments list.',
        );
      }
    } catch (_) {
      if (mounted) {
        NotifyService.toast(
          context,
          message: 'Unable to fetch departments list.',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isFetching = false;
        });
      }
    }

    return isSuccess;
  }

  // ANCHOR On refresh
  Future<void> _onRefresh() async {
    await _fetchDepartments();
  }

  // ANCHOR Providers
  void _providers() {
    _apiService = Provider.of<ApiService>(
      context,
      listen: false,
    );
  }

  // ANCHOR Init state
  @override
  void initState() {
    _providers();
    _fetchDepartments();

    super.initState();
  }

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Department',
            ),
          ),
          if (!_isFetching) ...[
            CupertinoSliverRefreshControl(
              onRefresh: _onRefresh,
            ),
          ],
          SliverToBoxAdapter(
            child: Text(
              'Number of departnebts: ${_departments.length}',
            ),
          ),
        ],
      ),
    );
  }
}
