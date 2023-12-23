import 'package:diamart_commerce/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 42,
        margin: const EdgeInsets.only(left: 0),
        child: Material(
          borderRadius: BorderRadius.circular(7),
          elevation: 1,
          child: TextFormField(
            onFieldSubmitted: (value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScreen(searchQuery: value)));
            },
            decoration: InputDecoration(
              prefixIcon: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 6,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.shade700,
                    size: 23,
                  ),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(top: 10),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              hintText: 'Search Diamart',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
