import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

class AddCards extends StatelessWidget {
  const AddCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: 'Add Cards',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Component: IndexAddCardsContainer')],
        ),
      ),
    );
  }
}
