import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white
      ),
      child: const Center(child: Row(
        children: [
          Icon(Icons.search,color: Colors.grey,),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Food',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
