class CreateArtistsInstruments < ActiveRecord::Migration
  def change
    create_table :artist_instruments do |t|
      t.belongs_to :artist
      t.belongs_to :instrument
    end
  end
end
