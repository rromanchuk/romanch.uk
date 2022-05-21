module RomanchukOpen
  class TournamentsController < RomanchukOpen::ApplicationController
    let(:tournament) { Tournament.find params[:id] }
    let(:tournaments) { Tournament.all }
    def new
      @tournament = Tournament.new
    end

    def create
      images = tournament_params.delete(:images)
      @tournament = Tournament.create!(tournament_params)
      attach!(images)
      redirect_to tournament
    end

    def destroy
      tournament.destroy
    end

    def update
      images = tournament_params.delete(:images)
      tournament.update(tournament_params)
      attach!(images)
    end

    private
    def attach!(images)
      images&.each do |file|
        next unless file.is_a?(ActionDispatch::Http::UploadedFile)
        new_image = {key: "uploads/#{file.original_filename}", io: File.open(file), content_type: file.content_type, filename: "#{file.original_filename}"}
        tournament.images.attach(new_image)
      end
    end

    def tournament_params
      params.require(:romanchuk_open_tournament).permit(:title, :ocurred_on, :city, :country, images: [])
    end
  end
end