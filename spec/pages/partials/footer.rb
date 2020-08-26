module Partials
  class Footer < ::GeneralPage
    element :footer_container, '.footer-container'
    element :sign_out_link, ".toggle-footer a[href='http://automationpractice.com/index.php?mylogout']"
  end
end

