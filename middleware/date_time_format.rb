class DateTimeFormat
  FORMATS = { 'year' => '%Y', 'month' => '%m', 'day' => '%d',
              'hour' => '%H', 'minute' => '%M', 'second' => '%S' }

  def initialize(string)
    @string = string.split(',')
  end

  def date_time
    Time.now.strftime(string_format)
  end

  def invalid
    (@string - FORMATS.keys)
  end

  private

  def string_format
    @string.map { |a| FORMATS[a] }.join('-')
  end
end
