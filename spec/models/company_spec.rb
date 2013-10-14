require 'spec_helper'

describe Company do
  let(:company) { Company.new(name: 'Yahoo') }

  it 'is valid' do
  	expect(company).to be_valid
  end

  it 'not valid without name' do
  	company.name = nil
  	expect(company).to_not be_valid
  end
end
