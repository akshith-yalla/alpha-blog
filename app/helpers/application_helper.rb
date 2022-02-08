module ApplicationHelper

  def gravatar_for(user, options = { size: 80})
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    #size extraction
    size = options[:size]
    # compile URL which can be used in <img src="RIGHT_HERE"...
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "shadow rounded mx-auto d-block" )
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end

  def logged_in?
    !!current_user
  end


end
