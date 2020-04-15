class Cli
    attr_reader :player

    def welcome
        puts "Welcome to our game selector!"
        puts "What is your name?"
        player_name = gets.chomp
        set_player(player_name)
    end

    def set_player(player_name)
        @player = Player.new(player_name)
        main_menu
    end

    def main_menu
        puts "#{player.name}, what kind of game are you looking for? Choose from adult or family-friendly."
        player_choice = gets.chomp.downcase
        game_choices(player_choice)
    end

    def game_choices(choice)
        if choice == 'adult'
            puts "#{player.name}, here are appropriate game choices for adults."
        elsif choice == 'family-friendly'
            puts "#{player.name}, here are appropriate game choices for families."
        else
            puts "Invalid choice."
            main_menu
        end
    end

end