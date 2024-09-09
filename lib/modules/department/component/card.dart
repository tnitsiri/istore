import 'package:flutter/cupertino.dart';
import 'package:istore/models/department.model.dart';

class DepartmentCardComponent extends StatelessWidget {
  final DepartmentModel department;
  final VoidCallback onPressed;

  const DepartmentCardComponent({
    super.key,
    required this.department,
    required this.onPressed,
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
      child: Row(
        children: [
          Expanded(
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
              child: AspectRatio(
                aspectRatio: 1,
                child: CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  onPressed: onPressed,
                  child: Stack(
                    children: [
                      LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            child: Image(
                              image: NetworkImage(
                                '${department.imageUrl}?departmentId=${department.id}',
                              ),
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 1,
                                horizontal: 7,
                              ),
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                              ),
                              child: Text(
                                department.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: CupertinoColors.black,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
