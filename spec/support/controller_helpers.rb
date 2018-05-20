module ControllerHelpers
  extend ActiveSupport::Concern

  def json_body
    response = subject.body || response.body
    @json_body ||= JSON.parse(response)
  end
end
