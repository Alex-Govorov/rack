class Formats
  FORMATS = {
    'year' => '%Y', 'month' => '%m', 'day' => '%d', 'hour' => '%H', 'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(params)
    @formats = params.split(',')
  end

  def valid?
    @unknown_formats = @formats - FORMATS.keys
    @unknown_formats.empty?
  end

  def time
    time_format = @formats.map { |format| FORMATS[format] }.join('-')
    Time.now.strftime(time_format)
  end

  def invalid_formats
    "Unknown time format [#{@unknown_formats.join(', ')}]"
  end
end
