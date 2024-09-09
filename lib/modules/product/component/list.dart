import 'package:dio/dio.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:istore/models/department.model.dart';
import 'package:istore/models/product.model.dart';
import 'package:istore/modules/product/component/card/card.dart';
import 'package:istore/modules/product/component/card/placeholder.dart';
import 'package:istore/services/api.service.dart';
import 'package:istore/services/notify.service.dart';
import 'package:provider/provider.dart';

class ProductListComponent extends StatefulWidget {
  final DepartmentModel department;

  const ProductListComponent({
    super.key,
    required this.department,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return ProductListComponentState();
  }
}

class ProductListComponentState extends State<ProductListComponent> {
  // ANCHOR State
  late ApiService _apiService;

  List<ProductModel> _products = [];
  bool _isFetching = true;

  // ANCHOR Refetch
  Future<bool> refetch() async {
    return await _fetch();
  }

  // ANCHOR Fetch
  Future<bool> _fetch() async {
    bool isSuccess = false;

    try {
      Response response = await _apiService.dio.get(
        'departments/${widget.department.id}/products',
      );

      List<ProductModel> products = (response.data as List).map(
        (data) {
          return ProductModel.fromJson(
            data,
          );
        },
      ).toList();

      if (mounted) {
        setState(() {
          _products = products;
        });
      }

      isSuccess = true;
    } on DioException catch (_) {
      if (mounted) {
        NotifyService.toast(
          context,
          message: 'Unable to fetch products list.',
        );
      }
    } catch (_) {
      if (mounted) {
        NotifyService.toast(
          context,
          message: 'Unable to fetch products list.',
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
    _fetch();

    super.initState();
  }

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    EdgeInsets padding = EdgeInsets.only(
      top: 10,
      bottom: MediaQuery.of(context).padding.bottom > 0
          ? MediaQuery.of(context).padding.bottom
          : 12,
      left: 12,
      right: 12,
    );

    if (_isFetching) {
      return SliverPadding(
        padding: padding,
        sliver: SliverDynamicHeightGridView(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2,
          itemCount: 10,
          builder: (
            BuildContext context,
            int index,
          ) {
            return ProductCardPlaceholderComponent(
              key: ValueKey(
                index,
              ),
            );
          },
        ),
      );
    }

    return SliverPadding(
      padding: padding,
      sliver: SliverDynamicHeightGridView(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        itemCount: _products.length,
        builder: (
          BuildContext context,
          int index,
        ) {
          ProductModel product = _products[index];

          return ProductCardComponent(
            key: ValueKey(
              product.id,
            ),
            product: product,
          );
        },
      ),
    );
  }
}
