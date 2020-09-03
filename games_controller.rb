require './message_dialog'

class GamesController
  include MessageDialog

  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  def battle(**params)
    build_characters(params)
    teki
    loop do
      menu_message
      @menu = gets.to_i
      @brave.attack(@monster,@menu)
      break if battle_end? 
      gets
      @monster.attack(@brave)
      break if battle_end?
      sleep 0.4
    end

    sleep 0.7
    battle_juddgment
  end

  private

    def battle_juddgment
        result = calculate_of_exp_and_gold
        end_message(result)
    end

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      @brave.hp <= 0 || @monster.hp <= 0
    end

    def brave_win?
      @brave.hp > 0
    end

    def calculate_of_exp_and_gold
      if brave_win?
        brave_win_flag = true
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      else
        brave_win_flag = false
        exp = 0
        gold = 0
      end

      {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
    end
end