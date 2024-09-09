import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';

class DepartmentCardPlaceholderComponent extends StatelessWidget {
  const DepartmentCardPlaceholderComponent({
    super.key,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: const Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: FadeShimmer(
                width: 1,
                height: 1,
                radius: 12,
                fadeTheme: FadeTheme.light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
