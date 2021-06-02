=begin
    Created by Bradley Cochran on 5/29/21

    This file contains methods for creating, dealing, removing, printing, basically
    everything to do with cards.

    *Edited by Bradley Cochran on 5/31/21 to rearrange things inthe the class Board and the 
    methods add_to_table, remove_from_table, set_check, get_board and get_table
=end


#This class defines a card having 4 attributes, and the function to print a card by said attributes.
class Card
    def initialize(cardnumber, cardshape, cardshade, cardcolor)
        @number = cardnumber
        @shape = cardshape
        @shade = cardshade
        @color = cardcolor
    end
    def printCard
        print @number, @shape, @shade, @color, "\n"
    end     
end

class Board
    def initialize
        @deck = create_deck
        @table = Array.new(12)
        deal
    end

    #This method creates a shuffled deck of 81 cards
    def create_deck
        deck = Array.new
    
        numbers = 1..3
        shapes = ["diamond", "squiggle", "oval"]
        shades = ["clear", "shaded", "solid"]
        colors = ["red", "green", "blue"]

        numbers.each do |number|
            shapes.each do |shape|
                shades.each do |shade|
                    colors.each do |color|
                        thiscard = Card.new(number, shape, shade, color)  
                        deck.push thiscard
                    end
                end
            end
        end
        deck.shuffle!
    return deck
    end

    #This method adds additional cards to the table in case there aren't any sets
    def add_cards(howmany)
        howmany.times do
            @table.push @deck.pop
        end
    end

    #This method deals cards onto the table 
    #(table can be an array of nils, or just have some nils and this will fill it in)
    def deal
        @table.map! {|item|
            if item == nil
                item = @deck.pop 
            end 
        }
    end

    #This method removes cards from the table,replacing them with nil (for when a player makes a set)
    #added 5/31
    def remove_from_table(cardno1, cardno2, cardno3)
        @table[cardno1 - 1] = nil
        @table[cardno2 - 1] = nil
        @table[cardno3 - 1] = nil
    end

    #method that copies three cards, puts them in an array and returns them added 5/31
    def set_check(cardno1, cardno2, cardno3)
        three_cards = Array.new(@table[cardno1 - 1], @table[cardno2 - 1], @table[cardno3 - 1])
        
        return three_cards
    end

    #This prints the table, numbered (not prettily for now)
    #edited to be numbered 5/31
    def print_table
        i = 1
        @table.each do |item|
            print i, ". "
            item.printCard
            i += 1
        end
    end

    #Getter for the deck, added 5/31
    def get_deck
        return @deck
    end

    #Getter for the table, added 5/31
    def get_table
        return @table
    end

end

=begin commenting out a few things I used to check methods
testBoard = Board.new

testBoard.add_cards(3)
testBoard.print_table
=end


# Project2
