import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:rcontroll/screens/loader.dart';
import 'package:rcontroll/screens/controller.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RController(),
  ));
}

class RController extends StatefulWidget {
  const RController({super.key});

  @override
  State<RController> createState() => _RControllerState();
}

class _RControllerState extends State<RController> {
  final Guid blueUUID = Guid("ffe0");

  BluetoothDevice? _bluetoothDevice;
  BluetoothCharacteristic? _bluetoothCharacteristic;

  @override
  void initState() {
    super.initState();

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 2));

    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.advertisementData.serviceUuids.contains(blueUUID) && result.advertisementData.advName == "HMSoft") {
          deviceConnect(result.device);

          FlutterBluePlus.stopScan();
          break;
        }
      }
    });
  }

  void deviceConnect(BluetoothDevice device) async {
    try {
      await device.connect();

      setState(() {
        _bluetoothDevice = device;
      });

      List<BluetoothService> services = await device.discoverServices();

      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          if (characteristic.properties.write) {
            setState(() {
              _bluetoothCharacteristic = characteristic;
            });

            break;
          }
        }
      }
    } catch (e) {
      print("Error device connecting: $e");
    }
  }

  void sendCommand(String command) async {
    if (_bluetoothCharacteristic != null) {
      try {
        await _bluetoothCharacteristic!.write(command.codeUnits);
        print("Successful send command: $command");
      } catch (e) {
        print("Error send command: $e");
      }
    }
  }

  Widget loaderContent(BuildContext context) {
    if (_bluetoothDevice == null) {
      return const ConnectDeviceLoader();
    }

    return const Controller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: loaderContent(context),
      )
    );
  }
}