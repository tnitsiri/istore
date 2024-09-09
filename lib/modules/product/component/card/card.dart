import 'package:flutter/cupertino.dart';
import 'package:istore/models/product.model.dart';

class ProductCardComponent extends StatefulWidget {
  final ProductModel product;

  const ProductCardComponent({
    super.key,
    required this.product,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return _ProductCardComponentState();
  }
}

class _ProductCardComponentState extends State<ProductCardComponent> {
  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints constraints,
            ) {
              return Image(
                image: NetworkImage(
                  '${widget.product.imageUrl}?productId=${widget.product.id}',
                ),
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 9,
            left: 10,
            right: 10,
          ),
          child: Text(
            widget.product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: CupertinoColors.black,
              letterSpacing: 0.3,
              height: 1.4,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 10,
          ),
          child: Text(
            widget.product.desc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.3,
              color: Color(0xFF505050),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 2,
            bottom: 9,
            left: 10,
            right: 10,
          ),
          child: Text(
            '฿${widget.product.price}',
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: CupertinoColors.black,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ],
    );

    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(
        12,
      ),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(
            12,
          ),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.05),
              offset: const Offset(0, 0),
              spreadRadius: 4,
              blurRadius: 8,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            12,
          ),
          child: child,
        ),
      ),
    );
  }
}
