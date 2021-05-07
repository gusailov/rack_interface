class App
  FORMATS = { 'year' => '%Y', 'month' => '%m', 'day' => '%d',
              'hour' => '%H', 'minute' => '%M', 'second' => '%S' }

  def call(env)
    @req = Rack::Request.new(env)
    perform_request
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

  def path_check?
    @req.path == '/time'
  end

  private

  def status
    return  404 unless path_check?
    return  400 unless params_format_check.empty?

    200
  end

  def perform_request
    sleep rand(2..3)
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    return ["Unknown time format #{params_format_check}\n"] unless params_format_check.empty?
    return [] unless path_check?

    ["Welcome\n"]
  end
end
