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
Citizenship.create( [ :iso3166 => '000', :name => 'unbekannt'])
CSV.foreach('db/countries.csv', col_sep: ',', headers: true) do |row|
 Citizenship.create(row.to_h)
end

p 'Creating sexes: '
ss = [
  [ :code => 'F', :text => 'weiblich' ],
  [ :code => 'M', :text => 'männlich' ],
  [ :code => 'O', :text => 'anderes' ],
  [ :code => 'U', :text => 'unbekannt' ],
]
Sex.delete_all
ss.each do |s|
  Sex.create(s)
end

p 'Creating homeplaces: '
hs = [
  [ :code => 'U', :text => 'unbekannt' ],
  [ :code => 'K', :text => 'Köln' ],
  [ :code => 'N', :text => 'sonstige NRW' ],
  [ :code => 'D', :text => 'sonstige Deutschland' ],
  [ :code => 'A', :text => 'Ausland' ]
]
Homeplace.delete_all
hs.each do |h|
  Homeplace.create(h)
end

p 'Creating legalstatuses: '
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
Legalstatus.delete_all
ls.each do |l|
  Legalstatus.create(l)
end

p 'Creating familystatuses: '
fs = [
  [ :code => 'U', :text => 'unbekannt' ],
  [ :code => 'L', :text => 'ledig' ],
  [ :code => 'V', :text => 'verheiratet/eingetragene Lebenspartnerschaft' ],
  [ :code => 'Z', :text => 'unverheiratet zusammenlebend (Bedarfsgemeinschaft)' ],
  [ :code => 'O', :text => 'sonstige' ]
]
Familystatus.delete_all
fs.each do |f|
  Familystatus.create(f)
end

p 'Creating referrers: '
rs = [
  [ :code => 'U', :text => 'unbekannt' ],
  [ :code => 'G', :text => 'Gesundheitsamt' ],
  [ :code => 'D', :text => 'Suchtberatung/Drogenambulanz' ],
  [ :code => 'M', :text => 'Malteser Migranten Medizin' ],
  [ :code => 'N', :text => 'MMD' ],
  [ :code => 'W', :text => 'Flüchtlingsunterkunft/Wohnheim' ],
  [ :code => 'K', :text => 'Krankenhaus' ],
  [ :code => 'A', :text => 'Arztpraxis' ],
  [ :code => 'O', :text => 'sonstige' ]
]
Referrer.delete_all
rs.each do |r|
  Referrer.create(r)
end


# Contact selection fields initialisation

p 'Creating contactreasons: '
cs = [
  [ :code => 'V', :text => 'Versicherung (allgemein)' ],
  [ :code => 'K', :text => 'Krankenhaus-Kosten' ],
  [ :code => 'A', :text => 'Arztkosten' ],
  [ :code => 'M', :text => 'Medizinischer Versorgungsbedarf (akut)' ],
  [ :code => 'R', :text => 'Aufenthaltsrecht' ],
  [ :code => 'S', :text => 'sonstiges' ]
]

Contactreason.delete_all
cs.each do |c|
  Contactreason.create(c)
end

p 'Creating insurancestatuses: '
is = [
  [ :code => 'N', :text => 'keine Versicherung' ],
  [ :code => 'G', :text => 'GKV-Karte (SGB oder AsylbLG)' ],
  [ :code => 'P', :text => 'PKV' ],
  [ :code => 'E', :text => 'EHIC' ],
  [ :code => 'A', :text => 'AsylbLG ohne Karte' ],
  [ :code => 'R', :text => 'Reiseversicherung' ],
  [ :code => 'U', :text => 'unklar' ]
]

Insurancestatus.delete_all
is.each do |i|
  Insurancestatus.create(i)
end

p 'Creating counselledpersons: '
cs = [
  [ :code => 'K', :text => 'Klient_in' ],
  [ :code => 'P', :text => 'Eltern' ],
  [ :code => 'F', :text => 'andere Familienangehörige/Erwachsene' ],
  [ :code => 'V', :text => 'Vormund/Betreuer' ],
  [ :code => 'M', :text => 'Medizinische Einrichtung (Personal)' ],
  [ :code => 'H', :text => 'sonstige profesionelle Helfer' ],
  [ :code => 'E', :text => 'ehrenamtliche Helfer' ],
]

Counselledpersons.delete_all
cs.each do |c|
  Counselledpersons.create(c)
end

p 'Creating translatoruseds: '
ts = [
  [ :code => 'N', :text => 'nicht erforderlich' ],
  [ :code => 'P', :text => 'professionell aus Projekt' ],
  [ :code => 'M', :text => 'professionell mitgebracht' ],
  [ :code => 'F', :text => 'Freund/Familie' ],
  [ :code => 'E', :text => 'Ehrenamt' ],
  [ :code => 'V', :text => 'Video/Telefon' ],
  [ :code => 'X', :text => 'erforderlich aber nicht vorhanden' ]
]

Translatorused.delete_all
is.each do |t|
  Translatorused.create(t)
end

p 'Creating problems: '
pbs = [
  [ :code => 'V', :text => 'Versicherung' ],
  [ :code => 'K', :text => 'Kosten medizinische Versorgung (Krankenhaus/ambulant)' ],
  [ :code => 'W', :text => 'Wohnung' ],
  [ :code => 'A', :text => 'Arbeit/soziale Absicherung' ],
  [ :code => 'P', :text => 'psychosoziale Probleme' ],
  [ :code => 'G', :text => 'Gesundheit' ]
]

Problem.delete_all
is.each do |pb|
  Problem.create(pb)
end

p 'Creating insuranceproblems: '
is = [
  [ :code => 'G', :text => 'Versicherung klären allgemein' ],
  [ :code => 'S', :text => 'Beitragsschulden' ],
  [ :code => 'E', :text => 'EHIC unklar' ],
  [ :code => 'V', :text => 'Vorversicherungszeiten unklar' ],
  [ :code => 'F', :text => 'Familienversicherung' ],
  [ :code => 'D', :text => 'doppelt versichert' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Insuranceproblem.delete_all
is.each do |i|
  Insuranceproblem.create(i)
end

p 'Creating healthproblems: '
hs = [
  [ :code => 'S', :text => 'somatisch' ],
  [ :code => 'P', :text => 'psychisch' ],
  [ :code => 'T', :text => 'Traumatisierung (auch Verdacht)' ],
  [ :code => 'D', :text => 'Sucht' ],
  [ :code => 'S', :text => 'Schwangerschaft' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Healthproblem.delete_all
hs.each do |h|
  Healthproblem.create(h)
end

p 'Creating referrals: '
rs = [
  [ :code => 'N', :text => 'keine' ],
  [ :code => 'D', :text => 'innerhalb Diakonie' ],
  [ :code => 'C', :text => 'innerhalb Caritas' ],
  [ :code => 'M', :text => 'medizinische Versorgung' ],
  [ :code => 'A', :text => 'Behörde' ],
  [ :code => 'B', :text => 'andere Beratungsstellen' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Referral.delete_all
rs.each do |r|
  Referral.create(r)
end

p 'Creating referralcaritas: '
rcs = [
  [ :code => 'F', :text => 'SKF' ],
  [ :code => 'M', :text => 'SKM' ],
  [ :code => 'B', :text => 'Bonvena' ],
  [ :code => 'I', :text => 'FIM' ],
  [ :code => 'J', :text => 'Jugendmig.' ],
  [ :code => 'K', :text => 'KIZ' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Referralcaritas.delete_all
rcs.each do |rc|
  Referralcaritas.create(rc)
end

p 'Creating referraldiakonies: '
rds = [
  [ :code => 'M', :text => 'FD Migration' ],
  [ :code => 'B', :text => 'MBE' ],
  [ :code => 'P', :text => 'Bündnis ohne Papiere' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Referraldiakonie.delete_all
rds.each do |rd|
  Referraldiakonie.create(rd)
end

p 'Creating referralothercounsellings: '
ros = [
  [ :code => 'F', :text => 'Flüchtlingsrat' ],
  [ :code => 'R', :text => 'Rom e.V.' ],
  [ :code => 'G', :text => 'Agisra' ],
  [ :code => 'H', :text => 'AIDS-Hilfe' ],
  [ :code => 'A', :text => 'AWO' ],
  [ :code => 'P', :text => 'ProFamilia' ],
  [ :code => 'W', :text => 'Angebote für OfW' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Referralothercounselling.delete_all
ros.each do |ro|
  Referralothercounselling.create(ro)
end

p 'Creating referralmedicals: '
rms = [
  [ :code => 'M', :text => 'Gesundheitsamt' ],
  [ :code => 'B', :text => 'Malteser Migranten Medizin' ],
  [ :code => 'K', :text => 'Krankenhaus' ],
  [ :code => 'P', :text => 'Praxis' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Referralmedical.delete_all
rms.each do |rm|
  Referralmedical.create(rm)
end

p 'Creating referralauthorities: '
ras = [
  [ :code => 'S', :text => 'Sozialamt' ],
  [ :code => 'A', :text => 'Ausländeramt' ],
  [ :code => 'J', :text => 'Jugendamt' ],
  [ :code => 'C', :text => 'jobcenter' ],
  [ :code => 'W', :text => 'Wohnungsamt' ],
  [ :code => 'B', :text => 'BAMF' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Referralauthority.delete_all
ras.each do |ra|
  Referralauthority.create(ra)
end

p 'Creating successfulinsurances: '
ss = [
  [ :code => 'N', :text => 'nicht erhoben' ],
  [ :code => 'G', :text => 'Pflichtversicherung GKV' ],
  [ :code => 'P', :text => 'PKV' ],
  [ :code => 'E', :text => 'EHIC' ],
  [ :code => 'A', :text => 'AsylbLG' ],
  [ :code => 'R', :text => 'Auslandsreiseversicherung' ],
  [ :code => 'F', :text => 'freiwillig versichert GKV' ],
  [ :code => 'H', :text => 'Rückkehr ins Heimatland ohne Versicherung' ],
  [ :code => 'K', :text => 'keine' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Successfulinsurance.delete_all
ss.each do |s|
  Successfulinsurance.create(s)
end

p 'Creating failedinsurances: '
fs = [
  [ :code => 'S', :text => 'Beitragsschulden' ],
  [ :code => 'V', :text => 'Vorversicherungszeiten' ],
  [ :code => 'W', :text => 'Weigerung der Kasse bei SGB XII' ],
  [ :code => 'N', :text => 'kein nachweisbarer Anspruch auf Sozialleistungen' ],
  [ :code => 'A', :text => 'Aufenthaltsstatus' ],
  [ :code => 'O', :text => 'sonstiges' ]
]

Failedinsurance.delete_all
fs.each do |f|
  Failedinsurance.create(f)
end
