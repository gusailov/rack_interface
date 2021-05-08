class App
  def call(env)
    req = Rack::Request.new(env)

    if req.path == '/time'
      time_response(req)
    else
      response(404, 'The requested resource is not available')
    end
  end

  private

  def time_response(req)
    format_string = req.params['format']

    if format_string
      check_format_response(format_string)
    else
      response(400, 'Format not found')
    end
  end

  def check_format_response(format_string)
    date_time_format = DateTimeFormat.new(format_string)

    if date_time_format.invalid.any?
      response(400, "Unknown data time format #{date_time_format.invalid}\n")
    else
      response(200, "#{date_time_format.date_time}\n")
    end
  end

  def response(status, body)
    [status, { 'Content-Type' => 'text/plain' }, [body]]
  end
end
