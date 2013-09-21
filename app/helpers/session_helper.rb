helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end


  def current_game
    if session[:game_id]
      @current_game ||= Game.find(session[:game_id])
    end
  end

  def load_existing_game_on_this_deck(deck_id)
    puts "in load_existing_game_on_this_deck"
    puts "deck_id: #{deck_id}"
    @existing_game = current_user.games.where("deck_id = #{deck_id} AND complete = false").first
    puts @existing_game
    @existing_game
  end 

  def game_in_progress?
    !current_game.nil?
  end

  def current_game_card
    if session[:card_id]
      @current_card ||= Card.find(session[:card_id])
    end
  end

  def next_game_card_id
    temp_card = current_game.cards[current_game.cards.index(current_game_card)+1]
    temp_card ? temp_card.id : nil
  end



  
end