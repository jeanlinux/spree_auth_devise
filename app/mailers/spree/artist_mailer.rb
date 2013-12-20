superclass = defined?(Spree::BaseMailer) ? Spree::BaseMailer : ActionMailer::Base

class Spree::ArtistMailer < superclass
  def artist_signup(user)

    mail(:to => "nene.joetee@gmail.com", :from => "robot@madeinafrica.net",
         :subject => "New Artist Account Created!")
  end
end
