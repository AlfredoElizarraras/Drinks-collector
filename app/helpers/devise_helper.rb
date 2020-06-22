# frozen_string_literal: true

module DeviseHelper
  def minimum_password_length(form)
    if @minimum_password_length
      form.password_field(:password, autocomplete: 'new-password',
                                     placeholder: "password #{@minimum_password_length} characters long at least")
    else
      form.password_field(:password, autocomplete: 'new-password', placeholder: 'password')
    end
  end

  def rememberable(form)
    render(partial: '/devise/sessions/rememberable', locals: { f: form }) if devise_mapping.rememberable?
  end
end
