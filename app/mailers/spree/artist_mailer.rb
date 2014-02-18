superclass = defined?(Spree::BaseMailer) ? Spree::BaseMailer : ActionMailer::Base

class Spree::ArtistMailer < superclass
  def artist_signup(user)
    # @user = User.find(id)
    artist = user
    mail(:to => "nene.joetee@gmail.com", :from => "robot@madeinafrica.net",
         :subject => "New Artist Account Created!(Email: #{user.email} : Tel: #{user.request_telephone}: Email: #{user.email})")
  end
end
