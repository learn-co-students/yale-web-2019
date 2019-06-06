class Fan < ActiveRecord::Base
  belongs_to :artist
  # Which artist I belong to
  # def artist
  #   # Return back the artist instance
  #   # I am a a fan of
  #   Artist.find(self.artist_id)
  # end
end
