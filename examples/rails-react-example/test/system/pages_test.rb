require "application_system_test_case"

class IndexPageTest < ApplicationSystemTestCase
  test "index page button and modal functionality" do
    # Mobile dimensions
    page.driver.browser.manage.window.resize_to(375, 667)

    # Go to index
    visit root_path

    # In our fixtures, we have 10 "new" tickets resulting in a "Show More" link
    assert_css "div#collapsed-toggle-new", visible: :invisible

    # Make sure the visibility of the elements shows when clicked
    click_link "Show More"
    assert_css "div#collapsed-toggle-new", visible: :visible

    # Open the notifications to see Zen Quotes
    find('a.open-modal-button').click
    
    # See 50 Zen Quotes
    within "#dialog-1" do
      assert_selector 'h3', text: /Zen Quotes/
      assert_selector 'li', minimum: 50
    end
  end
end