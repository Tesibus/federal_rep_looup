# frozen_string_literal: true

require "federal_rep_lookup"
require 'webmock/rspec'

require 'pry-byebug'

Dir[File.join(__dir__, 'fixtures', '**', '*.rb')].sort.each do |file|
  require file
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
