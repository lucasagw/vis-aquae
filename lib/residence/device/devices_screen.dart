import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/device/device_viewmodel.dart';
import 'package:vis_aquae/shared/widgets/app_bar_arrow_back.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';
import 'package:vis_aquae/without_items/without_itens_screen.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({Key key}) : super(key: key);

  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  List<DeviceViewModel> devices;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    devices = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return devices == null || devices.isEmpty
        ? WithoutItensScreen(text: 'NENHUM DISPOSITIVO CADASTRADO')
        : Scaffold(
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: AppColors.backgroundScreen,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBarArrowBack(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ContainerTitle(title: 'Residência'),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Expanded(
                            child: ListView.builder(
                              itemCount: devices.length,
                              itemBuilder: (context, index) => Card(
                                child: Column(
                                  children: [
                                    Text(
                                      devices[index].nome,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Divider(color: Colors.black38),
                                    Text(
                                      'Tempo Ligado:\n${devices[index].tempoLigado}',
                                    ),
                                    Divider(color: Colors.black38),
                                    Text(
                                      'Consumo:\n${devices[index].consumo}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
