# frozen_string_literal: true

RSpec.describe FederalRepLookup::WhoIsMyRepClient do
  describe '#lookup' do
    it 'looks up the congress people by zipcode and returns them' do
      zipcode = '99999'
      stub_request(:get, 'https://whoismyrepresentative.com/getall_mems.php').
        with(query: { zip: zipcode, output: :json }).
        to_return(WhoIsMyRepresentativeResponses.valid_response)

      result = subject.lookup(zipcode:)

      expect(result.length).to eq(2)

      test_representative = result.first
      expect(test_representative.name).to eq('Test Representative')
      expect(test_representative.party).to eq("Republican")
      expect(test_representative.state).to eq("LA")
      expect(test_representative.district).to eq("6")
      expect(test_representative.phone).to eq("555-555-5000")
      expect(test_representative.office).to eq("123 Rayburn House Office Building; Washington DC 20515-1806")
      expect(test_representative.link).to eq("https://testrepresentative.house.gov")

      test_senator = result.last
      expect(test_senator.name).to eq("Test Senator")
      expect(test_senator.party).to eq("Democrate")
      expect(test_senator.state).to eq("LA")
      expect(test_senator.district).to eq("")
      expect(test_senator.phone).to eq("555-555-4000")
      expect(test_senator.office).to eq("456 Hart Senate Office Building Washington DC 20510")
      expect(test_senator.link).to eq("https://www.testsenator.senate.gov")
    end

    context 'no congress people are found' do
      it 'returns an empty array' do
        zipcode = '99999'
        stub_request(:get, 'https://whoismyrepresentative.com/getall_mems.php').
          with(query: { zip: zipcode, output: :json }).
          to_return(WhoIsMyRepresentativeResponses.not_found_response)

        result = subject.lookup(zipcode:)

        expect(result).to eq([])
      end
    end
  end
end
