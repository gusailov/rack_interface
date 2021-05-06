class App
  def call(_env)
    perform_request
    [status, headers, body]
  end

  private

  def perform_request
    sleep rand(2..3)
  end

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    ["Welocome aboard!\n"]
  end
end
