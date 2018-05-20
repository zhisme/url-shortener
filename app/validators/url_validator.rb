require 'uri'

class UrlValidator < ActiveModel::Validator
  def initialize(record)
    @record = record
  end

  def validate
    validate_long_url(record.long_url)
    validate_uniq_sanitized(record.long_url)
  end

  private

  attr_reader :record

  def validate_uniq_sanitized(long_url)
    return unless Url.exists?(sanitized_url: record.sanitized_url_from_long_url(long_url))
    record.errors[:sanitized_url] << 'Url is already presented in DB.'
  end

  def validate_long_url(long_url)
    return if long_url =~ URI::DEFAULT_PARSER.make_regexp
    return if URI.parse(long_url).host.present?
    record.errors[:long_url] << 'Full url is invalid.'
  end
end
