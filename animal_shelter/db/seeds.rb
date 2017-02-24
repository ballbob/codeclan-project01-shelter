#animals

@billytortoise = Animal.new({"name" => "Billy", "adoptable" => "with experience", "admission_date" => "06/06/2006", "type" => "exotic - terrapin"})

@sophiesnake = Animal.new({"name" => "Sophie", "adoptable" => "no - recent surgery", "admission_date" => "09/02/2015", "type" => "exotic - ball python"})

@cecilparrot = Amimal.new({"name" => "Cecil", "adoptable" => "no - owned by Keir", "admission_date" => "05/05/2010", "type" => "exotic - African grey parrot"})

@brothersnake = Animal.new({"name" => "Brother", "adoptable" => "yes - good temperament. advise owner", "admission_date" => "04/08/2016", "type" => "exotic - Russian rat snake"})

#owners

@ownerbrian = Owner.new({"name" => "Brian", "experience" => "10 years. Dog, cat, exotics - reptiles - turtles and tortoises."})

@ownerkeir = Owner.new({"name" => "Keir", "experience" => "50 years. Exotics - birds - parrots."})

@ownersheila = Owner.new({"name" => "Sheila", "experience" => "12 years. Exotics - reptiles - lizards and snakes."})

#ownerships

@brianownsbilly = Ownership.new({"owner_id" => "#{@ownerkeir.id}", "animal_id" => "#{@billytortoise.id}"})

@keirownscecil = Ownership.new({"owner_id" => "#{@ownerkeir.id}", "animal_id" => "#{@cecilparrot.id}"})