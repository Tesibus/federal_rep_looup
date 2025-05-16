# frozen_string_literal: true

require 'uri'
require 'json'
require 'faraday'

require_relative "federal_rep_lookup/version"
require_relative "federal_rep_lookup/congress_person"
require_relative "federal_rep_lookup/who_is_my_rep_client"

module FederalRepLookup
  class Error < StandardError; end

  def self.lookup(zipcode:)
    WhoIsMyRepClient.new.lookup(zipcode:)
  end
end
