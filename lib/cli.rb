require 'pry'
class Cli
    attr_reader :player

    def self.welcome
        puts "Huh? Do I know you?"
        puts "(yes/no)"
        response = gets.chomp.downcase
        new_or_returning_user(response)
    end

    def self.new_or_returning_user(response)
        if response == 'no'
            puts "Well I can't just call you Bob now can I?" 
            set_player
        elsif response == 'yes'
            puts "Well it's not like you're a celebrity or anything."
            find_player
        else
            puts "I can't help you if you don't help me, buddy. Try again."
            welcome
        end
    end

    def self.set_player
        puts "So what's your first name?"
        first_name = gets.chomp.downcase.capitalize
        puts "I already know three #{first_name}'s. What's your last name?"
        last_name = gets.chomp.downcase.capitalize
        new_player = Player.create(name: "#{first_name} #{last_name}")
        family_vs_adult(new_player)
    end

    def self.find_player
        puts "Remind me what your name is again? Full name if you please, I know a lot of people."
        full_name = gets.chomp.downcase.titleize
        returning_player = Player.find_by name: full_name
        family_vs_adult(returning_player)
    end

    def self.family_vs_adult(player)
        puts "Your name is #{player.name}? Oh man, your parents didn't like you did they?"
        puts "Speaking of parents, would you like a family-friendly game? (Y/n)"
        player_choice = gets.chomp.downcase
        game_choices(player, player_choice)
    end

    def self.game_choices(player, choice)
        if choice == 'n'
            puts "So game night has a keg eh? Fair enough."

        elsif choice == 'y'
            puts "Gam Gam isn't a fan of cursing I guess. Fine."
        else
            puts "This isn't rocket science, y'know. Try again."
            family_vs_adult(player)
        end
        refine_further
    end

end