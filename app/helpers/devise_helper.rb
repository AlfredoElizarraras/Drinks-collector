module DeviseHelper
  def minimum_password_length(f)
    if @minimum_password_length
      f.password_field(:password, autocomplete: "new-password", placeholder: "password #{@minimum_password_length} characters long at least")
    else
      f.password_field(:password, autocomplete: "new-password", placeholder: "password")
    end
  end
end