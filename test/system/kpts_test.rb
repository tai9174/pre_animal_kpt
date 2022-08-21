require "application_system_test_case"

class KptsTest < ApplicationSystemTestCase
  setup do
    @kpt = kpts(:one)
  end

  test "visiting the index" do
    visit kpts_url
    assert_selector "h1", text: "Kpts"
  end

  test "creating a Kpt" do
    visit kpts_url
    click_on "New Kpt"

    check "Favorite" if @kpt.favorite
    fill_in "Keep content", with: @kpt.keep_content
    fill_in "Keep status", with: @kpt.keep_status
    fill_in "Problem content", with: @kpt.problem_content
    fill_in "Problem status", with: @kpt.problem_status
    fill_in "Try content", with: @kpt.try_content
    fill_in "Try status", with: @kpt.try_status
    click_on "Create Kpt"

    assert_text "Kpt was successfully created"
    click_on "Back"
  end

  test "updating a Kpt" do
    visit kpts_url
    click_on "Edit", match: :first

    check "Favorite" if @kpt.favorite
    fill_in "Keep content", with: @kpt.keep_content
    fill_in "Keep status", with: @kpt.keep_status
    fill_in "Problem content", with: @kpt.problem_content
    fill_in "Problem status", with: @kpt.problem_status
    fill_in "Try content", with: @kpt.try_content
    fill_in "Try status", with: @kpt.try_status
    click_on "Update Kpt"

    assert_text "Kpt was successfully updated"
    click_on "Back"
  end

  test "destroying a Kpt" do
    visit kpts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kpt was successfully destroyed"
  end
end
