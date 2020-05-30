array_themes = ["Violência Doméstica", "Violência Psicológica", "Violência Física", "Agressões sexuais", "Assédio", "Aborto", "Sexualidade", "Maternidade", "Contracepção", "Direitos das Mulheres", "Relacionamentos Abusivos", "Orientação Profissional", "Saúde da Mulher", "Igualdade de Gênero"]

array_themes.each do |theme|
  the = Theme.create(title: theme)
  puts "Created #{the.id} themes"
end

user1 = {
  nickname: "Alexia",
  email: "alexia@gmail.com",
  password: "123456",
  helper: true,
  address: "Rua Vinícius de Moraes, 49",
  birth_date: "24 Sep 1990"
}

user2 = {
  nickname: "Andressa",
  email: "andressa@gmail.com",
  password: "123456",
  helper: true,
  address: "Rua Alves de Brito, 21",
  birth_date: "06 Jan 1960"
}

user3 = {
  nickname: "Amanda",
  email: "amanda@gmail.com",
  password: "123456",
  helper: true,
  address: "Avenida Tenente-Coronel Adalberto Mendes, 269",
  birth_date: "20 Feb 1980"
}

user4 = {
  nickname: "Laura",
  email: "laura@gmail.com",
  password: "123456",
  helper: true,
  address: "Rua Heráclito, 42",
  birth_date: "28 Jun 1970"
}

user5 = {
  nickname: "Iara",
  email: "iara@gmail.com",
  password: "123456",
  address: "Rua Bambina, 36",
  birth_date: "24 Oct 1975"
}

user6 = {
  nickname: "Raquel",
  email: "raquel@gmail.com",
  password: "123456",
  address: "Rua Dias da Cruz, 426",
  birth_date: "06 Jul 1995"
}

user7 = {
  nickname: "Patricia",
  email: "patricia@gmail.com",
  password: "123456",
  address: "Rua João Pessoa, 70",
  birth_date: "30 Dez 1965"
}

user8 = {
  nickname: "Camila",
  email: "camila@gmail.com",
  password: "123456",
  helper: true,
  address: "Alameda Brasil, 26",
  birth_date: "28 Jun 2000"
}

user9 = {
  nickname: "Bruna",
  email: "bruna@gmail.com",
  password: "123456",
  address: "Rua João dos Santos Mendes, 217",
  birth_date: "30 Dez 1955"
}

user10 = {
  nickname: "Priscila",
  email: "priscila@gmail.com",
  password: "123456",
  helper: true,
  address: "Avenida Pastor Martin Luther King Júnior, 7015",
  birth_date: "28 Jun 1989"
}

array_users = [user1, user2, user3, user4, user5, user6, user7, user8]

array_users.each do |user|
  use = User.create(user)
  puts "Created #{use.id} users"
end

chatroom1 = {
  user_id: 1
}

Chatroom.create(chatroom1)
puts "Create a chatroom1"