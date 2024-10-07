import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  final String animation;

  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const TAnimationLoaderWidget(
      {super.key,
      required this.animation,
      required this.text,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * .8),
          const SizedBox(
            height: 24,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: const Color(0xFFF6F6F6)),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
