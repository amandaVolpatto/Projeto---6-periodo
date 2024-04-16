import 'package:flutter/material.dart';

class TelaAgendar extends StatefulWidget {
  @override
  _TelaAgendarState createState() => _TelaAgendarState();
}

class _TelaAgendarState extends State<TelaAgendar> {
  bool showFields = false; // Estado para controlar a visibilidade dos campos de seleção

  String? selectedCity;
  String? selectedPlace;
  String? selectedDay;
  String? selectedTime;
  String? selectedService;

  final List<String> cities = ['Vitorino', 'Pato Branco', 'São Lorenço'];
  final List<String> places = ['Ferrari', 'Estação', 'MotorBeleza'];
  final List<String> days = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta'];
  final List<String> times = ['09:00', '11:00', '14:00', '16:00', '18:00'];
  final List<String> services = ['Corte', 'Corte e Barba', 'Coloração'];

  List<Map<String, String?>> agendamentos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agendar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            if (!showFields)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showFields = true;
                  });
                },
                child: Text('Marcar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Mudança para cor do botão preta
                  foregroundColor: Colors.white, // Cor do texto branca
                ),
              ),
            SizedBox(height: 10),
            if (!showFields) // Botão para exibir os agendamentos marcados
              ElevatedButton(
                onPressed: showMarcados,
                child: Text('Marcados'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Mudança para cor do botão preta
                  foregroundColor: Colors.white, // Cor do texto branca
                ),
              ),
            if (showFields) ...[
              buildDropdown("Cidade", selectedCity, cities, (val) => setState(() => selectedCity = val)),
              buildDropdown("Lugar", selectedPlace, places, (val) => setState(() => selectedPlace = val)),
              buildDropdown("Dia", selectedDay, days, (val) => setState(() => selectedDay = val)),
              buildDropdown("Horário", selectedTime, times, (val) => setState(() => selectedTime = val)),
              buildDropdown("Serviço", selectedService, services, (val) => setState(() => selectedService = val)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveAgendamento,
                child: Text('Salvar Agendamento'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Mudança para cor do botão preta
                  foregroundColor: Colors.white, // Cor do texto branca
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  void saveAgendamento() {
    final agendamento = {
      'cidade': selectedCity,
      'lugar': selectedPlace,
      'dia': selectedDay,
      'horário': selectedTime,
      'serviço': selectedService,
    };

    agendamentos.add(agendamento);
    print("Agendamento salvo: $agendamento");
    setState(() {
      showFields = false; // Esconde os campos após salvar
    });
  }

  void showMarcados() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Agendamentos Marcados"),
          content: SingleChildScrollView(
            child: ListBody(
              children: agendamentos.map((agendamento) => Text("${agendamento['serviço']} em ${agendamento['dia']} às ${agendamento['horário']} - ${agendamento['cidade']}, ${agendamento['lugar']}")).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  DropdownButtonFormField<String> buildDropdown(String label, String? value, List<String> options, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(labelText: label),
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
