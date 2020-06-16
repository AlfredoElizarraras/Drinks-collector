# frozen_string_literal: true

module UsersHelper
  def profile_image(user)
    if user.gravatar_url.nil?
      render html: image_tag('https://image.flaticon.com/icons/svg/2919/2919573.svg',
                             alt: 'profile image', class: 'rounded-circle')
    else
      render html: image_tag(user.gravatar_url, alt: "#{user.name} profile image", class: 'rounded-circle')
    end
  end
end
