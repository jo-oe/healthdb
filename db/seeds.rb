# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created atextside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

ss = [
  [ :code => 'F', :text => 'weiblich' ],
  [ :code => 'M', :text => 'männlich' ],
  [ :code => 'O', :text => 'anderes' ],
  [ :code => 'U', :text => 'unbekannt' ],
]


hs = [
  [ :code => 'U', :text => 'unbekannt' ],
  [ :code => 'K', :text => 'Köln' ],
  [ :code => 'N', :text => 'sonstige NRW' ],
  [ :code => 'D', :text => 'sonstige Deutschland' ],
  [ :code => 'A', :text => 'Ausland' ]
]

ls = [
  [ :code => 'U', :text => 'unbekannt' ],
  [ :code => 'E', :text => 'EU-Bürger' ],
  [ :code => 'V', :text => 'Nicht-EU-Bürger mit Visum' ],
  [ :code => 'W', :text => 'Nicht-EU-Bürger, in anderem EU-Land lebend' ],
  [ :code => 'A', :text => 'Flüchtling im laufenden Verfahren (asylsuchend)' ],
  [ :code => 'B', :text => 'Flüchtling BÜMA' ],
  [ :code => 'F', :text => 'Flüchtling anerkannt' ],
  [ :code => 'P', :text => 'Papierlos' ],
  [ :code => 'D', :text => 'Deutsche_r' ]
]

fs = [
  [ :code => 'U', :text => 'unbekannt' ],
  [ :code => 'L', :text => 'ledig' ],
  [ :code => 'V', :text => 'verheiratet/eingetragene Lebenspartnerschaft' ],
  [ :code => 'Z', :text => 'unverheiratet zusammenlebend (Bedarfsgemeinschaft)' ],
  [ :code => 'S', :text => 'sonstige' ]
]

rs = [
  [ :code => 'U', :text => 'unbekannt' ],
  [ :code => 'G', :text => 'Gesundheitsamt' ],
  [ :code => 'D', :text => 'Suchtberatung/Drogenambulanz' ],
  [ :code => 'M', :text => 'Malteser Migranten Medizin' ],
  [ :code => 'N', :text => 'MMD' ],
  [ :code => 'W', :text => 'Flüchtlingsunterkunft/Wohnheim' ],
  [ :code => 'K', :text => 'Krankenhaus' ],
  [ :code => 'A', :text => 'Arztpraxis' ],
  [ :code => 'S', :text => 'sonstige' ]
]

Sex.delete_all
Citizenship.delete_all
Homeplace.delete_all
Legalstatus.delete_all
Familystatus.delete_all
Referrer.delete_all

p "Creating citizenships"
Citizenship.create( [ :iso3166 => '000', :name => 'unbekannt'])
CSV.foreach('db/countries.csv', col_sep: ',', headers: true) do |row|
 p row
 Citizenship.create(row.to_h)
end

p 'Creating sexes: '
ss.each do |s|
  p s
  Sex.create(s)
end



p 'Creating homeplaces: '
hs.each do |h|
  p h
  Homeplace.create(h)
end

p 'Creating legalstatuses: '
ls.each do |l|
  p l
  Legalstatus.create(l)
end

p 'Creating familystatuses: '
fs.each do |f|
  p f
  Familystatus.create(f)
end

p 'Creating referrers: '
rs.each do |r|
  p r
  Referrer.create(r)
end
