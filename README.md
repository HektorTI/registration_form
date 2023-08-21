# registration_form

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


1. Importando Bibliotecas Iniciais:
No início, estamos importando a biblioteca principal do Flutter (flutter/material.dart) para criar interfaces de usuário.

2. Definindo o Ponto de Entrada da Aplicação:
A função main() é onde a execução da nossa aplicação começa. Aqui, estamos iniciando o aplicativo usando o widget MyApp.

3. Classe MyApp (Classe Principal da Aplicação):
A classe MyApp é um widget sem estado (StatelessWidget) que define a estrutura básica do nosso aplicativo. Ele define a aparência visual padrão e define o título do aplicativo.

4. Classe RegistrationForm (Formulário de Registro):
Aqui, definimos uma nova classe chamada RegistrationForm, que é um widget com estado (StatefulWidget). Isso nos permite criar um formulário interativo que pode armazenar e exibir dados.

5. Chave Global de Formulário:
Usamos GlobalKey<FormState> para rastrear o estado do formulário. Isso nos permite validar e salvar o formulário quando necessário.

6. Campos de Dados e Variáveis:
Definimos várias variáveis para armazenar as informações inseridas pelo usuário, como instituição, curso, nome completo, etc.

7. Construindo a Interface do Formulário:
Usamos o widget Scaffold para criar a estrutura da página. Dentro do Scaffold, usamos um SingleChildScrollView para tornar o formulário rolável, permitindo que o usuário role a página quando estiver preenchendo o formulário.

8. Campos de Texto (Input Fields):
Para cada campo de entrada (como instituição, curso, nome completo, etc.), usamos o método _buildField para criar um campo de texto com uma aparência estilizada. Configuramos funções de validação e salvamento para cada campo.

9. Campo de Data de Nascimento:
Usamos o método _buildDatePickerField para criar um campo de data de nascimento especial que abre um seletor de data quando o usuário toca nele. Isso permite que o usuário selecione sua data de nascimento.

10. Campo de Escolaridade (Dropdown):
Usamos o método _buildDropdownField para criar um campo de escolaridade. Isso cria um menu suspenso (dropdown) onde o usuário pode selecionar sua escolaridade.

11. Campos Adicionais:
Adicionamos campos adicionais conforme suas solicitações, como número de telefone, endereço, complemento, número, distrito, cidade, senha e confirmação de senha. Cada campo segue um padrão semelhante ao dos campos de texto.

12. Botão de Registro:
Usamos um botão elevado (ElevatedButton) para permitir que o usuário envie o formulário. Quando o botão é pressionado, verificamos se o formulário é válido e, em seguida, salvamos os dados preenchidos.

13. Métodos Auxiliares:
No final do código, definimos métodos auxiliares como _buildField, _buildDatePickerField e _buildDropdownField. Esses métodos criam os campos de entrada com os estilos apropriados e configuram a validação e o salvamento dos dados.

14. Executando a Aplicação:
A função runApp inicia nossa aplicação, usando a classe MyApp como o widget raiz.
Este é o resumo passo a passo do código. Cada parte do código desempenha um papel específico para criar um formulário de registro interativo e estilizado.