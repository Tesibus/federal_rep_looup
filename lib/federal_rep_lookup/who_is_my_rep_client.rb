module FederalRepLookup
  class WhoIsMyRepClient
    BASE_URL = "https://whoismyrepresentative.com/getall_mems.php"

    def lookup(zipcode:)
      encoded_params = URI.encode_www_form(
        zip: zipcode,
        output: :json,
      )
      url = [BASE_URL, '?', encoded_params].join
      response = Faraday.get(url)

      results = JSON.parse(response.body)['results']
      results.map do |result|
        CongressPerson.new(**result)
      end
    rescue JSON::ParserError
      if response.body.match?(/message=['"]No Data Found['"]/)
        # When no congress people are found for a zipcode the service returns
        # an XML document. That cannot be parsed as JSON so we rescue the parse
        # error and return an empty array if the not found message appears.
        []
      else
        raise
      end
    end
  end
end
