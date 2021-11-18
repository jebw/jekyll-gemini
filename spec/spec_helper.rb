# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'jekyll'
require 'jekyll-gemtext'

Jekyll.logger.log_level = :info

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random
  Kernel.srand config.seed
  config.disable_monkey_patching!
  config.raise_errors_for_deprecations!

  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  def capture_stdout(level = :debug)
    buffer = StringIO.new
    Jekyll.logger = Logger.new(buffer)
    Jekyll.logger.log_level = level
    result = yield
    buffer.rewind
    [result, buffer.string.to_s]
  ensure
    Jekyll.logger = Logger.new(StringIO.new, :error)
  end
end
