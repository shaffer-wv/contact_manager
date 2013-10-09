require 'spec_helper'

describe PhoneNumber do
  let(:phone_number) do
  	PhoneNumber.new(number: '2023139900')
  end

  it 'is valid' do
  	expect(phone_number).to be_valid
  end

  it 'is invalid without a number' do
  	phone_number.number = nil
  	expect(phone_number).not_to be_valid
  end
end
