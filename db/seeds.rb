require 'csv'

csv_text = File.read(Rails.root.join('public','space_infos.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
  csv.each do |row|
    t = SpaceInfo.new
    t.id = row['id']
    t.name = row['name']
    t.address = row['adress']
    t.price_per_hour = row['price_per_hour']
    t.ot = row['ot']
    t.ct = row['ct']
    t.tel = row['tel']
    t.photo = row['photo']
    t.parking = row['parking']
    t.ct = row['ct']
    t.tel = row['tel']
    t.photo = row['photo']
    t.parking = row['parking']
    t.smoking = row['smoking']
    t.projector = row['projector']
    t.wifi = row['wifi']
    t.printer = row['printer']
    t.consent = row['consent']
    t.payment = row['payment']
    t.place = row['place']
    t.save
  end