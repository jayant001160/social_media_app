import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/followers_bloc/followers_bloc.dart';
import '../../logic/blocs/followers_bloc/followers_event.dart';
import '../../logic/blocs/followers_bloc/followers_state.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/followers_repository.dart';  // Import the repository

class FollowersScreen extends StatelessWidget {
  final String userId;

  const FollowersScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers'),
      ),
      body: BlocProvider(
        create: (context) => FollowersBloc(
          followersRepository: FollowersRepository(),  // Provide the repository here
        )..add(FetchFollowersRequested(userId: userId)),
        child: BlocBuilder<FollowersBloc, FollowersState>(
          builder: (context, state) {
            if (state is FollowersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FollowersLoaded) {
              if (state.followers.isEmpty) {
                return const Center(child: Text('No followers found.'));
              }
              return ListView.builder(
                itemCount: state.followers.length,
                itemBuilder: (context, index) {
                  final follower = state.followers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(follower.profileImageUrl),
                    ),
                    title: Text(follower.name),
                    subtitle: Text(follower.email),
                    onTap: () {
                      // Navigate to follower's profile
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        // Implement remove follower functionality here
                      },
                    ),
                  );
                },
              );
            } else if (state is FollowersError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
