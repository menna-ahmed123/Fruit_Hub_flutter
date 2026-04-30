import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/widgets/custom_home_app_par.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/bst_selling_Grid_view.dart';
import 'package:fruit_test_myself/core/widgets/search_text_field.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/bst_selling_header.dart';
import 'package:fruit_test_myself/feature/home/presentation/views/widgets/featured_list.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppPar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 20),
                FeaturedList(),
                 SizedBox(height: 16),
                 BstSellingHeader()
              ],
            ),
          ),

          //SliverToBoxAdapter(child: SizedBox(height: 16)),

          //SliverToBoxAdapter(child: BstSellingHeader()),

          //SliverToBoxAdapter(child: SizedBox(height: 16)),

          BstSellingGridView(), 
        ],
      ),
    );
  }
}
