import 'package:flutter/cupertino.dart';
import 'package:istore/models/product.model.dart';

class ProductDetailComponent extends StatelessWidget {
  final ProductModel product;

  const ProductDetailComponent({
    super.key,
    required this.product,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
            left: 40,
            right: 40,
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFE1E1E1),
                    ),
                  ),
                ),
                child: const Text(
                  'Product Description',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Text(
                  product.desc,
                  style: const TextStyle(
                    height: 1.4,
                    color: Color(0xFF505050),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Color(0xFFE1E1E1),
                    ),
                  ),
                ),
                child: CupertinoButton(
                  minSize: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      12,
                    ),
                    bottomRight: Radius.circular(
                      12,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Close',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
