class Cli < ActiveRecord::Base
    attr_reader :player

    def self.welcome
        puts "Welcome to our game selector!"
        puts "What is your name?"
        player_name = gets.chomp
        set_player(player_name)
    end

    def self.set_player(player_name)
        player = Player.new(player_name)
        main_menu(player)
    end

    def self.main_menu(player)
        puts "#{player.name}, what kind of game are you looking for? Choose from adult or family-friendly."
        player_choice = gets.chomp.downcase
        game_choices(player_choice)
    end

    def self.game_choices(choice)
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