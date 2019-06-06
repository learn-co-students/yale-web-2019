class Artist < ActiveRecord::Base
  validates :name, presence: true

  has_many :fans
  has_many :songs
  has_many :genres, through: :songs

  # def fans
  #   Fan.all.select do |fan|
  #     # Foreign Key -> Primary Key
  #     fan.artist_id == self.id
  #   end
  # end
end
