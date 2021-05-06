class Timer
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    body.push("Unknown time format #{@app.params_format_check}\n") unless @app.params_format_check.empty?
    body.push("#{Time.now.strftime(@app.params_format)}\n")

    [status, headers, body]
  end
end
