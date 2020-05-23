
array_themes = ["Domestic Violence", "Psychological Violence", "Physical Violence", "Sexual Assaults", "Harassment", "Abortion", "Sexuality", "Maternity", "Contraception", "Women Rights", "Abusive Relationships", "Career Guidance", "Women's Health", "Gender Equality"]

array_themes.each do |theme|
  the = Theme.create(title: theme)
  puts "Created #{the.id} themes"
end

user1 = {
  nickname: "Alexia",
  email: "alexia@gmail.com",
  password: "123456"
}

user2 = {
  nickname: "Andressa",
  email: "andressa@gmail.com",
  password: "123456"
}

user3 = {
  nickname: "Amanda",
  email: "amanda@gmail.com",
  password: "123456"
}

user4 = {
  nickname: "Laura",
  email: "laura@gmail.com",
  password: "123456"
}

array_users = [user1, user2, user3, user4]

array_users.each do |user|
  use = User.create(user)
  puts "Created #{use.id} users"
end
