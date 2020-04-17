require 'pry'
class Cli
    attr_reader :player, :board_game, :review

    def welcome
        puts "Do I know you?"
        puts "(y) I thought we were friends!"
        puts "(n) Not that I know of."
        response = gets.chomp.downcase
        new_or_returning_user(response)
    end

    def new_or_returning_user(response)
        if response == 'n'
            puts "Well I can't just call you Bob now can I?" 
            set_player
        elsif response == 'y'
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
        puts "Your name is #{player.name}?! Oh man, your parents didn't like you did they? Speaking of parents..."
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
        family_friendly_options(player_choice)
    end

    def family_friendly_options(choice)
        if choice == 'n'
            puts "So game night has a keg eh? Fair enough."
            results = Game.where family_friendly: false
            display_results(results)
        elsif choice == 'y'
            puts "Gam Gam isn't a fan of cursing I guess. Fine."
            results = Game.where family_friendly: true
            display_results(results)
        else
            puts "This isn't rocket science, y'know. Try again."
            family_vs_adult
        end
    end

    def display_results(games)
        puts "Right. Here you go."
        games.each do |game|
            puts game.name
            puts "For #{game.players_min}-#{game.players_max} players"
            puts game.description
            puts " "
        end
        pick_a_game
    end

    def pick_a_game
        puts "So what'll it be?"
        puts "Enter the name of the game you want to play."
        response = gets.chomp.downcase.titleize
        @board_game = Game.find_by(name: response)
        if board_game == nil
            puts "I gave you options. Pick one."
            pick_a_game
        else
            puts "You chose that one? Interesting... I'm just going to make a note... No, it's not about you and no, you can't see it!"
            new_review
        end
    end

    def thumbs_up_or_down
        puts "Would you recommend this game to others? Just... yes or no."
        puts "(y) I freakin' LOVE this game!"
        puts "(n) HOW DARE YOU RECOMMEND THIS GAME TO ANYONE!"
        response = gets.chomp.downcase
    end

    def new_review
        response = thumbs_up_or_down 
        if response == "y"
            Review.create(rating: true, player_id: player.id, game_id: board_game.id)
        elsif response == 'n'
            Review.create(rating: false, player_id: player.id, game_id: board_game.id)
        else
            puts "I don't know why this is so hard for you. Try again."
            new_review
        end
        puts "Well then my job is done... Wait you're still here? Why?"
        reviews_query
    end

    def reviews_query
        puts "You want to see all of your recommendations don't you?"
        puts "(y) Now that you've mentioned it..."
        puts "(n) Why would I want to do that?"
        response = gets.chomp.downcase
        if response == "y"
            see_my_reviews
        elsif response == 'n'
            puts "Well then what are you still doing here? I've got a lot to do y'know. Shoo!"
        else
            puts "If I cared about you, I'd probably be worried about this. Try again."
            reviews_query
        end
    end

    def see_my_reviews
        player.reviews.each do |review|
            puts "I would recommend #{review.game.name} to others: #{review.rating}"
        end
        puts "Why do you have that look? You're going to make me do more work aren't you..."
            change_your_mind
    end

    
    def change_your_mind
        puts "Having second thoughts eh? Yeah, so am I."
        puts "(y) Maybe I was too harsh..."
        puts "(n) I just wanted to mess with you." 
        response = gets.chomp.downcase
        if response == "y"
            pick_a_review
        elsif response == "n"
            puts "Well then what are you still doing here? I've got a lot to do y'know. Shoo!"
        else
            puts "If I cared about you, I'd probably be worried about this. Try again."
            change_your_mind
        end
    end

    def pick_a_review
        puts "Fine. Which review do you want to change?"
        puts "<Enter Game>"
        response = gets.chomp.downcase.titleize
        @board_game = Game.find_by(name: response)
        if board_game == nil
            puts "Seriously? Pick one."
            pick_a_review
        else
            find_review_that_needs_changing
        end 
    end

    def find_review_that_needs_changing
        @review = Review.where(player_id: player.id).where game_id: board_game.id
        if review == nil
            puts "You didn't even... Just... Try again."
            pick_a_review
        else
            puts "Ok then... "
            change_review
        end 
    end

    def change_review
        response = thumbs_up_or_down
        if response == "y"
            review.update(rating: true)
        elsif response == 'n'
            review.update(rating: false)
        else
            puts "I don't know why this is so hard for you. Try again."
            change_review
        end
    end
end