import 'package:flutter/material.dart';

class TesteAvaliacao extends StatefulWidget {
  const TesteAvaliacao({super.key});

  @override
  State<TesteAvaliacao> createState() => _TesteAvaliacaoState();
}

class _TesteAvaliacaoState extends State<TesteAvaliacao> {

    double _avaliacao = 0;

  Future<void> _submeterAvaliacao() async {
    /* final response = await http.post(
      Uri.parse('http://<seu-endereco>/avaliacoes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'idPostagem': widget.idPostagem,
        'idUsuarioWeb': widget.idUsuarioWeb,
        'avaliacao': _avaliacao.toInt(), // Converte para inteiro
      }),
    );

    if (response.statusCode == 200) {
      // Avaliação enviada com sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Avaliação enviada com sucesso!')),
      );
    } else {
      // Lidar com erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar avaliação.')),
      );
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Avalie a ideia:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Exibe as estrelas de avaliação
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _avaliacao ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _avaliacao = index + 1; // Define a avaliação baseada na estrela clicada
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text(
              'Avaliação: $_avaliacao estrela${_avaliacao != 1 ? 's' : ''}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a lógica para enviar a avaliação, se necessário.
                print('Avaliação enviada: $_avaliacao');
                // Exibir uma mensagem ou realizar outra ação
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Avaliação de $_avaliacao estrelas!')),
                );
              },
              child: Text('Enviar Avaliação'),
            ),
          ],
        ),
    );
  }
}