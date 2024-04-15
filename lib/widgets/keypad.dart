import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  final Function(String) onKeyPressed;
  final VoidCallback onClearPressed;
  final VoidCallback onBackspacePressed;
  final bool hasDecimalPoint;

  const Keypad({
    super.key,
    required this.onKeyPressed,
    required this.onClearPressed,
    required this.onBackspacePressed,
    required this.hasDecimalPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: onClearPressed, icon: const Icon(Icons.delete)),
            // KeyButton(
            //   label: '',
            //   onPressed: () {},
            // ),
            IconButton(
                onPressed: onBackspacePressed,
                icon: const Icon(Icons.remove_circle_sharp)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KeyButton(
              label: '7',
              onPressed: () => onKeyPressed('7'),
            ),
            KeyButton(
              label: '8',
              onPressed: () => onKeyPressed('8'),
            ),
            KeyButton(
              label: '9',
              onPressed: () => onKeyPressed('9'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KeyButton(
              label: '4',
              onPressed: () => onKeyPressed('4'),
            ),
            KeyButton(
              label: '5',
              onPressed: () => onKeyPressed('5'),
            ),
            KeyButton(
              label: '6',
              onPressed: () => onKeyPressed('6'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KeyButton(
              label: '1',
              onPressed: () => onKeyPressed('1'),
            ),
            KeyButton(
              label: '2',
              onPressed: () => onKeyPressed('2'),
            ),
            KeyButton(
              label: '3',
              onPressed: () => onKeyPressed('3'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // KeyButton(
            //   label: '',
            //   onPressed: () {},
            // ),
            KeyButton(
              label: '0',
              onPressed: () => onKeyPressed('0'),
            ),
            KeyButton(
              label: '.',
              onPressed: hasDecimalPoint ? () {} : () => onKeyPressed('.'),
            ),
          ],
        ),
      ],
    );
  }
}

class KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const KeyButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
