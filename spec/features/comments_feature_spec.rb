require 'rails_helper'

feature 'commenting' do
  before do
    upload_photo
  end

  scenario 'allows user to leave a comment using a form' do
    visit "/photos/#{Photo.last.id}"
    fill_in "Content", with: "Stunning!"
    click_button 'Leave Comment'
    expect(page).to have_content 'Stunning!'
    expect(current_path).to eq "/photos/#{Photo.last.id}"
  end
end