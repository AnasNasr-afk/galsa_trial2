import 'package:flutter/material.dart';
import 'package:galsa_trial2/core/helpers/spacing.dart';
import 'package:galsa_trial2/core/widgets/app_text_form_field.dart';
import 'package:galsa_trial2/features/add_post_screen/cubit/add_post_cubit.dart';

import '../../../core/theming/text_styles.dart';

class AddPostFormField extends StatelessWidget {
  const AddPostFormField({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddPostCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          AppTextFormField(
            inputTextStyle: TextStyles.font16BlackRegular,
              hintText: 'Item Name',
              controller: cubit.titleController,
              backgroundColor : Colors.white,
            validator: (value){
                if( value == null || value.isEmpty){
                  return 'Enter a valid item name';
                }
              } ,
          ),
          verticalSpacing(20),
          AppTextFormField(
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: cubit.priceController,
              hintText: 'Item Price',
              prefixText: '\$',
              backgroundColor : Colors.white,
              textInputType: TextInputType.number,
              validator: (value){
                if( value == null || value.isEmpty){
                  return 'Enter a valid item price';
                }
              }),
          verticalSpacing(20),
          AppTextFormField(
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: cubit.descriptionController,
              hintText: 'Item Description',
              backgroundColor : Colors.white,
              validator: (value){
                if( value == null || value.isEmpty){
                  return 'Enter a valid item description';
                }
              }),
          verticalSpacing(20),
          AppTextFormField(
              inputTextStyle: TextStyles.font16BlackRegular,
              controller: cubit.addressController,
              hintText: 'Item Address',
              backgroundColor : Colors.white,
              validator: (value){
                if( value == null || value.isEmpty){
                  return 'Enter a valid item address';
                }
              }),
          verticalSpacing(20),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
