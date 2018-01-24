fams = [
  {name: "jones"},
  {name: "cash"},
  {name: "priest"},
  {name: "mister"},
  {name: "ost"}
]

fams.each do |hash|
  Family.create(hash)
end

parents = {
  "joe"=> {
    email: "joe@example.com",
    password_digest: BCrypt::Password.create("joe"),
    family_id: 1
  },
  "chloe"=> {
    email: "chloe@example.com",
    password_digest: BCrypt::Password.create("chloe"),
    family_id: 2
  },
  "phil"=> {
    email: "phil@example.com",
    password_digest: BCrypt::Password.create("phil"),
    family_id: 3
  },
  "maggie"=> {
    email: "maggie@example.com",
    password_digest: BCrypt::Password.create("maggie"),
    family_id: 4
  },
   "obi"=> {
    email: "obi@example.com",
    password_digest: BCrypt::Password.create("obi"),
    family_id: 5
  }
}

parents.each do |name, hash|
  p = Parent.new
  p.username = name
  hash.each do |attribute, value|
    p[attribute] = value
  end
  p.save
end

kids = {
  "joel"=> {
    email: "joel@example.com",
    password_digest: BCrypt::Password.create("joel"),
    family_id: 1
  },
  "charles"=> {
    email: "charles@example.com",
    password_digest: BCrypt::Password.create("charles"),
    family_id: 2
  },
  "phinnrgo"=> {
    email: "phinnrgo@example.com",
    password_digest: BCrypt::Password.create("phinnrgo"),
    family_id: 3
  },
  "margo"=> {
    email: "margo@example.com",
    password_digest: BCrypt::Password.create("margo"),
    family_id: 4
  },
   "owen"=> {
    email: "owen@example.com",
    password_digest: BCrypt::Password.create("owen"),
    family_id: 5
  }
}
kids.each do |name, hash|
  k = Child.new
  k.username = name
  hash.each do |attribute, value|
    k[attribute] = value
  end
  k.save
end

chores = {
  "clean room"=> {
    child_id: 1,
    parent_id: 1,
    time_to_complete: 20,
    completed: false
  },
  "guitar"=> {
    child_id: 2,
    parent_id: 2,
    time_to_complete: 15,
    completed: false
  },
  "clean bathroom"=> {
    child_id: 3,
    parent_id: 3,
    time_to_complete: 20,
    completed: false
  },
  "empty dishwasher"=> {
    child_id: 4,
    parent_id: 4,
    time_to_complete: 10,
    completed: false
  },
  "clean dishes"=> {
    child_id: 5,
    parent_id: 5,
    time_to_complete: 15,
    completed: false
  }
}
chores.each do |name, hash|
  c = Chore.new
  c.name = name
  hash.each do |attribute, value|
    c[attribute] = value
  end
  c.save
end
