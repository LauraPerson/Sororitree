####################################
# Creating the Themes categories

Theme::CATEGORIES.each do |theme|
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

names = ["Alexia", "Andressa", "Amanda", "Laura", "Manon", "Julie", "Louise", \
  "Marion", "Camille", "Aude", "Léa", "Carole", "Marie", "Célia", "Clémence", \
  "Milène", "Françoise", "Laurence", "Lisa", "Alice", "Agathe", "Juliette", "Mona", \
  "Elsa", "Céline"]

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

birthdates = ["24 Sep 1993", "06 Jan 1960", "20 Feb 1965", "28 Jun 1992", "24 Oct 1975", \
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

users_ids = User.all.ids
array_job_category.each do |category|
  id_user = users_ids.sample
  categ = Professional.create(job_category: category, user_id: id_user)
  puts "Created #{categ.id} professional"
  users_ids.delete(id_user)
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


  posts_content = ["J'ai rencontré Michel à 19 ans. Au début tout était tout rose. Nous nous sommes mariés dix ans plus tard, j'avais 29 ans. J'ai eu ma première fille un an après. Et là, le début de la fin a commencé : à la naissance du premier enfant. J'étais très épanouie pendant ma grossesse et il l'a très mal vécu. J'ai commencé à ressentir cette fameuse jalousie. Je suis pleine de vie, j'aime la vie, je suis plutôt optimiste, contente de peu de chose, des petits bonheurs de la vie. Quand j'ai été enceinte, j'étais comblée. Je ne sais pas ce qui s'est passé, une cassure profonde s'est opérée. J'ai commencé à subir des insultes au quotidien, c'était difficile à vivre. Autour des un an de ma fille, j'ai eu droit à mon premier coup.", \
    "Dissimuler les bleus et les bosses était devenu une préoccupation régulière. Quand cacher n'était plus possible, il fallait mentir : pour un hématome, je disais que j'avais pris une porte, pour un bras cassé, c'était un tas de bûches qui s'était écroulé. Quand je ne pouvais pas sortir, c'était une gastro. J'étais devenue très maladroite, souvent malade et personne ne s'en étonnait. Le pire était les mots. Leur violence était invisible mais tellement douloureuse ! J'entends encore résonner : im-bé-ci-le, bien articulé pour que je comprenne.", \
  "Avec cet homme, nous sommes restés ensemble six ans. Six ans de violence psychologique. C’est très insidieux, je compare ça à une perfusion de poison administré au quotidien. Au départ, c’est juste de l’humour glacial. Puis, des réflexions assassines, des SMS jour et nuit et la sensation d’être en permanence jugée et épiée. J’en parlais à mes proches mais je passais pour la râleuse : 'T’exagères, il est sympa'. Puis, il y a eu les insultes, un travail de sape, d’humiliation, de plus en plus violent au fil des mois et des années. Jusqu’à ces mots : 'Je veux que tu crèves'", \
  "La pilule avait quelque chose de naturel, systématique et de très automatique. Je l’ai prise avant même de vraiment rentrer dans l’adolescence. On ne m’a jamais parlé des effets secondaires, ni au début ni une fois devenue adulte. Les médecins partant tous du principe que je la prenais depuis tant de temps qu’il était inutile d’en rediscuter. Un peu comme si j’étais devenue malgré moi une experte du petit comprimé rond. Personne ne m’a alertée ni mise en garde contre quoi que ce soit et encore moins proposée une autre alternative.", \
  "Je n’avais pas l’impression de ne pas avoir de libido. Pour moi, tout allait bien, normalement en tous les cas. Pourtant, je dois bien reconnaître que ma libido a très clairement explosé depuis que j’ai arrêté la pilule. Personne ne m’avait jamais dit que la pilule pourrait affecter ma libido et clairement de ce point de vue, je suis vraiment en colère. J’ai l’impression que l’on m’a volé une partie de ma vie sexuelle car la pilule se rapproche du fonctionnement de la castration chimique.", \
  "En envisageant le sexe comme un cadeau, je pensais faire la démonstration évidente de mes sentiments et je l’utilisais comme une monnaie d’échange pour obtenir de l’amour. J’espérais que « céder » mon corps me donnerait un statut particulier dans le cœur de la personne. Grosse erreur ! J’ai appris qu’il ne fallait attendre du sexe rien d’autre qu’un moment de plaisir et d’intimité partagé.", \
  "Il m’est déjà arrivée d’être jugée, bien souvent par mes propres amis et amies. Certaines m’ont estimée 'trop facile', pas assez sélective, pas sérieuse… Cela m’a blessée parfois. C’était avant que je découvre le concept du slut-shaming… Ces remarques m’ont fait douter de moi, elles m’ont poussée à me remettre en question. Est-ce que ma sexualité est 'abusée' ? À partir de combien de partenaires est-on 'une pute' ? Après réflexion, je suis arrivée à la conclusion que les filles avaient le droit d’aimer le sexe, que ma vie sexuelle me convenait parfaitement, que je n’avais aucun regret et que je comptais continuer comme ça.", \
  "Cristina Amaral, ou Kiki comme elle aime être surnommée, est la première femme pilote du Timor-Leste. Grandissant dans le district isolé d’Oecusse, dans un pays ayant récemment regagné son indépendance, elle ne peut s’empêcher de remarquer que tous les pilotes de son pays qu’elle aime tant sont des hommes. S’occupant de ses quatre frères et sœurs tout en faisant ses études, elle reçoit ensuite une bourse pour l’école de pilotage, se démarquant, contre toute attente, au sein d’une profession dominée par les hommes. Aujourd’hui, devenue une figure remarquable du monde de l’aviation, elle s’élance dans le ciel avec fierté, au-dessus des nuages.", \
  "Être une femme dans le milieu du gaming c’est plus ou moins la même problématique qu’être une femme dans un milieu majoritairement composé d’hommes, On est confronté à la l’incompréhension, à de la haine gratuite.", \
  "J’étais au lycée, je rencontrais mon premier copain sur Internet. Il était adorable, et surtout il avait cinq ans de plus que moi, une voiture et c’était trop classe de sortir avec 'un vieux' ! J’étais plutôt fière de sortir avec lui. D’autant plus que nous sommes resté·es ensemble un peu plus d’un an, et ça reste encore aujourd’hui ma plus longue relation. Devant ses ami·es j’étais belle, intelligente et charmante ! Il voulait qu’on vive ensemble. Mais voilà, ça c’est ce que les autres pouvaient voir. Moi de mon côté, je me voyais imposer un cahier des charges pour savoir comment je devais m’habiller, me coiffer et me maquiller. Je n’avais pas le droit d’ouvrir la bouche devant ses ami·es à part pour dire les civilités. J’avais à peine 17 ans et je me retrouvais en couple pour la première fois de ma vie, avec un pervers narcissique. On ne m’avait jamais parlé de ça. J’ai vécu un an de réflexions sur mon physique, de comparaison avec son ancienne copine. J’ai eu droit à des 'cours' pour apprendre à coucher avec lui : il me montrait ses vidéos pornographiques préférées pour que je fasse la même chose !",
   "C’était ma première histoire d’amour. Il voulait tout faire avec moi, que l’on se voit tout le temps. J’étais vraiment sur un petit nuage. Sauf que déjà sexuellement je le trouvais très pressant sans vraiment oser le lui dire. J’avais envie de faire l’amour avec lui mais de prendre un peu mon temps. Je ne disais rien parce que je n’osais pas, mais il ne me demandait pas vraiment mon avis pour glisser sa main dans mon pantalon ou pour prendre la mienne et la glisser dans le sien. Quand je la retirais, il insistait jusqu’à ce que je cède.", \
   "Une fois qu’il m’avait isolée, les violences psychologiques se sont installées. Au départ, c’était des remarques qui semblaient anodines : 'tu n’as pas beaucoup de poitrine', 'tu pourrais prendre la pilule car je prendrais plus de plaisir sans capote', 'tu as des vergetures' .Puis au fil du temps, il est devenu de plus en plus jaloux et fouillait sans cesse mon téléphone : je n’avais pas le droit de parler à qui que ce soit sous peine de le rendre dingue. Un jour, j’ai discuté avec un ami très proche de la pluie et du beau temps. Il s’est alors énervé comme jamais, le ton est monté et la gifle est arrivée. La première que je n’oublierai jamais, d’une violence incroyable pour me faire taire.", \
  "A Paris, dans la rue,  je ne me sens pas a l’aise, sauf lorsque je suis escortée par un homme. Quand je choisis de mettre une jupe ou un short, j’évite certains quartiers. Mais de toutes manières, quelle que soit notre tenue, on a droit aux mêmes remarques. Honnêtement, ils s’attendent à quoi lorsqu’ils nous interpellent d’un : « Wesh, t’es bonne » ", \
  "J'ai assisté à une scène particulièrement violente la semaine dernière. Une fille passe devant un type assis sur un strapontin dans la rame d'un métro. Il lui lâche : « Tu pourrais me sourire quand je te regarde ». Impassible (et sans doute saoulée), elle ignore sa remarque. L'autre s'énerve et renchérit avec un « Salope, va te faire trouer la ch**** ». Le pire dans cette histoire ? Voir que la scène fait marrer trois mecs cravatés dans la rame.", \
  "J’ai souvent été victime de sifflets ou de sollicitations du type « Eh, vous êtes charmante mademoiselle », mais ce genre de situation s’est tellement banalisé que parfois je n’y prête même plus attention. Je sais que je si je porte une mini-jupe je vais me prendre des réflexions dans la rue, mais je fais avec et les supporte… Et c’est justement cela qui me révolte : le fait de se résigner à ce sexisme ordinaire.", \
  "1992, j'ai bientôt 18 ans, je vis avec l'insouciance que rien ne peut arriver. Je suis la reine du monde. J'ai un petit ami. C’est tellement beau, tellement charmant, tellement tout... Premier câlin. Mes règles n'arrivent pas. Un test, le choc. Je ne peux pas avoir un bébé quand même, je suis trop jeune, je veux faire des études, je n'ai pas l'argent qui lui sera nécessaire. Je décide d'avorter. Mes parents sont là. C'est terrible de leur infliger ça. Je ne réalise pas vraiment que ma vie entière je me souviendrai de ce jour. Parce que oui, vingt-deux ans plus tard j'y pense encore, mais il n'y a pas un jour où je regrette mon choix ! Ce n'est pas avec le sourire que j'y suis allée, mais heureusement que cette loi était là pour moi, à ce moment-là. Elle m'a permis de rectifier ma vie parce que oui, l’erreur est humaine. Et Mme Veil l’avait compris. Merci Madame de vous être battue pour nous."
  ]

themes_ids = [1, 3, 2, 9, 9, 7, 7, 12, 14, 11, 11, 2, 5, 5, 5, 6]

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
