class GameController < ApplicationController
    
    def from_c
#         hash_string = %x(./app/controllers/a.out)
#         hash_string
#         hash_string = from_c
#         @cards = []
#         card = JSON.parse(hash_string)
#         @cards.append(card)
        carte1 = {}
        carte1[:numar] = 10
        carte1[:culoare] = '&hearts;'
        carte3 = {}
        carte3[:numar] = 5
        carte3[:culoare] = '&spades;'
        carte4 = {}
        carte4[:numar] = 7
        carte4[:culoare] = '&spades;'
        carte2 = {}
        carte2[:numar] = 11
        carte2[:culoare] = '&spades;'
        Game.set_cards([carte1, carte3, carte4, carte2], [carte3, carte2,carte1,carte4])
    end

    def index
        from_c
        render 'index'
    end
    
    def play
        Game.incrementare_pas
        @pas = Game.pas
        if Game.carti_jucator2.count == 0
            @message = "Ai castigat"
            @carte_jucator1 = nil
            @carte_jucator2 = nil
        elsif Game.carti_jucator1.count == 0
            @message = "Ai pierdut"
            @carte_jucator1 = nil
            @carte_jucator2 = nil
        else
            @carte_jucator1 = Game.carti_jucator1.shift
            @carte_jucator2 = Game.carti_jucator2.shift
            if @carte_jucator1[:numar] > @carte_jucator2[:numar]
                @message = "Ai luat cartile."
                Game.carti_jucator1.append(@carte_jucator2)
            else
                @message = "Ai pierdut cartile."
                Game.carti_jucator2.append(@carte_jucator1)
            end
        end
        render 'play'
    end
    
    

end
