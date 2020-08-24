module Authentication
  class AuthenticationPage < ::GeneralPage
    set_url '?controller=authentication&back=my-account'

    element :sign_in_link, 'a.login'
    element :email_field, '#email'
    element :password_field, '#passwd'
    element :sign_in_button, '#SubmitLogin'

    def login_with(args)
      email_field.set(args[:email])
      password_field.set(args[:password])
      sign_in_button.click
    end
  end
end