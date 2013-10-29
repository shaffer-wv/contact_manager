require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the company view', type: :feature do

	let(:company) { Company.create(name: 'Yahoo') }

	describe 'phone numbers' do
		before(:each) do
			company.phone_numbers.create(number: "555-6767")
			company.phone_numbers.create(number: "555-3333")
			visit company_path(company)
		end

		it 'shows the phone numbers' do
			company.phone_numbers.each do |phone|
				expect(page).to have_content(phone.number)
			end
		end

		it 'has a link to add a new phone number' do
			expect(page).to have_link('Add Phone Number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
		end

		it 'adds a new phone number' do
			page.click_link('Add Phone Number')
			page.fill_in('Number', with: '555-8888')
			page.click_button('Create Phone number')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('555-8888')
		end

		it 'has links to edit phone_numbers' do
			company.phone_numbers.each do |phone|
				expect(page).to have_link('edit', href: edit_phone_number_path(phone))
			end
		end

		it 'edits a phone number' do
			phone = company.phone_numbers.first
			old_number = phone.number

			first(:link, 'edit').click
			page.fill_in('Number', with: '555-9191')
			page.click_button('Update Phone number')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('555-9191')
			expect(page).to_not have_content(old_number)
		end

		it 'has links to delete phone numbers' do
			company.phone_numbers.each do |phone|
				expect(page).to have_link('Delete', href: phone_number_path(phone))
			end
		end

		it 'deletes a phone number' do
			phone = company.phone_numbers.first
			old_number = phone.number
			first(:link, 'Delete').click
			expect(page).to_not have_content(old_number)
		end	
	end

	describe 'the email addresses view' do
		before(:each) do
			company.email_addresses.create(address: "nobody@yahoo.com")
			company.email_addresses.create(address: "somebody@gmail.com")
			visit company_path(company)
		end

		it 'shows the email addresses' do
			company.email_addresses.each do |email|
				expect(page).to have_content(email.address)
			end
		end

		it 'has a link to add new email address' do
			expect(page).to have_link('Add Email Address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
		end

		it 'adds a new email address' do
			page.click_link('Add Email Address')
			page.fill_in('Address', with: 'yep@gmail.com')
			page.click_button('Create Email address')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('yep@gmail.com')
		end

		it 'has links to edit email addresses' do
			company.email_addresses.each do |email|
				expect(page).to have_link('edit', href: edit_email_address_path(email))
			end
		end

		it 'edits an email address' do
			email = company.email_addresses.first
			old_address = email.address
			first(:link, 'edit').click
			page.fill_in('Address', with: 'someone@yahoo.com')
			page.click_button('Update Email address')
			expect(current_path).to eq(company_path(company))
			expect(page).to have_content('someone@yahoo.com')
			expect(page).to_not have_content(old_address)
		end

		it 'has links to delete email addresses' do
			company.email_addresses.each do |email|
				expect(page).to have_link('Delete', href: email_address_path(email))
			end
		end

		it 'deletes an email address' do
			email = company.email_addresses.first
			old_email = email.address
			first(:link, 'Delete').click
			expect(page).to_not have_content(old_email)
		end
	end
end