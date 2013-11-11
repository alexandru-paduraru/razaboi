class GameController < ApplicationController

    def from_c
        integer = %x(./app/controllers/a.out)
        integer
    end


    def index
        render 'index'
    end
    
    def play
        @response = from_c
        render 'play'
    end
    
    

end
