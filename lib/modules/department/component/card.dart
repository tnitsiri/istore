import 'package:flutter/cupertino.dart';
import 'package:istore/models/department.model.dart';

class DepartmentCardComponent extends StatelessWidget {
  final DepartmentModel department;

  const DepartmentCardComponent({
    super.key,
    required this.department,
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
            child: AspectRatio(
              aspectRatio: 1,
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                onPressed: () {},
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
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 15,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerRight,
                          child: Text(
                            department.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
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
        ],
      ),
    );
  }
}
