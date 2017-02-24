require('pry')
require('pry-byebug')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/ownership.rb')

#animals

Animal.delete_all
Owner.delete_all
Ownership.delete_all

@billytortoise = Animal.new({
  "name" => "Billy", 
  "adoptable" => "with experience", 
  "admission_date" => "06/06/2006", 
  "type" => "exotic - terrapin"})
@billytortoise.save

@sophiesnake = Animal.new({
  "name" => "Sophie", 
  "adoptable" => "no - recent surgery", 
  "admission_date" => "09/02/2015", 
  "type" => "exotic - ball python"})
@sophiesnake.save

@cecilparrot = Animal.new({
  "name" => "Cecil", 
  "adoptable" => "no - owned by Keir", 
  "admission_date" => "05/05/2010", 
  "type" => "exotic - African grey parrot"})
@cecilparrot.save

@brothersnake = Animal.new({
  "name" => "Brother", 
  "adoptable" => "yes - good temperament. Escapes often. advise owner", 
  "admission_date" => "04/08/2016", 
  "type" => "exotic - Russian rat snake"})
@brothersnake.save

#owners

@ownerbrian = Owner.new({
  "name" => "Brian", 
  "experience" => "10 years. Dog, cat, exotics - reptiles - turtles and tortoises."})
@ownerbrian.save

@ownerkeir = Owner.new({
  "name" => "Keir", 
  "experience" => "50 years. Exotics - birds - parrots."})
@ownerkeir.save

@ownersheila = Owner.new({
  "name" => "Sheila", 
  "experience" => "12 years. Exotics - reptiles - lizards and snakes."})
@ownersheila.save

#ownerships

@brianownsbilly = Ownership.new({
  "owner_id" => "#{@ownerkeir.id}", 
  "animal_id" => "#{@billytortoise.id}"})
@brianownsbilly.save

@keirownscecil = Ownership.new({
  "owner_id" => "#{@ownerkeir.id}", 
  "animal_id" => "#{@cecilparrot.id}"})
@keirownscecil.save

binding.pry
nil