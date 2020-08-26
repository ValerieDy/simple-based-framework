RSpec.describe 'Log out' do
  let!(:nav_bar) { Partials::NavBar.new }
  let(:home_page) { Home::HomePage.new }
  let(:authentication_page) { Authentication::AuthenticationPage.new }
  let(:footer) { Partials::Footer.new }

  let(:user_data) do
    {
      email: 'val.oceanica@gmail.com',
      password: 'test1234!'
    }
  end

  before do
    home_page.load
    nav_bar.sign_in_link.click
    authentication_page.login_with(user_data)
  end

  context 'User logs out the account via navbar' do
    it 'should log out' do
      expect(nav_bar).to be_nav_bar_for_logged_user_visible
      nav_bar.sign_out_link.click

      expect(nav_bar).to_not have_sign_out_link
      expect(nav_bar).to_not have_user_account_link
      expect(footer).to_not have_sign_out_link
      # to check url
      expect(authentication_page).to be_displayed
      # to check selectors
      expect(authentication_page).to be_all_there
    end
  end

  context 'User logs out the account via footer' do
    it 'should log out' do
      expect(nav_bar).to be_nav_bar_for_logged_user_visible
      footer.sign_out_link.click

      expect(footer).to_not have_sign_out_link
      expect(nav_bar).to_not have_sign_out_link
      expect(nav_bar).to_not have_user_account_link
      expect(nav_bar).to be_nav_bar_for_not_logged_user_visible
      # to check url
      expect(authentication_page).to be_displayed
      # to check selectors
      expect(authentication_page).to be_all_there
    end
  end

  context 'User logs out the account via changing url directly' do
    it 'should log out' do
      expect(nav_bar).to be_nav_bar_for_logged_user_visible

      visit 'http://automationpractice.com/index.php?mylogout='

      expect(footer).to_not have_sign_out_link
      expect(nav_bar).to_not have_sign_out_link
      expect(nav_bar).to_not have_user_account_link
      expect(nav_bar).to be_nav_bar_for_not_logged_user_visible
      # to check url
      expect(home_page).to be_displayed
    end
  end
end