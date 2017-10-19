class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # Count all of the tracks on each album by a given artist.
    albums = self.albums.includes(:tracks)

    tracks_per_album = {}
    albums.each do |album|
      tracks_per_album[album.title] = album.tracks.length
    end
    tracks_per_album
  end
end
