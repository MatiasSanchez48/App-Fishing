import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateSocialPage extends StatefulWidget {
  const CreateSocialPage({super.key});

  @override
  State<CreateSocialPage> createState() => _CreateSocialPageState();
}

class _CreateSocialPageState extends State<CreateSocialPage> {
  final PageController _controller = PageController();
  int currentStep = 0;

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

  void back() {
    if (currentStep > 0) {
      setState(() => currentStep--);
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void createPost() {
    debugPrint("Publicación creada");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              TextButton(
                onPressed: back,
                child: const Text("Atrás"),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: next,
              child: Text(
                currentStep == 2 ? "Crear" : "Siguiente",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StepMedia extends StatelessWidget {
  const StepMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Paso 1: Media"));
  }
}

class StepDetails extends StatelessWidget {
  const StepDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Paso 2: Detalles"));
  }
}

class StepConfirm extends StatelessWidget {
  const StepConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Paso 3: Confirmar"));
  }
}
