import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.mic),
                color: Colors.grey,
              ),
            ),
            enableSuggestions: true,
        ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Dialog(
                child: Column(
                  children: [
                    const Text('Filter'),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text('Apply'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.filter_list )
          ),
        ],
      ),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
