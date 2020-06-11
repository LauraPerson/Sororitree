####################################
# Creating the Themes categories

array_themes = ["Violência Doméstica", "Violência Psicológica", "Violência Física", \
 "Agressões sexuais", "Assédio", "Aborto", "Sexualidade", "Maternidade", "Contracepção", \
 "Direitos das Mulheres", "Relacionamentos Abusivos", "Orientação Profissional", \
 "Saúde da Mulher", "Igualdade de Gênero"]

array_themes.each do |theme|
  the = Theme.create(title: theme)
  puts "Created #{the.id} themes"
end

####################################
# Creating the Avatar's list

(1..31).each do |n|
  avatar = Avatar.create(filename: "avatar_#{n}")
  puts "create #{avatar.id} avatar"
end

####################################
# Creating the users

names = ["Alexia", "Andressa", "Amanda", "Laura", "Iara", "Raquel", "Patricia", \
  "Camila", "Bruna", "Priscila", "Bárbara", "Carol", "Naiara", "Maria", "Rafaela", \
  "Milene", "Silvia", "Taissa", "Cecilia", "Dani", "Verônica", "Beatriz", "Simone", \
  "Valquiria", "Fabiola"]

emails = ["alexia@gmail.com", "andressa@gmail.com", "amanda@gmail.com", "laura@gmail.com", \
  "iara@gmail.com", "raquel@gmail.com", "patricia@gmail.com", "camila@gmail.com", \
  "bruna@gmail.com", "priscila@gmail.com", "barbara@gmail.com", "carol@gmail.com", \
  "naiara@gmail.com", "maria@gmail.com", "rafaela@gmail.com", "milene@gmail.com", \
  "silvia@gmail.com", "taissa@gmail.com", "cecilia@gmail.com", "dani@gmail.com", \
  "veronica@gmail.com", "beatriz@gmail.com", "simone@gmail.com", "valquiria@gmail.com", \
  "fabiola@gmail.com"]

password = "123456"

addresses = ["Rua Vinícius de Moraes, 49", "Rua Alves de Brito, 21", "Avenida Tenente-Coronel Adalberto Mendes, 269", \
  "Rua Heráclito, 42", "Rua Bambina, 36", "Rua Dias da Cruz, 426", "Rua João Pessoa, 70",\
  "Alameda Brasil, 26", "Rua João dos Santos Mendes, 217", "Avenida Pastor Martin Luther King Júnior, 7015", \
  "Rua Dr. Agostinho Porto, 164", "Avenida Jorn. Roberto Marinho, 221", "Avenida Bambuí, 107", \
  "Rua Santa Clara, 376", "Rua Voluntários da Pátria, 170", "Avenida Pastor Martin Luther King Júnior, 7015", \
  "Rua Conde de Baependi, 62", "Rua Riachuelo, 124", "Rua Alexandre Mackenzie, 122", \
  "Rua Conde de Bonfim, 7", "Avenida Eng. Richard, 2", "Rua Maria Antônia, 233", \
  "Rua Dias da Cruz, 579", "Avenida Dom Hélder Câmara, 7084", "Avenida Jambeiro, 354"]

birthdates = ["24 Sep 1955", "06 Jan 1960", "20 Feb 1965", "28 Jun 1970", "24 Oct 1975", \
  "06 Jul 1980", "30 Dec 1985", "28 Jun 1990", "30 Dec 1995", "28 Jun 2000", "28 Jun 1963",\
  "28 Jun 1973", "28 Jun 1983", "28 Jun 1993", "28 Jun 1968", "28 Jun 1978", "28 Jun 1988",\
  "28 Jun 1998", "28 Jun 1992", "28 Jun 1982", "28 Jun 1972", "28 Jun 1962", "28 Jun 1994",\
  "28 Jun 1984", "28 Jun 1989"]

N = names.count
(0..(N-1)).each do |i|
  random = rand(1..Avatar.count)
  user = {
    nickname: names[i],
    email: emails[i],
    password: password,
    helper: true,
    address: addresses[i],
    birth_date: birthdates[i],
    avatar: Avatar.find(random)
  }
  use = User.create(user)
  puts "Created #{use.id} users"
end

####################################
# Creating job categories to users

array_job_category = Professional::CATEGORIES

array_job_category.each do |category|
  user = User.find(rand(User.first.id..User.last.id))
  categ = Professional.create!(job_category: category, user: user)
  puts "Created #{categ.id} categories"
end

####################################
# Creating selected themes to users

Nt = Theme.count
Nu = User.count

(1..Nu).each do |nu|
  (1..Nt).each do |nt|
    selectN = {
      user_id: User.find(nu).id,
      theme_id: Theme.find(nt).id
    }
    sel = SelectedTheme.create(selectN)
    sel.save
  end
end

####################################
# Creating users's posts

posts_content = ["Não silencie! “Foi só um empurrãozinho”, “Ele só estava irritado com alguma coisa do trabalho e descontou em mim”, “Já levei um tapa, mas faz parte do relacionamento”. Você já disse alguma dessas frases ou já ouviu alguma mulher dizer? Por medo ou vergonha, muitas mulheres que sofrem algum tipo de violência, seja física, sexual ou psicológica, continuam caladas. Desde 2005, a Central de Atendimento à Mulher, o Ligue 180, funciona em todo o Brasil e auxilia mulheres em situação de violência 24 horas por dia, sete dias por semana.", \
  "História de uma mulher se sucesso: Chieko Aoki é uma das mulheres mais influentes no Brasil quando o assunto é empreendedorismo. Abriu sua primeira empresa em 1992 e, cinco anos depois, fundou a rede Blue Tree Hotels. Chieko Aoki transformou seu empreendimento em uma das maiores redes hoteleiras do país. Atualmente, a Blue Tree Hotels é referência em benchmark no setor e conta com 22 hotéis em operação. A empresária é reconhecida por seu talento inovador em um ambiente dominado por homens. Sua história é inspiradora por mostrar que é possível conquistar objetivos pessoais e profissionais com coragem e determinação. Além disso, Chieko Aoki tem grande atuação no fortalecimento do empreendedorismo feminino e participa do Grupo Mulheres do Brasil.", \
  "Numa agência em que trabalhei, meu salário era menor enquanto tínhamos o mesmo cargo e continuou até depois que assumi um cargo superior ao dele. Desqualificar o feminino é uma forma de dizer que ela só pode ocupar o mercado de trabalho se for de um jeito masculino.", \
  "Preciso apanhar para entender que a violência é uma coisa ruim? Ou as estatísticas e as dores das mulheres próximas bastam para me fazer brigar por uma posição mais igualitária. Tive uma aluna que escondia o olho e teve que abandonar a faculdade por causa do namorado ciumento. Será que é preciso ver muita violência até que se tenha uma sociedade realmente igualitária.", \
  "Mulher de sucesso: Fabíola Fonseca.O perfil empreendedor de Fabíola começou muito cedo. Quando criança, aos dez anos, vendia balas e criou sua primeira sociedade de revistas em quadrinhos. Aos 20, fundou sua própria empresa, chamada Poderoso Açaí. Com ela, Fabíola difundiu o consumo da fruta em São Paulo. Atualmente é idealizadora do Mulheres do Café, rede especializada em realizar coffee breaks personalizados. O diferencial do negócio é ser inclusivo e voltado ao empreendedorismo feminino. Dessa maneira, o Mulheres do Café oferece acesso e oportunidade de desenvolvimento, autonomia e geração de renda para mulheres de todo o país. Trabalhando em rede, o empreendimento conecta mulheres que trabalham com alimentos em onze estados brasileiros.", \
  "Vamos chama-los de A, B e C. Eu dormi com A algumas vezes, e depois as coisas foram esfriando e morrendo. Passados alguns meses, eu dormi com B uma vez, sem me lembrar que eles eram amigos e que conheci os dois na mesma ocasião. Eu fiz coisas diferentes com cada um deles. Ambos disseram que não contariam pra ninguém. Nós tínhamos um amigo em comum, que era o link entre nós. Um dia, B ligou pra C e contou pra ele, A estava junto, ouviu e também contou pra C. Eles obviamente conversaram sobre mim (só coisas boas, ainda bem). Mais tarde, A me telefonou querendo que eu fizesse com ele coisas que fiz com B, mas eu não aceitei. Nas semanas seguintes, A e B me procuraram várias vezes, tentando. Para encurtar a história, alguns meses depois eu dormi com C. Estávamos curiosos enquanto amigos. Então eu enfim completei o time.", \
  "Acredito que o corpo da mulher é assunto só dela e que ninguém tem o direito de violá-lo, seja fisicamente ou querendo dizer o que ela pode – ou não – fazer com ele.", \
  "Relato de assédio: “Uma semi-desconhecida me salvou. Ela me conhecia de vista e me viu sentada num canto alcoolizada, depois viu um cara que era totalmente desconhecido me carregando dali. Daí ela estranhou e foi lá perguntar e ele disse que eramos amigos e ele estaria me levando pra casa. Ela disse: “Poxa, que bom, tinha me perdido dela, ia dormir na casa dela, vou junto”. Só que o cara disse que não rolava. Ela insistiu nisso e ele acabou indo embora. Depois ela me descreveu a figura e de fato NUNCA tinha visto o sujeito.", \
  "Como as mulheres, desde as sociedades mais antigas, sempre foram marginalizadas e até mesmo tratadas como aberração ou como um ser incompleto, torna-se evidente e necessário ir além de apenas nomear as grandes, mas sim buscar a história de muitas que permanecem invisíveis à história da humanidade. Os sujeitos oprimidos ao longo da história foram representados na historiografia, na literatura, nos meios de comunicação de muitas formas, mas, sempre houve a predominância das representações produzidas pela classe dominante. Podemos dizer que a história das mulheres é fundamental para se compreender a história geral, uma vez que ela é relacional, e inclui tudo o que envolve o ser humano, suas aspirações e realizações, seus parceiros e contemporâneos, suas construções e derrotas.", \
  "O que faz um homem acreditar que ele pode eliminar a vida de uma mulher quando ela se recusa a manter relação sexual com ele (ou quando se recusa a um beijo, ou a um abraço, ou a qualquer ato lascivo) ou quando ela se recusa a permanecer no relacionamento (aqui, a famosa frase “se não for minha, não vai ser de mais ninguém.", \
  "Incentiva-se que meninos, desde muito cedo, sejam agressivos e que mostrem que são homens (“homem não chora”, “homem não leva desaforo para casa”, “vira homem!”). Na adolescência, ou mesmo antes dela, meninos são encorajados, e até mesmo obrigados, a mostrarem toda sua virilidade (“já tem namorada?”, “pegou quantas?”, “esse vai ser um garanhão!”). Além dos comentários mais “inocentes” de familiares e amigos, ainda temos que nos atentar para publicidades que reforçam os estereótipos de gênero, mostrando a mulher como um corpo a ser consumido, em última análise, uma coisa. E se as mulheres são apresentadas a todo tempo como coisas (umas mais valiosas, outras menos), a partir do momento em que não servem mais, podem ser descartadas.", \
  "Paremos de julgar a vítima mulher. Afinal, a culpa pela morte da mulher não é da “saia curta”, ou do seu “belo corpo”, ou porque ela estava “andando sozinha na rua”. Ela foi morta porque existe uma cultura machista que legitima a posição de superioridade de homens, perpetuando relações violentas entre os sexos.", \
  "Não se trata de negar as diferenças entre homens e mulheres, mas de afastar as ditas “masculinidades tóxicas”, a busca para se provar “macho” a todo momento – estimulando violência, fechamento emocional, homofobia e obsessão com dinheiro, sexo e poder.", \
  "No decorrer dos séculos a mulher mostrou ser capaz de fazer mil e uma tarefas com competência, dedicação e paciência. Só para exemplificar, a mulher trabalha muito mais que o homem, fazendo tarefas domésticas, cuidando dos filhos, fazendo jantar para o marido e ainda atura pressões da sociedade sobre a beleza, profissão e vida pessoal. Por esse motivo, é necessário priorizar e analisar o momento da vida e colocar na balança e revendo as prioridades.", \
  "A mulher do século XXI conforme diz Tereza Ancona Lopez de Magalhães ‘‘Ora é ela dona de casa, esposa, mãe de família, ora enfrenta a chamada dupla jornada de trabalho, é a profissional, trabalhando no lar e fora dele, ora é a mulher que luta para ter um a participação efetiva na sociedade da qual é membro. Enfim, a mulher tem que desempenhar vários papéis e o importante é que ela não se veja, em todo esse cenário, somente como mulher, mas, antes de tudo, como ser humano e, dessa forma, procure fazer sempre alguma coisa que a complete, que a realize’’", \
  "O trabalho assumiu diversos significados para as mulheres, como pela dificuldade financeira e a necessidade de dividir as contas do lar. Além de aspectos emocionais, como independência, autonomia, satisfação pessoal e incremento de relacionamentos sociais. O conhecimento dos aspectos emocionais associados ao trabalho é importante, para que se consiga compreender como as mulheres representam sua carreira profissional atualmente e que lugar o trabalho tem ocupado na vida.", \
  "Acredita-se que a mulher se sente muito mais completa e valorizada, sendo uma profissional na medida do possível, não deixando a maternidade de lado. Talvez, seja necessário decidir e priorizar as escolhas, nem que para isso seja necessário adiar alguns sonhos, o importante é dedicar-se e participar na educação dos filhos. Desse modo, envolve-se ativamente na vida deles, tendo equilíbrio entre ambos os sonhos.", \
  "Relato: Há alguns anos, numa festa da UFMA, eu me perdi dos meus amigos e não sabia como fazer pra voltar pra casa. Foi então que eu encontrei o melhor amigo do cara que eu ficava e ele me disse: ‘não vou te deixar ir sozinha pra casa, fica aí que eu te deixo’. Fiquei mais tranquila, afinal, eu já conhecia ele. Os amigos dele estavam juntos e começaram a colocar uma pressão danada pra eu beber, dizendo que mulher não aguentava o pique e etc. Eu tinha 17 anos e estava extremamente perdida em mim. Fui bebendo e perdendo noção. Quando estávamos no caminho percebi, que não tinha dito pra ele onde morava. Não estava entendendo nada. Tenho alguns flashes da noite, bem poucos. Lembro de ter pedido pra ele parar. Quando acordei no dia seguinte, demorei para entender onde estava – e demorei anos pra realmente entender o que tinha acontecido. Adivinha quem saiu como culpada pro amigo dele? Por muito tempo, eu me culpei por tudo. Hoje, entendo que não importa o quanto eu beber, ninguém tem o direito de me tocar. É pela nossa segurança, pra que nosso corpo seja respeitado, pra que nenhuma outra mulher precise passar pelos traumas que ainda me perseguem, que eu grito e luto diariamente.", \
  "Ao se tornarem mães as mulheres passam por um período de intensas transformações: sensibilidade à flor da pele, privação de sono, mudanças físicas e emocionais, falta de rotina, dores na amamentação e o desafio da solidão. A maternidade tão sonhada e idealizada revela seu “lado B” assim que nasce o bebê. O que deveria ser só felicidade é também fonte de dificuldades e transtornos. A boa notícia é que hoje existem diversas alternativas para trazer mais leveza a essa fase de tantas adaptações da mulher e da criança.", \
  "Preservativo Feminino, como user? Esse preservativo tem a forma de um cilindro com um aro em cada extremidade. Na que vai ficar no fundo da vagina, junto ao colo do útero, esse anel é fechado. Na outra é aberto e fica por fora da vagina. Por ser de plástico, o preservativo feminino não compromete a sensibilidade e, além de evitar a gravidez, ajuda a mulher a prevenir-se contra as infecções sexualmente transmissíveis e aids.", \
  "A violência psicológica é tipificada pela Lei Maria da Penha e, dentro do chamado “Ciclo de Violência”, antecede agressões sexuais, físicas e até patrimoniais. A ausência de violência física não significa que o agressor seja menos perigoso para a vítima, tampouco que a vítima se sinta menos presa. Com a intenção de orientar meninas a perceberem os primeiros sinais de uma relação tóxica, o Ministério Público de São Paulo lançou a campanha “Namoro Legal”, que conta com uma cartilha com dicas de como identificar.", \
  "Conheça a La Frida Bike: Um empreendedorismo social orgânico e empoderador, criado por mulheres negras e feito por nós, mulheres negras. Com ideia de incentivar o uso da bike como modal de transporte sustentável e econômico e a independência financeira de nossas irmãs. Somos DE TUDOOOO! Confira: https://www.lafridabike.com/", \
  "Olha que lindo: A marca de absorventes Always – da P&G, irá remover o símbolo da Vênus (que representa o gênero feminino) das embalagens de seus produtos. O objetivo da mudança é transmitir uma mensagem inclusiva para pessoas trans e não-binárias, que também podem fazer uso dos produtos. A mudança veio depois de ativistas transgêneros pedirem publicamente à Procter & Gamble que redesenhasse o logotipo. Entre seus argumentos estavam que nem todas as pessoas que menstruam são mulheres e que nem todas as mulheres menstruam.", \
  "Relato: Eu já fui vítima do crime de importunação sexual antes mesmo de ser um crime. Apesar de não ter havido contato físico foi de uma violação enorme. Eu estava voltando pra casa da faculdade num sábado e ônibus estava vazio, me sentei no fundo. Nunca tinha problematizado lugares do ônibus até o momento. Eu estava ali tranquila, voltando pra casa, tinha só mais uma pessoa no ônibus alem de mim, que estava na frente. De repente, entrou um cara, e de todos os lugares disponíveis ele sentou exatamente do meu lado e ali ele se masturbou, sem cerimônia e nada. Eu demorei alguns minutos pra saber que era aquilo. E eu, feminista que vivia berrando aos cantos que se isso acontecesse comigo eu sairia na porrada com o macho, não tive nenhuma reação. O terror me dominou e eu não pude fazer nada. Fiquei nisso até quando ele desceu, num momento extremamente agoniante. Depois disso eu só pude me sentir suja, extremamente suja. Eu passei um dia tomando banhos e mais banhos e trancada no meu quarto assimilando. Por muito tempo, não conseguia falar sobre isso e nunca consegui falar dentro da minha casa. Eu, como tantas outras mulheres, me senti vítima. Não houve contato com meu corpo, mas me senti violada.", \
  "De vez em quando você se pega pensando em como os outros relacionamentos são tão diferentes do seu? E quando você conhece um casal que quase nunca brigou e costuma achar isso muito bizarro? Ao conversar com suas amigas, você percebe que elas são “livres demais” em seus relacionamentos? Enfim… será que você já se perguntou se está em um relacionamento abusivo? Veja essa matéria para descobrir: https://catracalivre.com.br/entretenimento/como-saber-se-estou-em-um-relacionamento-abusivo/" \
  ]

themes_ids = [3, 12, 14, 3, 12, 7, 10, 5, 10, 3, 14, 10, 14, 10, 14, 10, 8 , 4, \
  8, 9, 2, 10,14, 5, 11]

Np = posts_content.count
(0..(Np-1)).each do |i|
  post = {
    user_id: User.find(rand(User.first.id..User.last.id)).id,
    theme_id: Theme.find(themes_ids[i]).id,
    content: posts_content[i]
  }
  pt = Post.create(post)
  pt.save
  puts "Created #{pt.id} post"
end