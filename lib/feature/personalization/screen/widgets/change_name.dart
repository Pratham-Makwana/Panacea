import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utills/constants/sizes.dart';
import '../../../../utills/validation/validation.dart';
import '../../controller/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom AppBar
      appBar: AppBar(
        automaticallyImplyLeading: true,
        // showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headline
            Text(
              'Use real name for easy verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(
              height: TSizes.spaceBtwSection,
            ),

            /// TextFormField and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    expands: false,
                    controller: controller.username,
                    validator: (value) =>
                        TValidator.validateEmptyText('UserName', value),
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSection,
            ),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: const Text('Save')))
          ],
        ),
      ),
    );
  }
}
