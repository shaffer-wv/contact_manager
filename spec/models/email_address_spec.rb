require 'spec_helper'

describe EmailAddress do
  let(:email_address) do
    EmailAddress.new(address: 'nobody@yahoo.com', contact_id: 1, contact_type: 'Company')
  end
  
  it 'is valid' do
  	expect(email_address).to be_valid
  end

  it 'is invalid without a first_name' do
  	email_address.address = nil
  	expect(email_address).not_to be_valid
  end

  it 'must have a reference to a person' do
  	email_address.contact_id = nil
  	expect(email_address).not_to be_valid
  end
end
