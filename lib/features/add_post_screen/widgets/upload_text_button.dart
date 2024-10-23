import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theming/text_styles.dart';
import '../cubit/add_post_cubit.dart';
import '../cubit/add_post_states.dart';

class UploadTextButton extends StatelessWidget {
  const UploadTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostCubit, AddPostStates>(
      listener: (context, state) {
        if (state is AddPostSuccessState) {
          // Handle success feedback to the user
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Post uploaded successfully!')),
          );
        } else if (state is AddPostErrorState) {
          // Handle error feedback to the user
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to upload post.')),
          );
        }
      },
      builder: (context, state) {
        final cubit = AddPostCubit.get(context);

        return TextButton(
          onPressed: state is! AddPostLoadingState // Prevent multiple uploads
              ? () {
            if (cubit.imageFile == null) {
              debugPrint('No image selected');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No image selected!')),
              );
              return;
            }

            // Start the post creation
            cubit.createPost(
              image: cubit.imageFile!,
              price: cubit.priceController.text,
              title: cubit.titleController.text,
              address: cubit.addressController.text,
              description: cubit.descriptionController.text,
            );
          }
              : null, // Disable button during upload
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(190, 50),
            ),
          ),
          child: state is AddPostLoadingState
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(), // Show loading indicator during upload
          )
              : Text(
            'Upload',
            style: TextStyles.font25BlackMedium,
          ),
        );
      },
    );
  }
}
