import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    Key? key,
    required this.onChanged,
    required this.searchHint,
    required this.onSubmit,
    required this.initValue,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmit;
  final String searchHint;
  final String initValue;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _searchController;

  void _onSearchChanged() {
    widget.onChanged(_searchController.text);
  }

  void _onSearchSubmit(String value) {
    widget.onSubmit(value);
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initValue);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.blueAccent,
          width: 1.3,
        ),
      ),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: widget.searchHint,
                  border: InputBorder.none,
                ),
                onSubmitted: _onSearchSubmit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
