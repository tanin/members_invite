module RequestSpecHelper
  def json
    JSON.parse(response.body).deep_symbolize_keys
  end

  def resource
    @controller.send(:resource)
  end
end
