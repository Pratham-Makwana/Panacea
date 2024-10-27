import 'package:cikitsakai/feature/personalization/screen/widgets/change_name.dart';
import 'package:cikitsakai/feature/personalization/screen/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/appbar.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../utills/constants/sizes.dart';
import '../controller/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Image
              // SizedBox(
              //   width: double.infinity,
              //   child: Column(
              //     children: [
              //       Obx(() {
              //         final networkImage = controller.user.value.profilePicture;
              //         final image =
              //         networkImage.isNotEmpty ? networkImage : TImages.user;
              //         return controller.imageUploading.value
              //             ? const TShimmerEffect(
              //           width: 80,
              //           height: 80,
              //           radius: 80,
              //         )
              //             : TCircularImage(
              //           image: image,
              //           width: 80,
              //           height: 80,
              //           isNetworkImage: networkImage.isNotEmpty,
              //         );
              //       }),
              //       TextButton(
              //           onPressed: () => controller.uploadUserProfilePicture(),
              //           child: const Text('Change Profile Picture'))
              //     ],
              //   ),
              // ),

              /// Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading Profile Info
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                title: 'Name',
                value: controller.user.value.username,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading Personal Information
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.username,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date Of Birth',
                value: '21 OCt, 1998',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Center(
                child: TextButton(
                  onPressed: (){},
                  // onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
