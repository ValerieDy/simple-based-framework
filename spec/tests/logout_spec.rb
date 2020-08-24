RSpec.describe "Log out" do
  let!(:nav_bar) { Partials::NavBar.new }
  let(:home_page) { Home::HomePage.new }
  let(:authentication_page) { Authentication::AuthenticationPage.new }

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

  context 'User logs out the account' do
    it 'should log out' do
      expect(nav_bar).to be_nav_bar_for_logged_user_visible
      nav_bar.logout_link.click

      expect(nav_bar).to_not have_logout_link
      expect(nav_bar).to_not have_user_account_link
      expect(authentication_page).to be_displayed
      expect(authentication_page).to be_all_there
    end
  end
end