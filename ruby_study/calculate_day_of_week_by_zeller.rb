class CaluculateDayOfWeekByZeller
  DAY_OF_WEEK_CONVERT_HASH = {
    '0' => { japanese_text: '土曜日' },
    '1' => { japanese_text: '日曜日' },
    '2' => { japanese_text: '月曜日' },
    '3' => { japanese_text: '火曜日' },
    '4' => { japanese_text: '水曜日' },
    '5' => { japanese_text: '木曜日' },
    '6' => { japanese_text: '金曜日' }
  }.freeze

  def initialize(year, month, day)
    @year = year.to_i
    @month = month.to_i
    @day = day.to_i
    raise "無効な引数です" if !@year.positive? || !@month.positive? || !@day.positive?

    @year_remainder_divided_by_4 =  @year % 100
  end

  def run
    p "入力した日付は、#{DAY_OF_WEEK_CONVERT_HASH[result][:japanese_text]}です。"
  end

  def result
    (caluculate_zeller % 7).to_s
  end

  def caluculate_zeller
    @day + different_value + @year_remainder_divided_by_4 + year_remainder_divided_by_4_divided_by_4 - year_divided_by_100_multiply_by_2 + year_divided_by_100_divided_by_4
  end

  def different_value
    26 * (@month + 1) / 10
  end

  def year_remainder_divided_by_4_divided_by_4 
    @year_remainder_divided_by_4 / 4
  end

  def year_divided_by_100_multiply_by_2
    2 * year_divided_by_100
  end

  def year_divided_by_100
    @year / 100
  end

  def year_divided_by_100_divided_by_4
    year_divided_by_100 / 4
  end
end

if __FILE__ == $0
  CaluculateDayOfWeekByZeller.new(ARGV[0], ARGV[1], ARGV[2]).run
end
