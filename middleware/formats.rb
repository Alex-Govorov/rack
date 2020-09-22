class Formats
  FORMATS = %w[year month day hour minute second].freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    formats = req.params['format'].split(',')
    unknown_formats = formats - FORMATS
    unknown_formats.empty? ? found(env) : not_found(unknown_formats)
  end

  private

  def not_found(unknown_formats)
    [
      400,
      { 'Content-Type' => 'text/plain' },
      ["Unknown time format [#{unknown_formats.join(', ')}]\n"]
    ]
  end

  def found(env)
    status, headers, body = @app.call(env)
    [status, headers, body]
  end
end
