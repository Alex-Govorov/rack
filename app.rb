class App
  def call(env)
    time_response(env)
    headers = { 'Content-Type' => 'text/plain' }

    [@status, headers, @body]
  end

  private

  def time_response(env)
    req = Rack::Request.new(env)
    params = req.params['format']
    formatter = Formats.new(params)

    if formatter.valid?
      @status = 200
      @body = [formatter.time]
    else
      @status = 400
      @body = [formatter.invalid_formats]
    end
  end
end
