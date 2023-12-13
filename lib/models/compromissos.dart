class Compromissos {
  int id;
  String titulo;
  String descricao;
  DateTime modificarHora;

  Compromissos({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.modificarHora,
  });
}

List<Compromissos> showCompromissos = [
  Compromissos(
    id: 0,
    titulo: 'Horário Sagrado',
    descricao: 'Reservar um horário fixo diariamente para os estudos, evitando distrações e mantendo o foco nas atividades acadêmicas.',
    modificarHora: DateTime(2022,12,10,11,40),
  ),
  Compromissos(
    id: 1,
    titulo: 'Desconexão Total',
    descricao: '1.Desligar completamente dispositivos eletrônicos\n3. Desativar redes sociais durante períodos de estudo\n4. promovendo concentração e maximizando a eficiência do aprendizado',
    modificarHora: DateTime(2022,12,11,10,30),
  ),
  Compromissos(
    id: 2,
    titulo: 'Planejamento Mensal',
    descricao: 'Iniciar cada mês com a elaboração de um planejamento detalhado das metas acadêmicas a serem atingidas, ajustando estratégias conforme necessário ao longo do período.',
    modificarHora: DateTime(2023,03,5),
  ),
  Compromissos(
    id: 3,
    titulo: 'Revisão Semanal',
    descricao: '1. Reservar um tempo toda semana para revisar o material estudado\n2. fortalecendo a retenção de informações e identificando áreas que precisam de mais atenção.',
   modificarHora: DateTime(2023,05,8,9,20),
  ),
  Compromissos(
    id: 4,
    titulo: 'Leitura Recreativa',
    descricao:'Reservar um tempo diário para a leitura de conteúdo não relacionado aos estudos, proporcionando uma pausa mental e estimulando a criatividade.',
    modificarHora: DateTime(2023,02,12,20,30),
  ),
  Compromissos(
    id: 5,
    titulo: 'Planejamento Mensal',
    descricao: 'Iniciar cada mês com a elaboração de um planejamento detalhado das metas acadêmicas a serem atingidas, ajustando estratégias conforme necessário ao longo do período.',
   modificarHora: DateTime(2023,01,9,2,05),
  ),
  Compromissos(
    id: 6,
    titulo: 'Projetos Colaborativos',
    descricao: "1. Participar ativamente de projetos em grupo para promover a troca de conhecimentos e habilidades\n2",
   modificarHora: DateTime(2023,11,12,7,35),
  ),
  Compromissos(
    id: 7,
    titulo: 'Saúde Mental em Primeiro Lugar',
    descricao:'1.  Priorizar a saúde mental através da prática regular de atividades relaxantes, como meditação ou exercícios físicos, \n2 para garantir um equilíbrio saudável entre estudo e bem-estar.',
    modificarHora: DateTime(2023,09,14,4,20),
  ),
  Compromissos(
    id: 8,
    titulo: 'Aula Magna',
    descricao: '1. Assistir a pelo menos uma palestra\n2. webinar ou aula online por semana sobre temas relevantes ao campo de estudo \n3. buscando ampliar o conhecimento além do currículo padrão.',
    modificarHora: DateTime(2023,02,34,22,10),
  ),
];

