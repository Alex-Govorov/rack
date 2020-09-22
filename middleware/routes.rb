class Routes
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    req.path_info == '/time' ? found(env) : not_found
  end

  private

  def not_found
    [404, { 'Content-Type' => 'text/plain' }, ["Not Found!\n"]]
  end

  def found(env)
    status, headers, body = @app.call(env)
    [status, headers, body]
  end
end
