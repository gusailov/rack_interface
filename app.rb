class App
  def call(env)
    @req = Rack::Request.new(env)
    @date_time_format = DateTimeFormat.new(@req.params['format'])
    perform_request

    if !path_check?
      response(404, '')
    elsif @date_time_format.invalid.any?
      response(400, "Unknown data time format #{@date_time_format.invalid}\n")
    else
      response(200, "#{@date_time_format.date_time}\n")
    end
  end

  private

  def path_check?
    @req.path == '/time'
  end

  def response(status, body)
    [status, { 'Content-Type' => 'text/plain' }, [body]]
  end

  def perform_request
    sleep rand(2..3)
  end
end
