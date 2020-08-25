module Partials
  class NavBar < ::GeneralPage

    element :sign_in_link, 'a.login'
    element :nav_bar, '.nav'
    element :sign_out_link, 'a.logout'
    element :user_account_link, 'a.account'
    element :contact_us, '#contact-link'

    def nav_bar_for_logged_user_visible?
      all_visible?(:sign_out_link, :user_account_link, :nav_bar, :contact_us)
    end
  end
end