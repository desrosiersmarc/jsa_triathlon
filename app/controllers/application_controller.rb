class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters

    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :birthday, :mobil_phone, :display_profil, :strava_profil, :contactable, :name, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :birthday, :mobil_phone, :display_profil, :strava_profil, :contactable, :name, :photo])
  end

  def create_notifications (content_id, content_type)

    if content_type == 'article'
      article_id_value = content_id
    elsif content_type == 'picture'
      picture_id_value = content_id
    else
      product_id_value = content_id
    end

    User.where(member: true).each do |user|
      Notification.create(
        user_id: user.id,
        read: false,
        article_id: article_id_value,
        picture_id: picture_id_value,
        product_id: product_id_value)
    end

  end

  def update_notifications(content_id, content_type)
    content_to_test = content_type + '_id'
    content_to_test = content_to_test.to_sym
    Notification.where(content_to_test=> content_id).each do |notif|
      notif.update(read: false)
    end
  end

end
