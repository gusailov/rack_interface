class Timer
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    body.push("#{Time.now.strftime(@app.params_format)}\n") if @app.params_format_check.empty? && @app.path_check?

    [status, headers, body]
  end
end
