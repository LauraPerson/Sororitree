array_themes = ["Violência Doméstica", "Violência Psicológica", "Violência Física", "Agressões sexuais", "Assédio", "Aborto", "Sexualidade", "Maternidade", "Contracepção", "Direitos das Mulheres", "Relacionamentos Abusivos", "Orientação Profissional", "Saúde da Mulher", "Igualdade de Gênero"]

array_themes.each do |theme|
  the = Theme.create(title: theme)
  puts "Created #{the.id} themes"
end

user1 = {
  nickname: "Alexia",
  email: "alexia@gmail.com",
  password: "123456",
  helper: false,
  address: "Rua Vinícius de Moraes, 49",
  birth_date: "24 Sep 1990"
}

user2 = {
  nickname: "Andressa",
  email: "andressa@gmail.com",
  password: "123456",
  helper: true,
  address: "Rua Alves de Brito, 21",
  birth_date: "06 Jan 1995"
}

user3 = {
  nickname: "Amanda",
  email: "amanda@gmail.com",
  password: "123456",
  helper: true,
  address: "Avenida Tenente-Coronel Adalberto Mendes, 269",
  birth_date: "20 Feb 1998"
}

user4 = {
  nickname: "Laura",
  email: "laura@gmail.com",
  password: "123456",
  helper: true,
  address: "Rua Heráclito, 42",
  birth_date: "28 Jun 1993"
}

user5 = {
  nickname: "Iara",
  email: "iara@gmail.com",
  password: "123456",
  address: "Rua Bambina, 36",
  birth_date: "24 Oct 1996"
}

user6 = {
  nickname: "Raquel",
  email: "raquel@gmail.com",
  password: "123456",
  address: "Rua Dias da Cruz, 426",
  birth_date: "06 Jul 1999"
}

user7 = {
  nickname: "Patricia",
  email: "patricia@gmail.com",
  password: "123456",
  address: "Rua João Pessoa, 70",
  birth_date: "30 Dec 1994"
}

user8 = {
  nickname: "Camila",
  email: "camila@gmail.com",
  password: "123456",
  helper: true,
  address: "Alameda Brasil, 26",
  birth_date: "28 Jun 1997"
}

user9 = {
  nickname: "Bruna",
  email: "bruna@gmail.com",
  password: "123456",
  address: "Rua João dos Santos Mendes, 217",
  birth_date: "30 Dec 1994"
}

user10 = {
  nickname: "Priscila",
  email: "priscila@gmail.com",
  password: "123456",
  helper: true,
  address: "Avenida Pastor Martin Luther King Júnior, 7015",
  birth_date: "28 Jun 1996"
}

array_users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]

array_users.each do |user|
  use = User.create(user)
  puts "Created #{use.id} users"
end

1..80.times do |n|
  selectN = {
    user_id: User.find(rand(User.first.id..User.last.id)).id,
    theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id
  }
  sel = SelectedTheme.create(selectN)
  sel.save
end

post1 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Não silencie! “Foi só um empurrãozinho”, “Ele só estava irritado com alguma coisa do trabalho e descontou em mim”, “Já levei um tapa, mas faz parte do relacionamento”. Você já disse alguma dessas frases ou já ouviu alguma mulher dizer? Por medo ou vergonha, muitas mulheres que sofrem algum tipo de violência, seja física, sexual ou psicológica, continuam caladas. Desde 2005, a Central de Atendimento à Mulher, o Ligue 180, funciona em todo o Brasil e auxilia mulheres em situação de violência 24 horas por dia, sete dias por semana."
}

post2 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "História de uma mulher se sucesso: Chieko Aoki é uma das mulheres mais influentes no Brasil quando o assunto é empreendedorismo. Abriu sua primeira empresa em 1992 e, cinco anos depois, fundou a rede Blue Tree Hotels. Chieko Aoki transformou seu empreendimento em uma das maiores redes hoteleiras do país. Atualmente, a Blue Tree Hotels é referência em benchmark no setor e conta com 22 hotéis em operação. A empresária é reconhecida por seu talento inovador em um ambiente dominado por homens. Sua história é inspiradora por mostrar que é possível conquistar objetivos pessoais e profissionais com coragem e determinação. Além disso, Chieko Aoki tem grande atuação no fortalecimento do empreendedorismo feminino e participa do Grupo Mulheres do Brasil."
}

post3 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Numa agência em que trabalhei, meu salário era menor enquanto tínhamos o mesmo cargo e continuou até depois que assumi um cargo superior ao dele. Desqualificar o feminino é uma forma de dizer que ela só pode ocupar o mercado de trabalho se for de um jeito masculino."
}


post4 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Preciso apanhar para entender que a violência é uma coisa ruim? Ou as estatísticas e as dores das mulheres próximas bastam para me fazer brigar por uma posição mais igualitária. Tive uma aluna que escondia o olho e teve que abandonar a faculdade por causa do namorado ciumento. Será que é preciso ver muita violência até que se tenha uma sociedade realmente igualitária."
}

post5 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Mulher de sucesso: Fabíola Fonseca.O perfil empreendedor de Fabíola começou muito cedo. Quando criança, aos dez anos, vendia balas e criou sua primeira sociedade de revistas em quadrinhos. Aos 20, fundou sua própria empresa, chamada Poderoso Açaí. Com ela, Fabíola difundiu o consumo da fruta em São Paulo. Atualmente é idealizadora do Mulheres do Café, rede especializada em realizar coffee breaks personalizados. O diferencial do negócio é ser inclusivo e voltado ao empreendedorismo feminino. Dessa maneira, o Mulheres do Café oferece acesso e oportunidade de desenvolvimento, autonomia e geração de renda para mulheres de todo o país. Trabalhando em rede, o empreendimento conecta mulheres que trabalham com alimentos em onze estados brasileiros."
}

post6 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Vamos chama-los de A, B e C. Eu dormi com A algumas vezes, e depois as coisas foram esfriando e morrendo. Passados alguns meses, eu dormi com B uma vez, sem me lembrar que eles eram amigos e que conheci os dois na mesma ocasião. Eu fiz coisas diferentes com cada um deles. Ambos disseram que não contariam pra ninguém. Nós tínhamos um amigo em comum, que era o link entre nós. Um dia, B ligou pra C e contou pra ele, A estava junto, ouviu e também contou pra C. Eles obviamente conversaram sobre mim (só coisas boas, ainda bem). Mais tarde, A me telefonou querendo que eu fizesse com ele coisas que fiz com B, mas eu não aceitei. Nas semanas seguintes, A e B me procuraram várias vezes, tentando. Para encurtar a história, alguns meses depois eu dormi com C. Estávamos curiosos enquanto amigos. Então eu enfim completei o time."
}

post7 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Acredito que o corpo da mulher é assunto só dela e que ninguém tem o direito de violá-lo, seja fisicamente ou querendo dizer o que ela pode – ou não – fazer com ele."
}

post8 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Relato de assedio: “Uma semi-desconhecida me salvou. Ela me conhecia de vista e me viu sentada num canto alcoolizada, depois viu um cara que era totalmente desconhecido me carregando dali. Daí ela estranhou e foi lá perguntar e ele disse que eramos amigos e ele estaria me levando pra casa. Ela disse: “Poxa, que bom, tinha me perdido dela, ia dormir na casa dela, vou junto”. Só que o cara disse que não rolava. Ela insistiu nisso e ele acabou indo embora. Depois ela me descreveu a figura e de fato NUNCA tinha visto o sujeito."
}

post9 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "Como as mulheres, desde as sociedades mais antigas, sempre foram marginalizadas e até mesmo tratadas como aberração ou como um ser incompleto, torna-se evidente e necessário ir além de apenas nomear as grandes, mas sim buscar a história de muitas que permanecem invisíveis à história da humanidade. Os sujeitos oprimidos ao longo da história foram representados na historiografia, na literatura, nos meios de comunicação de muitas formas, mas, sempre houve a predominância das representações produzidas pela classe dominante. Podemos dizer que a história das mulheres é fundamental para se compreender a história geral, uma vez que ela é relacional, e inclui tudo o que envolve o ser humano, suas aspirações e realizações, seus parceiros e contemporâneos, suas construções e derrotas."
}

post10 = {
  user_id: User.find(rand(User.first.id..User.last.id)).id,
  theme_id: Theme.find(rand(Theme.first.id..Theme.last.id)).id,
  content: "O que faz um homem acreditar que ele pode eliminar a vida de uma mulher quando ela se recusa a manter relação sexual com ele (ou quando se recusa a um beijo, ou a um abraço, ou a qualquer ato lascivo) ou quando ela se recusa a permanecer no relacionamento (aqui, a famosa frase “se não for minha, não vai ser de mais ninguém."
}

array_posts = [post1, post2, post3, post4, post5, post6, post7, post8, post9, post10]

array_posts.each do |post|
  pt = Post.create(post)
  pt.save
  puts "Created post"
end
