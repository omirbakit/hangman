class ConsoleInterface
  FIGURES =
    Dir["#{__dir__}/../data/figures/*.txt"].
      sort.
      map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts  "Слово: #{word_to_show}".green
    puts  "#{figure}".light_yellow
    puts  "Ошибки (#{@game.errors_made}): #{errors_to_show}".light_red
    puts  "У вас осталось ошибок: #{@game.errors_allowed}".light_blue

    if @game.won?
      puts "Поздравляем, вы выграли!"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}"
    end
  end

  def figure
    return FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__"
        else
          letter
        end
      end
    result.join(' ')
  end

  def errors_to_show
    @game.errors.join(', ')
  end

  def get_input
    print "Введите следующую букву:"
    gets[0].upcase
  end
end

