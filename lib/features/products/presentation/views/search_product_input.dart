import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SearchProductInputView extends StatefulWidget {
  
  const SearchProductInputView({super.key});

  @override
  State<SearchProductInputView> createState() => _SearchProductInputViewState();
}

class _SearchProductInputViewState extends State<SearchProductInputView> {

  TextEditingController controller = TextEditingController();
  bool showIcon = false;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child       : TextFormField(
        controller: controller,
        onEditingComplete: () {
          context.push('/products/search-product');
        },
        onChanged: (value) {
          setState(() {
            showIcon = value.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search your product',
          fillColor: Colors.grey.shade100,
          filled   : true,
          border  : InputBorder.none,
          prefixIcon: const Icon( Icons.search_outlined),
          suffixIcon: showIcon ? IconButton(
            onPressed: () {

              setState(() {
                showIcon = false;
                controller.clear();
              });
            },
            icon: const Icon( Icons.close_rounded )
          ) : null,
        ),
      ),
    ).animate().fadeIn( duration: const Duration( milliseconds: 400 ) );
  }
}