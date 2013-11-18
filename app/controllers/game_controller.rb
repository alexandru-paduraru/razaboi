class GameController < ApplicationController
    
    def from_c
#         hash_string = %x(./app/controllers/a.out)
#         hash_string
#         hash_string = from_c
#         @cards = []
#         card = JSON.parse(hash_string)
#         @cards.append(card)
        carte1 = {}
        carte1[:numar] = 1
        carte1[:culoare] = '&hearts;'
        
        carte2 = {}
        carte2[:numar] = 2
        carte2[:culoare] = '&diams;'
        
        carte3 = {}
        carte3[:numar] = 3
        carte3[:culoare] = '&hearts;'
        
        carte4 = {}
        carte4[:numar] = 7
        carte4[:culoare] = '&clubs;'

        carte5 = {}
        carte5[:numar] = 5
        carte5[:culoare] = '&diams;'
        
        carte6 = {}
        carte6[:numar] = 6
        carte6[:culoare] = '&clubs;'
        Game.set_cards([carte2, carte6 ,carte4, carte5, carte3, carte2],[carte2, carte4,carte6, carte2, carte5, carte3,carte2])

    end

    def index
        render 'index'
    end
    
    def play
        Game.incrementare_pas
        @carti1 = Game.carti_jucator1.map{|i| i[:numar]}.flatten
        @carti2 = Game.carti_jucator2.map{|i| i[:numar]}.flatten
        @pas = Game.pas
        @extra_carti1 = []
        @extra_carti2 = [] 
        @message = {}
        if Game.carti_jucator2.count == 0
            @message[:info] = "Ai castigat"
            @message[:winner] = 1
            @carte_jucator1 = nil
            @carte_jucator2 = nil
        elsif Game.carti_jucator1.count == 0
            @message[:info] = "Ai pierdut"
            @message[:winner] = 2
            @carte_jucator1 = nil
            @carte_jucator2 = nil
        else
            @numar1 = Game.carti_jucator1.count
            @carte_jucator1 = Game.carti_jucator1.shift
            
            @numar2 = Game.carti_jucator2.count
            @carte_jucator2 = Game.carti_jucator2.shift
                        
             if @carte_jucator1[:numar] == @carte_jucator2[:numar]
             
                @extra_carti1 = Game.primele_carti_jucator1(@carte_jucator1[:numar])
                @extra_carti2 = Game.primele_carti_jucator2(@carte_jucator1[:numar])
                
                if @extra_carti1.any?
                    @message[:info] = "Razboi. Ai ramas fara carti."
                    @message[:winner] = 2
                    if @carte_jucator1[:numar] < @extra_carti2.last[:numar]
                        Game.carti_jucator2.push(@carte_jucator1)
                        Game.carti_jucator2.push(@carte_jucator2)
                        Game.carti_jucator2.concat(@extra_carti2)
                    else       
                        Game.carti_jucator1.push(@carte_jucator2)
                        Game.carti_jucator1.concat(@extra_carti2)
                        Game.carti_jucator1.push(@carte_jucator1)

                    end
                elsif @extra_carti2.any? == false
                    @message[:info] = "Razboi. Dusmanu a ramas fara carti."
                    @message[:winner] = 1
                    if @carte_jucator2[:numar] < @extra_carti1.last[:numar]
                        Game.carti_jucator1.push(@carte_jucator2)
                        Game.carti_jucator1.push(@carte_jucator1)
                        Game.carti_jucator1.concat(@extra_carti1)
                    else
                        Game.carti_jucator2.push(@carte_jucator1)
                        Game.carti_jucator2.concat(@extra_carti1)
                        Game.carti_jucator2.push(@carte_jucator2)
                    end

                elsif @extra_carti1.last[:numar] > @extra_carti2.last[:numar]
                    @message[:info] = "Razboi. Vei castiga cartile."
                    @message[:winner] = 1
                    Game.carti_jucator1.push(@carte_jucator2)
                    Game.carti_jucator1.concat(@extra_carti2)
                    Game.carti_jucator1.push(@carte_jucator1)
                    Game.carti_jucator1.concat(@extra_carti1)
                else
                    @message[:info] = "Razboi. Vei pierde cartile."
                    @message[:winner] = 2
                    Game.carti_jucator2.push(@carte_jucator1)
                    Game.carti_jucator2.concat(@extra_carti1)
                    Game.carti_jucator2.push(@carte_jucator2)
                    Game.carti_jucator2.concat(@extra_carti2)
                end
            
            
            
            elsif @carte_jucator1[:numar] > @carte_jucator2[:numar]
                @message[:info] = "Ai castigat cartile."
                @message[:winner] = 1
                Game.carti_jucator1.push(@carte_jucator2)
                Game.carti_jucator1.push(@carte_jucator1)
            else
                @message[:info] = "Ai pierdut cartile."
                @message[:winner] = 2
                Game.carti_jucator2.push(@carte_jucator1)
                Game.carti_jucator2.push(@carte_jucator2)
            end
        end
        
        respond_to do |format|
            format.html{ render 'play'}
            format.js
        end
    end
    
    def deal
        from_c
        @pas = 0
        @message = {}
        @carte_jucator1 = nil
        @carte_jucator2 = nil                
        
        @numar1 = Game.carti_jucator1.count            
        @numar2 = Game.carti_jucator2.count
        
        respond_to do |format|
            format.html{render 'play'}
        end
        
    end
    
    

end
