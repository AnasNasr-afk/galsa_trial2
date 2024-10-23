import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galsa_trial2/core/theming/color_manager.dart';
import 'package:galsa_trial2/features/add_post_screen/cubit/add_post_cubit.dart';
import 'package:galsa_trial2/features/add_post_screen/cubit/add_post_states.dart';
import 'package:galsa_trial2/features/add_post_screen/widgets/upload_text_button.dart';
import 'package:galsa_trial2/features/home_screen/home_screen.dart';
import '../../core/helpers/navigation.dart';
import 'widgets/add_photo_item.dart';
import 'widgets/add_post_form_field.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostStates>(
        listener: (context, state) {
          if (state is AddPostSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Post uploaded successfully!')),
            );
            Navigation.navigateTo(context, const HomeScreen());
          } else if (state is AddPostErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to upload post')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.lightGreen,
            appBar: AppBar(
              backgroundColor: ColorManager.lightGreen,
              title: const Text('Add New Post'),
            ),
            body: const Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AddPhotoItem(),
                    AddPostFormField(),
                    UploadTextButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
