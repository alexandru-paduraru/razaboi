class Game < ActiveRecord::Base
   
   @@carti_jucator1 = []
   @@carti_jucator2 = []
   @@pas = 0
   
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
   
   def self.primele_carti_jucator1(numar)
        carti = []
        if @@carti_jucator1.count > numar
            carti = @@carti_jucator1.shift(numar)
        else
          carti = @@carti_jucator1
          @@carti_jucator1 = []  
        end
        carti
   end
   
   def self.primele_carti_jucator2(numar)
        carti = []
        if @@carti_jucator2.count > numar
            carti = @@carti_jucator2.shift(numar)
        else
          carti = @@carti_jucator2
          @@carti_jucator2 = []  
        end
        carti
   end 
   
   def self.resetare
       @@pas = 0
       @@carti_jucator1 = []
       @@carti_jucator2 = []
   end   
end