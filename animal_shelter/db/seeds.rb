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
  "type" => "exotic - terrapin",
  "bio" => "Billy came to us after she cruelly outlived her previous owners. We were very surprised last year when, having not seen another of her kind for at least as long as she was here, Billy laid a clutch of eggs - before that, we thought she was a boy."})
@billytortoise.save

@sophiesnake = Animal.new({
  "name" => "Sophie", 
  "adoptable" => "no - recent surgery", 
  "admission_date" => "09/02/2015", 
  "type" => "exotic - ball python",
  "bio" => "Sophie came to us with quite a few stories. Her last owner had tried to feed her live mice and rats, some bigger than her - this isn't advisable with a small, captive snake, as they don't have the killer instinct a cat or dog does and will just be injured, as Sophie has been. Since then, she's been recovering apace, and enjoying her (dead) food. Recently, Sophie had to have minor surgery after complications from previous injuries, but she's expected to make a full recovery."})
@sophiesnake.save

@cecilparrot = Animal.new({
  "name" => "Cecil", 
  "adoptable" => "no - owned by Keir", 
  "admission_date" => "05/05/2010", 
  "type" => "exotic - African grey parrot",
  "bio" => "Cecil is an African grey parrot, one of the longest-lived and smartest birds there are. We know he's very smart, because he was found outside a library. He's fluent in the profanities of twelve languages, a skill which he often uses to try to get a rise out of nearby humans. Since 2012, Cecil has been owned by a friend of the shelter, Keir."})
@cecilparrot.save

@brothersnake = Animal.new({
  "name" => "Brother", 
  "adoptable" => "yes - good temperament. Escapes often. advise owner", 
  "admission_date" => "04/08/2016", 
  "type" => "exotic - Russian rat snake",
  "bio" => "While Russian rat snakes are allegedly very good for beginners, they are also quite good at escape artistry. Brother's last owner punched him in the face when he suddenly popped up beside them on the sofa, but he took no lasting injuries from it. Brother is friendly and ready for a good home."})
@brothersnake.save

@billybobsnake = Animal.new({
  "name" => "Billybob",
  "adoptable" => "No - rehab after unsuitable diet",
  "admission_date" => "05/05/2016",
  "type" => "exotic - Corn snake",
  "bio" => "We named Billy-Bob here Billy-Bob because he was literally corn-fed. His previous owners left a six year-old child to care for him without supervision, and the child fed him corn on the cob, misled by the name. Billy-Bob was badly poisoned, as snakes can only eat meat. We are still waiting to find out from the vets if Billy-Bob will survive."
  })

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