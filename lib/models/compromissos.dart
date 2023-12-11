class Compromissos {
  int id;
  String titulo;
  String conteudo;
  DateTime modificarHora;

  Compromissos({
    required this.id,
    required this.titulo,
    required this.conteudo,
    required this.modificarHora,
  });
}


List<Compromissos> mostraCompromissos = [
  Compromissos(
    id: 0,
    titulo: 'Horário Sagrado',
    conteudo: 'Reservar um horário fixo diariamente para os estudos, evitando distrações e mantendo o foco nas atividades acadêmicas.',
    modificarHora: DateTime(2022,12,10),
  ),
  Compromissos(
    id: 1,
    titulo: 'Desconexão Total',
    conteudo: '1. Chicken Alfredo\n2. Vegan chili\n3. Spaghetti carbonara\n4. Chocolate lava cake',
    modificarHora: DateTime(2022,12,10),
  ),
  Compromissos(
    id: 2,
    titulo: 'Books to Read',
    conteudo: '1. To Kill a Mockingbird\n2. 1984\n3. The Great Gatsby\n4. The Catcher in the Rye',
    modificarHora: DateTime(2023,3,1,19,5),
  ),
  Compromissos(
    id: 3,
    titulo: 'Gift Ideas for Mom',
    conteudo: '1. Jewelry box\n2. Cookbook\n3. Scarf\n4. Spa day gift card',
   modificarHora: DateTime(2023,1,4,16,53),
  ),
  Compromissos(
    id: 4,
    titulo: 'Workout Plan',
    conteudo:'Monday:\n- Run 5 miles\n- Yoga class\nTuesday:\n- HIIT circuit training\n- Swimming laps\nWednesday:\n- Rest day\nThursday:\n- Weightlifting\n- Spin class\nFriday:\n- Run 3 miles\n- Pilates class\nSaturday:\n- Hiking\n- Rock climbing',
    modificarHora: DateTime(2023,5,1,11,6),
  ),
  Compromissos(
    id: 5,
    titulo: 'Bucket List',
    conteudo: '1. Travel to Japan\n2. Learn to play the guitar\n3. Write a novel\n4. Run a marathon\n5. Start a business',
   modificarHora: DateTime(2023,1,6,13,9),
  ),
  Compromissos(
    id: 6,
    titulo: 'Little pigs',
    conteudo: "Once upon a time there were three little pigs who set out to seek their fortune.",
   modificarHora: DateTime(2023,3,7,11,12),
  ),
  Compromissos(
    id: 7,
    titulo: 'Meeting Notes',
    conteudo:'Attendees: John, Mary, David\nAgenda:\n- Budget review\n- Project updates\n- Upcoming events',
    modificarHora: DateTime(2023,2,1,15,14),
  ),
  Compromissos(
    id: 8,
    titulo: 'Ideas for Vacation',
    conteudo: '1. Visit Grand Canyon\n2. Go on a hot air balloon ride\n3. Try local cuisine\n4. Attend a concert',
    modificarHora: DateTime(2023,2,1,12,34),
  ),
];
