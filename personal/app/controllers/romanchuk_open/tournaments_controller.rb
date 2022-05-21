module RomanchukOpen
  class TournamentsController < RomanchukOpen::ApplicationController
    let(:tournament) { Tournament.find params[:id]}
    let(:tournaments) { Tournament.all}
    def new
      @tournament = Tournament.new
    end

    def create
      message = Tournament.create!(tournament_params)
      redirect_to message
    end

    def update
      images = tournament_params.delete(:images)
      ap images
      tournament.update(tournament_params)
      images.each do |file|
        next unless file.is_a?(ActionDispatch::Http::UploadedFile)
        new_image = {key: "uploads/#{file.original_filename}", io: File.open(file), content_type: file.content_type, filename: "#{file.original_filename}"}
        tournament.images.attach(new_image)
      end
      
    end

    private
    def tournament_params
      params.require(:romanchuk_open_tournament).permit(:city, :country, images: [])
    end

    def images_params
      params.require(:romanchuk_open_tournament).permit(images: [])
    end
  end
end