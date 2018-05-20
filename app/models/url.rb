require 'uri'

class Url < ApplicationRecord
  validates :long_url, presence: true
  validate do |url|
    UrlValidator.new(url).validate
  end

  after_validation :generate_short_url, :sanitize_url!

  def sanitized_url_from_long_url(long_url)
    full_uri = URI(long_url)
    return if full_uri.host.blank?
    full_uri.host.downcase + full_uri.path.downcase + full_uri_query(full_uri)
  end

  private

  def sanitize_url!
    self.sanitized_url = sanitized_url_from_long_url(long_url)
  end

  def generate_short_url
    self.short_url = "http://127.0.0.1/#{SecureRandom.hex(4)}"
  end

  def full_uri_query(full_uri)
    return full_uri&.query&.downcase if full_uri&.query
    ''
  end
end
