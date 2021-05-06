class App
  FORMATS = { 'year' => '%Y', 'month' => '%m', 'day' => '%d',
              'hour' => '%H', 'minute' => '%M', 'second' => '%S' }

  def call(env)
    @req = Rack::Request.new(env)
    # perform_request
    [status, headers, body]
  end

  def params
    @req.params['format'].split(',')
  end

  def params_format_check
    (params - FORMATS.keys)
  end

  def params_format
    params.map { |a| FORMATS[a] }.join('-')
  end

  private

  def status
    return status = 404 unless @req.path == '/time'
    return status = 400 unless params_format_check.empty?

    200
  end

  def perform_request
    sleep rand(2..3)
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    # return ["Unknown time format #{params_format_check}\n"] unless params_format_check.empty?

    ["Welcome\n"]
  end
end
