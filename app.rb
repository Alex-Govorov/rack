class App
  def call(env)
    @env = env
    [status, headers, body]
  end

  private

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    req = Rack::Request.new(@env)
    formats = req.params['format']

    formats.gsub!(',', '-')
    formats.sub!('year', '%Y')
    formats.sub!('month', '%m')
    formats.sub!('day', '%d')
    formats.sub!('hour', '%H')
    formats.sub!('minute', '%M')
    formats.sub!('second', '%S')

    [Time.now.strftime(formats)]
  end
end
