import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/model/navbar_model.dart';

class PrimaryNavBar extends StatelessWidget {
  const PrimaryNavBar({
    super.key,
    required this.index,
    required this.data,
    this.onTap,
  });

  final int index;
  final List<NavbarModel> data;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: index,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.getColor(ColorKey.primary70),
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: data.asMap().entries.map((e) {
          final selected = index == e.key;
          return BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Icon(
                    selected ? Icons.circle : Icons.circle_outlined,
                    color: selected
                        ? AppColors.getColor(ColorKey.primary70)
                        : AppColors.getColor(ColorKey.grey50),
                  ),
                  if (e.value.title != null)
                    Text(
                      e.value.title!,
                      style: AssetStyles.pXs.copyWith(
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w400,
                        color: selected
                            ? AppColors.getColor(ColorKey.primary70)
                            : AppColors.getColor(ColorKey.grey50),
                      ),
                    )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
