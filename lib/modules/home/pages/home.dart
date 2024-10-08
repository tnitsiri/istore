import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:istore/models/department.model.dart';
import 'package:istore/modules/department/component/card.dart';
import 'package:istore/modules/department/component/placeholder.dart';
import 'package:istore/modules/product/component/list.dart';
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
  final Map<String, GlobalKey<ProductListComponentState>> _productListKeys = {};

  late ApiService _apiService;

  List<DepartmentModel> _departments = [];
  bool _isFetching = true;

  DepartmentModel? _department;

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
    bool fetchDepartments = await _fetchDepartments();

    if (!fetchDepartments) {
      return;
    }

    if (_department != null) {
      if (_productListKeys[_department!.id] != null &&
          _productListKeys[_department!.id]!.currentState != null) {
        await _productListKeys[_department!.id]!.currentState!.refetch();
      }
    }
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
            if (_departments.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 0.4,
                    padEnds: false,
                    enableInfiniteScroll: false,
                    height: (MediaQuery.of(context).size.width / 2) - 20,
                  ),
                  itemCount: _departments.length,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    DepartmentModel department = _departments[itemIndex];

                    return DepartmentCardComponent(
                      key: ValueKey(
                        department.id,
                      ),
                      department: department,
                      onPressed: () {
                        if (mounted) {
                          setState(() {
                            if (_productListKeys[department.id] == null) {
                              _productListKeys[department.id] =
                                  GlobalKey<ProductListComponentState>();
                            }

                            _department = department;
                          });
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ] else ...[
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.4,
                  padEnds: false,
                  enableInfiniteScroll: false,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  height: (MediaQuery.of(context).size.width / 2) - 20,
                ),
                items: [1, 2, 3].map(
                  (int index) {
                    return DepartmentCardPlaceholderComponent(
                      key: ValueKey(
                        index,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
          if (_department != null) ...[
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  'Product list : ${_department!.name}',
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
            ProductListComponent(
              key: _productListKeys[_department!.id],
              department: _department!,
            ),
          ],
        ],
      ),
    );
  }
}
