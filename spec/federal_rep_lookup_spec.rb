# frozen_string_literal: true

RSpec.describe FederalRepLookup do
  it "provides an interface for looking up representatives" do
    zipcode = '99999'
    stub_request(:get, 'https://whoismyrepresentative.com/getall_mems.php').
      with(query: { zip: zipcode, output: :json }).
      to_return(WhoIsMyRepresentativeResponses.valid_response)

    result = FederalRepLookup.lookup(zipcode:)

    expect(result.length).to eq(2)
    expect(result.first.name).to eq('Test Representative')
    expect(result.last.name).to eq('Test Senator')
  end
end
