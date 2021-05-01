require 'rails_helper'
require_relative "../support/devise"

RSpec.feature "Posts", type: :feature do
    
  

  context "Create new post" do
    before(:each) do
      create_user_and_log_in
      visit new_post_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Post"
      expect(page).to have_content("Post was successfully created")
    end

    scenario "should fail" do
      click_button "Create Post"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update post" do
    let(:post) { Post.create(title: "Test title", description: "Test content") }
    before(:each) do
      create_user_and_log_in
      visit edit_post_path(post)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Post"
      expect(page).to have_content("Post was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Post"
      expect(page).to have_content("Description can't be blank")
    end
  end


  context "Remove existing post" do
    let!(:post) { Post.create(title: "Test title", description: "Test content") }
    scenario "remove post" do
      create_user_and_log_in
      visit posts_path
      click_link "Destroy"
      expect(page).to have_content("Post was successfully destroyed")
      expect(Post.count).to eq(0)
    end
  end
end
