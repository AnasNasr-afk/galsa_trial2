import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/navigation.dart';
import '../../core/theming/color_manager.dart';
import '../../core/theming/text_styles.dart';
import '../add_post_screen/add_post_screen.dart';
import '../add_post_screen/cubit/add_post_cubit.dart';
import '../add_post_screen/cubit/add_post_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddPostCubit.get(context);

    return BlocConsumer<AddPostCubit, AddPostStates>(
      listener: (context, state) {
        // Handle potential loading or error states here if needed
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigation.navigateTo(context, const AddPostScreen());
                },
                icon: const Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
            ],
            backgroundColor: ColorManager.lightGreen,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: state is AddPostLoadingState // Show loading state
                ? Center(child: CircularProgressIndicator())
                : cubit.posts.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sentiment_dissatisfied,
                    size: 50,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'No posts yet',
                    style: TextStyles.font18BlackMedium,
                  ),
                ],
              ),
            )
                : ListView.builder(
              itemCount: cubit.posts.length,
              itemBuilder: (context, index) {
                final post = cubit.posts[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(post.image as String),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          post.price ?? 'N/A', // Default to N/A if null
                          style: TextStyles.font22GreenBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post.title ?? 'Untitled', // Default to 'Untitled' if null
                          style: TextStyles.font18BlackMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post.location ?? 'No location', // Default to 'No location' if null
                          style: TextStyles.font16GreyRegular,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post.description ?? 'No description available', // Default if null
                          style: TextStyles.font14Black54Regular,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
