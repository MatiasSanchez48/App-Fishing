import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/feactures/create_social/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateSocialPage extends StatefulWidget {
  const CreateSocialPage({super.key});

  @override
  State<CreateSocialPage> createState() => _CreateSocialPageState();
}

class _CreateSocialPageState extends State<CreateSocialPage> {
  ///
  final PageController _controller = PageController();

  ///
  int currentStep = 0;

  ///
  void next() {
    if (currentStep < 2) {
      setState(() => currentStep++);
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      createPost();
    }
  }

  ///
  void back() {
    if (currentStep > 0) {
      setState(() => currentStep--);
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  ///
  void createPost() {
    debugPrint('Publicación creada');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => context.router.pop(),
              ),
              const SizedBox(width: 30),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Publication',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Paso ${currentStep + 1} de 3',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: Container(
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: currentStep >= index
                        ? Colors.blue
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            }),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                StepMedia(),
                StepDetails(),
                StepConfirm(),
              ],
            ),
          ),
          Row(
            children: [
              if (currentStep > 0)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: back,
                  child: const SizedBox(
                    width: 150,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: next,
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      currentStep == 2 ? 'Create' : 'Next',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
