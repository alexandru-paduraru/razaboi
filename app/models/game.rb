class Game < ActiveRecord::Base
   
   @@carti_jucator1 = ['1','2']
   @@carti_jucator2 = ['3', '4']
   @@pas
   
   def self.carti_jucator1
    @@carti_jucator1
   end
   
   def self.carti_jucator2
    @@carti_jucator2
   end
   
   def self.pas
    @@pas
   end
   
   def self.set_cards(vector1, vector2)
    @@carti_jucator1 = vector1
    @@carti_jucator2 = vector2
    @@pas = 0
   end
   
   def self.incrementare_pas
    @@pas = @@pas + 1
   end
   
end