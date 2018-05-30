require 'rails_helper'

feature "User can search" do
  scenario "user can search for a word to validate" do
    visit "/"
    within(".navbar") do
      fill_in 'q', with: 'foxes'
      click_on 'Validate Word'
    end

    expect(current_path).to eq('/search')



    expect(page).to have_content("'foxes' is a valid word and its root form is fox.")

    within(".navbar") do
      fill_in 'q', with: 'foxez'
      click_on 'Validate Word'
    end


    expect(page).to have_content("'foxez' is not a valid word.")

  end
end
