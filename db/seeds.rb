# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created atextside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# Client selection fields initialisation

p "Creating citizenships"
Citizenship.delete_all
Citizenship.create( [ :id => '000', :name => 'unbekannt'])
CSV.foreach('db/countries.csv', col_sep: ',', headers: true) do |row|
  Citizenship.create(row.to_h)
end

p 'Creating sexes: '
ss = [
  [ :id => 'F', :text => 'weiblich' ],
  [ :id => 'M', :text => 'männlich' ],
  [ :id => 'O', :text => 'anderes' ],
  [ :id => 'U', :text => 'unbekannt' ],
]
Sex.delete_all
ss.each do |s|
  Sex.create(s)
  sleep 1
end

p 'Creating homeplaces: '
hs = [
  [ :id => 'U', :text => 'unbekannt' ],
  [ :id => 'K', :text => 'Köln' ],
  [ :id => 'N', :text => 'sonstige NRW' ],
  [ :id => 'D', :text => 'sonstige Deutschland' ],
  [ :id => 'A', :text => 'Ausland' ]
]
Homeplace.delete_all
hs.each do |h|
  Homeplace.create(h)
  sleep 1
end

p 'Creating legalstatuses: '
ls = [
  [ :id => 'U', :text => 'unbekannt' ],
  [ :id => 'E', :text => 'EU-Bürger' ],
  [ :id => 'V', :text => 'Nicht-EU-Bürger mit Visum' ],
  [ :id => 'W', :text => 'Nicht-EU-Bürger, in anderem EU-Land lebend' ],
  [ :id => 'A', :text => 'Flüchtling im laufenden Verfahren (asylsuchend)' ],
  [ :id => 'B', :text => 'Flüchtling BÜMA' ],
  [ :id => 'F', :text => 'Flüchtling anerkannt' ],
  [ :id => 'P', :text => 'Papierlos' ],
  [ :id => 'D', :text => 'Deutsche_r' ]
]
Legalstatus.delete_all
ls.each do |l|
  Legalstatus.create(l)
  sleep 1
end

p 'Creating familystatuses: '
fs = [
  [ :id => 'U', :text => 'unbekannt' ],
  [ :id => 'L', :text => 'ledig' ],
  [ :id => 'V', :text => 'verheiratet/eingetragene Lebenspartnerschaft' ],
  [ :id => 'Z', :text => 'unverheiratet zusammenlebend (Bedarfsgemeinschaft)' ],
  [ :id => 'O', :text => 'sonstige' ]
]
Familystatus.delete_all
fs.each do |f|
  Familystatus.create(f)
  sleep 1
end

p 'Creating referrers: '
rs = [
  [ :id => 'U', :text => 'unbekannt' ],
  [ :id => 'G', :text => 'Gesundheitsamt' ],
  [ :id => 'D', :text => 'Suchtberatung/Drogenambulanz' ],
  [ :id => 'M', :text => 'Malteser Migranten Medizin' ],
  [ :id => 'N', :text => 'MMD' ],
  [ :id => 'W', :text => 'Flüchtlingsunterkunft/Wohnheim' ],
  [ :id => 'K', :text => 'Krankenhaus' ],
  [ :id => 'A', :text => 'Arztpraxis' ],
  [ :id => 'O', :text => 'sonstige' ]
]
Referrer.delete_all
rs.each do |r|
  Referrer.create(r)
  sleep 1
end


# Contact selection fields initialisation

p 'Creating contactreasons: '
cs = [
  [ :id => 'V', :text => 'Versicherung (allgemein)' ],
  [ :id => 'K', :text => 'Krankenhaus-Kosten' ],
  [ :id => 'A', :text => 'Arztkosten' ],
  [ :id => 'M', :text => 'Medizinischer Versorgungsbedarf (akut)' ],
  [ :id => 'R', :text => 'Aufenthaltsrecht' ],
  [ :id => 'O', :text => 'sonstiges' ]
]

Contactreason.delete_all
cs.each do |c|
  Contactreason.create(c)
  sleep 1
end

p 'Creating insurancestatuses: '
is = [
  [ :id => 'N', :text => 'keine Versicherung' ],
  [ :id => 'G', :text => 'GKV-Karte (SGB oder AsylbLG)' ],
  [ :id => 'P', :text => 'PKV' ],
  [ :id => 'E', :text => 'EHIC' ],
  [ :id => 'A', :text => 'AsylbLG ohne Karte' ],
  [ :id => 'R', :text => 'Reiseversicherung' ],
  [ :id => 'U', :text => 'unklar' ]
]

Insurancestatus.delete_all
is.each do |i|
  Insurancestatus.create(i)
  sleep 1
end

p 'Creating counselledpersons: '
cs = [
  [ :id => 'K', :text => 'Klient_in' ],
  [ :id => 'P', :text => 'Eltern' ],
  [ :id => 'F', :text => 'andere Familienangehörige/Erwachsene' ],
  [ :id => 'V', :text => 'Vormund/Betreuer' ],
  [ :id => 'M', :text => 'Medizinische Einrichtung (Personal)' ],
  [ :id => 'H', :text => 'sonstige profesionelle Helfer' ],
  [ :id => 'E', :text => 'ehrenamtliche Helfer' ],
]

Counselledpersons.delete_all
cs.each do |c|
  Counselledpersons.create(c)
  sleep 1
end

p 'Creating translatoruseds: '
ts = [
  [ :id => 'N', :text => 'nicht erforderlich' ],
  [ :id => 'P', :text => 'professionell aus Projekt' ],
  [ :id => 'M', :text => 'professionell mitgebracht' ],
  [ :id => 'F', :text => 'Freund/Familie' ],
  [ :id => 'E', :text => 'Ehrenamt' ],
  [ :id => 'V', :text => 'Video/Telefon' ],
  [ :id => 'X', :text => 'erforderlich aber nicht vorhanden' ]
]

Translatorused.delete_all
ts.each do |t|
  Translatorused.create(t)
  sleep 1
end

p 'Creating problems: '
pbs = [
  [ :id => 'V', :text => 'Versicherung' ],
  [ :id => 'K', :text => 'Kosten medizinische Versorgung (Krankenhaus/ambulant)' ],
  [ :id => 'W', :text => 'Wohnung' ],
  [ :id => 'A', :text => 'Arbeit/soziale Absicherung' ],
  [ :id => 'P', :text => 'psychosoziale Probleme' ],
  [ :id => 'G', :text => 'Gesundheit' ]
]

Problem.delete_all
is.each do |pb|
  Problem.create(pb)
  sleep 1
end

p 'Creating insuranceproblems: '
is = [
  [ :id => 'G', :text => 'Versicherung klären allgemein' ],
  [ :id => 'S', :text => 'Beitragsschulden' ],
  [ :id => 'E', :text => 'EHIC unklar' ],
  [ :id => 'V', :text => 'Vorversicherungszeiten unklar' ],
  [ :id => 'F', :text => 'Familienversicherung' ],
  [ :id => 'D', :text => 'doppelt versichert' ],
  [ :id => 'O', :text => 'sonstiges' ],
  [ :id => '0', :text => 'nicht definiert']
]

Insuranceproblem.delete_all
is.each do |i|
  Insuranceproblem.create(i)
  sleep 1
end

p 'Creating healthproblems: '
hs = [
  [ :id => 'S', :text => 'somatisch' ],
  [ :id => 'P', :text => 'psychisch' ],
  [ :id => 'T', :text => 'Traumatisierung (auch Verdacht)' ],
  [ :id => 'D', :text => 'Sucht' ],
  [ :id => 'R', :text => 'Schwangerschaft' ],
  [ :id => 'O', :text => 'sonstiges' ],
  [ :id => '0', :text => 'nicht definiert']
]

Healthproblem.delete_all
hs.each do |h|
  Healthproblem.create(h)
  sleep 1
end

p 'Creating referrals: '
rs = [
  [ :id => 'N', :text => 'keine' ],
  [ :id => 'D', :text => 'innerhalb Diakonie' ],
  [ :id => 'C', :text => 'innerhalb Caritas' ],
  [ :id => 'M', :text => 'medizinische Versorgung' ],
  [ :id => 'A', :text => 'Behörde' ],
  [ :id => 'B', :text => 'andere Beratungsstellen' ],
  [ :id => 'O', :text => 'sonstiges' ]
]

Referral.delete_all
rs.each do |r|
  Referral.create(r)
  sleep 1
end

p 'Creating referralcaritas: '
rcs = [
  [ :id => 'F', :text => 'SKF' ],
  [ :id => 'M', :text => 'SKM' ],
  [ :id => 'B', :text => 'Bonvena' ],
  [ :id => 'I', :text => 'FIM' ],
  [ :id => 'J', :text => 'Jugendmig.' ],
  [ :id => 'K', :text => 'KIZ' ],
  [ :id => 'O', :text => 'sonstiges' ],
  [ :id => '0', :text => 'nicht definiert']
]

Referralcaritas.delete_all
rcs.each do |rc|
  Referralcaritas.create(rc)
  sleep 1
end

p 'Creating referraldiakonies: '
rds = [
  [ :id => 'M', :text => 'FD Migration' ],
  [ :id => 'B', :text => 'MBE' ],
  [ :id => 'P', :text => 'Bündnis ohne Papiere' ],
  [ :id => 'O', :text => 'sonstiges' ],
  [ :id => '0', :text => 'nicht definiert']
]

Referraldiakonie.delete_all
rds.each do |rd|
  Referraldiakonie.create(rd)
  sleep 1
end

p 'Creating referralothercounsellings: '
ros = [
  [ :id => 'F', :text => 'Flüchtlingsrat' ],
  [ :id => 'R', :text => 'Rom e.V.' ],
  [ :id => 'G', :text => 'Agisra' ],
  [ :id => 'H', :text => 'AIDS-Hilfe' ],
  [ :id => 'A', :text => 'AWO' ],
  [ :id => 'P', :text => 'ProFamilia' ],
  [ :id => 'W', :text => 'Angebote für OfW' ],
  [ :id => 'O', :text => 'sonstiges' ],
  [ :id => '0', :text => 'nicht definiert']
]

Referralothercounselling.delete_all
ros.each do |ro|
  Referralothercounselling.create(ro)
  sleep 1
end

p 'Creating referralmedicals: '
rms = [
  [ :id => 'M', :text => 'Gesundheitsamt' ],
  [ :id => 'B', :text => 'Malteser Migranten Medizin' ],
  [ :id => 'K', :text => 'Krankenhaus' ],
  [ :id => 'P', :text => 'Praxis' ],
  [ :id => 'O', :text => 'sonstiges' ],
  [ :id => '0', :text => 'nicht definiert']
]

Referralmedical.delete_all
rms.each do |rm|
  Referralmedical.create(rm)
  sleep 1
end

p 'Creating referralauthorities: '
ras = [
  [ :id => 'S', :text => 'Sozialamt' ],
  [ :id => 'A', :text => 'Ausländeramt' ],
  [ :id => 'J', :text => 'Jugendamt' ],
  [ :id => 'C', :text => 'jobcenter' ],
  [ :id => 'W', :text => 'Wohnungsamt' ],
  [ :id => 'B', :text => 'BAMF' ],
  [ :id => 'O', :text => 'sonstiges' ],
  [ :id => '0', :text => 'nicht definiert']
]

Referralauthority.delete_all
ras.each do |ra|
  Referralauthority.create(ra)
  sleep 1
end

p 'Creating successfulinsurances: '
ss = [
  [ :id => 'N', :text => 'nicht erhoben' ],
  [ :id => 'G', :text => 'Pflichtversicherung GKV' ],
  [ :id => 'P', :text => 'PKV' ],
  [ :id => 'E', :text => 'EHIC' ],
  [ :id => 'A', :text => 'AsylbLG' ],
  [ :id => 'R', :text => 'Auslandsreiseversicherung' ],
  [ :id => 'F', :text => 'freiwillig versichert GKV' ],
  [ :id => 'H', :text => 'Rückkehr ins Heimatland ohne Versicherung' ],
  [ :id => 'K', :text => 'keine' ],
  [ :id => 'O', :text => 'sonstiges' ]
]

Successfulinsurance.delete_all
ss.each do |s|
  Successfulinsurance.create(s)
  sleep 1
end

p 'Creating failedinsurances: '
fs = [
  [ :id => 'S', :text => 'Beitragsschulden' ],
  [ :id => 'V', :text => 'Vorversicherungszeiten' ],
  [ :id => 'W', :text => 'Weigerung der Kasse bei SGB XII' ],
  [ :id => 'N', :text => 'kein nachweisbarer Anspruch auf Sozialleistungen' ],
  [ :id => 'A', :text => 'Aufenthaltsstatus' ],
  [ :id => 'O', :text => 'sonstiges' ]
]

Failedinsurance.delete_all
fs.each do |f|
  Failedinsurance.create(f)
  sleep 1
end

p 'Creating users: '
users = [
  [ :id => '1', :signature => "00", :username => "admin", :password_digest => "$2a$10$phCeSW/EI1KfHMj3HIfZxO7Lmn1taci4Yb2z9DPaTt3ZeXc6o2.Mm" ],
  [ :id => '2', :signature => "T1", :username => "testuser1", :password_digest => "$2a$10$Rnvk4ciJP1lLIx0UuJq4OuoG.E9mUqx7DhZqJ8TK1kzVVW/GOKcsq"]
]

users.each do |user|
  User.create(user)
end

p 'Creating sample client'
Client.create( [ :id => '17XX0000', :firstname => 'sample', :lastname => 'sample', :birthdate => "01.01.1900",
:sex => Sex.find_by_id('U'), :homeplace => Homeplace.find_by_id('U'), :citizenship => Citizenship.find_by_id('000'),
:legalstatus => Legalstatus.find_by_id('U'), :familystatus => Familystatus.find_by_id('U'), :childrencount => '0',
:datefirstcontact => Date.today(), :referrer => Referrer.find_by_id('U') ]);
