require 'pry'
class Cli
    attr_reader :player

    def welcome
        puts "Do I know you?"
        puts "(yes/no)"
        response = gets.chomp.downcase
        new_or_returning_user(response)
    end

    def new_or_returning_user(response)
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

    def set_player
        puts "So what's your first name?"
        first_name = gets.chomp.downcase.capitalize
        puts "I already know three #{first_name}'s. What's your last name?"
        last_name = gets.chomp.downcase.capitalize
        @player = Player.find_or_create_by(name: "#{first_name} #{last_name}")
        family_vs_adult
    end

    def find_player
        puts "Remind me what your first name is again?"
        first_name = gets.chomp.downcase.capitalize
        puts "Not ringing a bell. What's your last name?"
        last_name = gets.chomp.downcase.capitalize
        @player = Player.find_or_create_by name: "#{first_name} #{last_name}"
        puts "Your name is #{player.name}?! Oh man, your parents didn't like you did they? Speaking of parents..."
        family_vs_adult
    end

    def family_vs_adult
        puts "Would you like a family-friendly game?"
        puts "(y) I was born a family man!"
        puts "(n) Who needs family when you have booze?"
        player_choice = gets.chomp.downcase
        game_options(player_choice)
    end

    def game_options(choice)
        if choice == 'n'
            puts "So game night has a keg eh? Fair enough."
            results = Game.where family_friendly: false
        elsif choice == 'y'
            puts "Gam Gam isn't a fan of cursing I guess. Fine."
            results = Game.where family_friendly: true
        else
            puts "This isn't rocket science, y'know. Try again."
            family_vs_adult
        end
        refine_further
    end

    def refine_further
        puts "Really? You want me to do more work? Well you aren't having a game night by yourself are you?"
        puts "How many people are playing?"
        puts "a) Just me and a friend."
        puts "b) There's four of us..."
        puts "c) Unless Greg shows up, then it's five."
        puts "d) But Laura's been trying to set Greg up with her friend and ... wait how many people are playing now?"
        response = gets.chomp.downcase
        game_options_refined(response)
    end

    def game_options_refined(response)
        if response == "a"
            puts "You have a friend. That's suprising."
        elsif response == 'b'
            puts "Ah, the double date for nerds."
        elsif response == 'c'
            puts "You and I both know Greg isn't coming."
        elsif response == 'd'
            puts "Well that escalated quickly, didn't it."
        else
            puts "We've discussed this already. Try again."
            refine_further
        end
    end

    def results
        puts "Right. Here you go."
    end

    def play_the_game
        puts "You chose that one? Interesting... I'm just going to make a note... No, it's not about you and no, you can't see it!"
    end

    def thumbs_up_or_down
        puts "Well how else am I going to know if you liked the game? Just... yes or no."
        puts "(y) I freakin' LOVE this game!"
        puts "(n) HOW DARE YOU RECOMMEND THIS GAME TO OTHERS!"
    end

    def change_your_mind
        puts "Having second thoughts eh? Yeah, so am I."
        puts "(y) Maybe I was too harsh..."
        puts "(n) I still hate it. I just wanted to mess with you." 
    end
end