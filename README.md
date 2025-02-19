# Simple Calendar

**Simple Calendar** é um pacote Flutter que fornece um calendário simples e personalizável. Ele permite definir datas iniciais e finais, selecionar um dia específico e destacar múltiplas datas marcadas.

## 🚀 Funcionalidades

- 📅 Defina uma data inicial e final para o calendário.
- ✅ Selecione um dia específico.
- 🔵 Marque múltiplas datas.

## 📦 Instalação

Adicione a dependência ao seu projeto:

```yaml
dependencies:
  simple_calendar:
    git: 
      url: https://github.com/victorfidelis/simple_calendar.git
      ref: main
```

## 💻 Exemplo de Uso

```dart
import 'package:flutter/material.dart';
import 'package:simple_calendar/simple_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarView(),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendário',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: CalendarWidget(
          initialDate: DateTime(2025, 2, 10),
          finalDate: DateTime(2025, 12, 31),
          selectedDate: DateTime(2025, 2, 16),
          markedDates: [
            DateTime(2025, 2, 26),
            DateTime(2025, 2, 27),
          ],
          onSelectDate: (DateTime date) {},
        ),
      ),
    );
  }
}
```
## 🖼️ Captura de Tela

<img src="https://github.com/user-attachments/assets/c459d983-5c6c-42ed-bcf4-ada9ae87d3cb" width="250">

