Artist.destroy_all
Instrument.destroy_all
ArtistInstrument.destroy_all

Artist.reset_pk_sequence
Instrument.reset_pk_sequence
ArtistInstrument.reset_pk_sequence

10.times do
  Artist.create(name: Faker::Name.unique.name, age: rand(1..100), bio: Faker::Hipster.sentence)
end

5.times do
  Instrument.create(name: Faker::Music.unique.instrument, brand: Faker::Company.name)
end

25.times do
  def repeat
    new = ArtistInstrument.new(artist: Artist.all.sample, instrument: Instrument.all.sample)
    if ArtistInstrument.all.length > 0
      found = ArtistInstrument.find_by(artist_id: new.artist_id, instrument_id: new.instrument_id)
    end
    if found
      return repeat
    else
      new.save!
    end
  end
  repeat
end

puts "File has been seeded! 🍀"
