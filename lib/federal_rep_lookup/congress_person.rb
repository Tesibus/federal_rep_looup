module FederalRepLookup
  CongressPerson = Struct.new(:name, :party, :state, :district, :phone, :office, :link, keyword_init: true)
end
