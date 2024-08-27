import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/search_bloc/search_bloc.dart';
import '../../logic/blocs/search_bloc/search_event.dart';
import '../../logic/blocs/search_bloc/search_state.dart';
import '../../data/models/user_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search users...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context.read<SearchBloc>().add(
                      SearchUsersRequested(query: _searchController.text.trim()),
                    );
                  },
                ),
              ),
              onSubmitted: (value) {
                context.read<SearchBloc>().add(
                  SearchUsersRequested(query: value.trim()),
                );
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchResultsLoaded) {
                    if (state.users.isEmpty) {
                      return const Center(child: Text('No users found.'));
                    }
                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.profileImageUrl),
                          ),
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          onTap: () {
                            // Navigate to user's profile or other actions
                          },
                        );
                      },
                    );
                  } else if (state is SearchNoResults) {
                    return const Center(child: Text('No users found.'));
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
