import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        child: null,
      ),
    );
  }
}

// Column(
//       children: <Padding>[
//         Padding(padding: const EdgeInsets.only(top: 150), child: ElevatedButton(
//           onPressed: () => sendCommand('A'),
//           child: const Text("A")
//         )),
//         Padding(padding: const EdgeInsets.only(top: 10), child: ElevatedButton(
//           onPressed: () => sendCommand('B'),
//           child: const Text("B")
//         )),
//         Padding(padding: const EdgeInsets.only(top: 10), child: ElevatedButton(
//           onPressed: () => sendCommand('C'),
//           child: const Text("C")
//         )),
//         Padding(padding: const EdgeInsets.only(top: 10), child: ElevatedButton(
//           onPressed: () => sendCommand('D'),
//           child: const Text("D")
//         )),
//         Padding(padding: const EdgeInsets.only(top: 10), child: ElevatedButton(
//           onPressed: () => sendCommand('E'),
//           child: const Text("E")
//         )),
//         Padding(padding: const EdgeInsets.only(top: 10), child: ElevatedButton(
//           onPressed: () => sendCommand('F'),
//           child: const Text("F")
//         )),
//         Padding(padding: const EdgeInsets.only(top: 10), child: ElevatedButton(
//           onPressed: () => sendCommand('G'),
//           child: const Text("G")
//         )),
//         Padding(padding: const EdgeInsets.only(top: 10), child: ElevatedButton(
//           onPressed: () => sendCommand('I'),
//           child: const Text("I")
//         )),
//       ],
//     );