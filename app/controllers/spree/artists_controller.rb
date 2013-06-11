class Spree::ArtistsController < Spree::BaseController
  helper 'spree/users', 'spree/base'

  include Spree::Core::ControllerHelpers::Order
  def show
    @artist = Spree::User.find_by_id(params[:id])
    if(@artist && @artist.artist?)
      @arts = @artist.arts
       render  :profile
    else
      #not a user or an artist, return to homepage
      redirect_to root_path
    end
  end

end
