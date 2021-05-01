require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do


  scenario "The visitor should see posts" do
    create_user_and_log_in
    visit root_path
    expect(page).to have_text("Posts")
  end
end
