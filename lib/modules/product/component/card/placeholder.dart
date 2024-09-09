import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';

class ProductCardPlaceholderComponent extends StatelessWidget {
  const ProductCardPlaceholderComponent({
    super.key,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AspectRatio(
              aspectRatio: 4 / 3,
              child: FadeShimmer(
                width: 1,
                height: 1,
                fadeTheme: FadeTheme.light,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 4,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: const FadeShimmer(
                width: 1,
                height: 12,
                radius: 5,
                fadeTheme: FadeTheme.light,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 7,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: FadeShimmer(
                      width: 1,
                      height: 12,
                      radius: 5,
                      fadeTheme: FadeTheme.light,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 4,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: const FadeShimmer(
                width: 1,
                height: 10,
                radius: 5,
                fadeTheme: FadeTheme.light,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 7,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: FadeShimmer(
                      width: 1,
                      height: 10,
                      radius: 5,
                      fadeTheme: FadeTheme.light,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 60,
                    child: Container(),
                  ),
                  const Expanded(
                    flex: 40,
                    child: FadeShimmer(
                      width: 1,
                      height: 14,
                      radius: 5,
                      fadeTheme: FadeTheme.light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
