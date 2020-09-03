require './brave'

module MessageDialog
  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃！"
    puts "必殺攻撃！！" if attack_type == "special_attack"
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS

    #{target.name}は"#{damage}のダメージを受けた！
    #{target.name}の残りHPは#{target.hp}だ！

    EOS
  end

  def end_message(result)
    if result[:brave_win_flag]
      puts <<~EOS

      勇者は勝った！！
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた！

      EOS
    else
      puts <<~EOS

      勇者は負けた
      目の前が真っ暗になった...

      EOS
    end
  end

  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    puts <<~EOS

    #{origin_name}は怒っている
    #{origin_name}は#{transform_name}に変身した！

    EOS
  end

  def recovery_message(**params)

    puts "#{@name}は薬草を使った！"
    puts "HPが#{200}回復しHPが#{@hp}になった！"
  end

  def menu_message
    puts "どうする？"
    puts "1:戦う　2:回復　3:降参"
  end

  def teki
    puts <<~TEXT


    スライムがあわられた！

    　　　　　　　　　　 i⌒i
    　　　　　　　　　　 |　|
    　　　　　　　　 ,,ｒ’　‘ヽ、
    　　　　　　,,r‐”　　　　　 ヽ､
    　　　　 ／　　　　　　　　　　＼
    　　　 /　　　（ ･ ）（ ･ ）　　ヽ
    　　　 |　　 ,-､　　  　,-､　    |
    　　　 ヽ　　 ヽ､ ￣￣￣　ノ　　/
    　　　　 `-､　　｀￣￣￣´　　／
    　　　　　　 ￣￣￣￣￣￣￣
    TEXT
  end
end
