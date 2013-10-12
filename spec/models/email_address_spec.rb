require 'spec_helper'

describe EmailAddress do
  
  let(:email_address) { EmailAddress.new(address: 'nobody@yahoo.com', person_id: 4) }

  it 'is valid' do
  	expect(email_address).to be_valid
  end

  it 'is invalid without a first_name' do
  	email_address.address = nil
  	expect(email_address).not_to be_valid
  end
end
