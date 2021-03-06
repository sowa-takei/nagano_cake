class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_products_path
       #pathは設定したい遷移先へのpathを指定してください
    when Customer
      items_path
      #ここもpathはご自由に変更してください
    end
  end

  def after_sign_out_path_for(resource)
   root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :postal_code, :address, :last_name_kana,  :first_name_kana, :telephone_number])
  end

end


