module WhoIsMyRepresentativeResponses
  def self.valid_response
    {
      body: {
        "results": [
          {
            "name": "Test Representative",
            "party": "Republican",
            "state": "LA",
            "district": "6",
            "phone": "555-555-5000",
            "office": "123 Rayburn House Office Building; Washington DC 20515-1806",
            "link": "https://testrepresentative.house.gov",
          },
          {
            "name": "Test Senator",
            "party": "Democrate",
            "state": "LA",
            "district": "",
            "phone": "555-555-4000",
            "office": "456 Hart Senate Office Building Washington DC 20510",
            "link": "https://www.testsenator.senate.gov",
          },
        ]
      }.to_json,
      status: 200,
    }
  end

  def self.not_found_response
    { body: "<result message='No Data Found' />", status: 200 }
  end
end
