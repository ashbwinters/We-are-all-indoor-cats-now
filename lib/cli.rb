class Cli < ActiveRecord::Base
    attr_reader :player

    def self.welcome
        puts "Welcome to our game selector!"
        puts "What is your name?"
        player_name = gets.chomp
        set_player(player_name)
    end

    def self.set_player(player_name)
        player = Player.create(name: player_name)
        main_menu(player)
    end

    def self.main_menu(player)
        puts "#{player.name}, would you like a family-friendly game? (Y/n)"
        player_choice = gets.chomp.downcase
        game_choices(player, player_choice)
    end

    def self.game_choices(player, choice)
        if choice == 'n'
            puts "#{player.name}, here are appropriate game choices for adults."
        elsif choice == 'y'
            puts "#{player.name}, here are appropriate game choices for families."
        else
            puts "Invalid choice."
            main_menu(player)
        end
    end

end