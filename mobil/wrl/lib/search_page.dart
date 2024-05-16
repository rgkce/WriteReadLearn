import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<String> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WRL Search Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  searchQuery: searchQuery,
                  searchResults: searchResults,
                  onQueryChanged: (query) {
                    setState(() {
                      searchQuery = query;
                      searchResults = [];
                      // Filter the search results based on the new query
                      // ...
                    });
                  },
                  onItemSelected: (result) {
                    setState(() {
                      searchResults.add(result);
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (query) {
                    setState(() {
                      searchQuery = query;
                      // Filter the search results based on the new query
                      // ...
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                      searchQuery: searchQuery,
                      searchResults: searchResults,
                      onQueryChanged: (query) {
                        setState(() {
                          searchQuery = query;
                          searchResults = [];
                          // Filter the search results based on the new query
                          // ...
                        });
                      },
                      onItemSelected: (result) {
                        setState(() {
                          searchResults.add(result);
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final String searchQuery;
  final List<String> searchResults;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<String> onItemSelected;

  CustomSearchDelegate({
    required this.searchQuery,
    required this.searchResults,
    required this.onQueryChanged,
    required this.onItemSelected,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          onQueryChanged('');
        },
      ),
    ];
  }

// Footer

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
