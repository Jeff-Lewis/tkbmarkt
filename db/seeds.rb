# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

path=File.join(Rails.root, "/app/assets/images/")

#create Params
appparams = Appparam.create({name:"Kleinanzeigen", description:"Kleinanzeigen für Private Anbieten & Suchen", active:true})
appparams = Appparam.create({name:"Stellenanzeigen", description:"Stellenanzeigen für Institutionen", active:true})
appparams = Appparam.create({name:"Vermietungen", description:"Mieten von Mobilen incl. Reservationskalender", active:true})
appparams = Appparam.create({name:"Veranstaltungen", description:"Veranstaltungskalender für Private & Institutionen", active:true})
appparams = Appparam.create({name:"Ausschreibungen", description:"Ausschreibungskalender für Private", active:true})
appparams = Appparam.create({name:"Aktionen", description:"Befristete Sonderaktionen für Institutionen", active:true})
appparams = Appparam.create({name:"Angebote", description:"Serviceangebot von Institutionen & Privaten", active:true})
appparams = Appparam.create({name:"Institutionen", description:"Institutionen", active:true})
appparams = Appparam.create({name:"Sponsoring", description:"Sponsoring von Events für Institutionen", active:true})
appparams = Appparam.create({name:"Crowdfunding (Spenden)", description:"Spendeninitiativen für gemeinnützige Institutionen ", active:true})
appparams = Appparam.create({name:"Crowdfunding (Belohnungen)", description:"Rewardinitiativen mit nicht-monetären Gegenleistungen", active:true})
appparams = Appparam.create({name:"Crowdfunding (Zinsen)", description:"Kreditinitiativen mit Verzinsung", active:true})
appparams = Appparam.create({name:"Crowdfunding (Beiträge)", description:"Spenden von Privaten & Institutionen für Spendeninitiativen", active:true})
appparams = Appparam.create({name:"Bewertungen", description:"Bewertung von Produkten & Services von Institutionen & Privaten", active:true})
appparams = Appparam.create({name:"Privatpersonen", description:"Privatpersonen", active:true})
appparams = Appparam.create({name:"Favoriten", description:"Personen & Institutionen folgen", active:true})
appparams = Appparam.create({name:"Ausflugsziele", description:"Lohnenswerte Ausflugsziele in der Region", active:true})
appparams = Appparam.create({name:"Partnerlinks", description:"Links der Partnerfirmen", active:true})
appparams = Appparam.create({name:"Wer ist wo", description:"wer ist online", active:true})
appparams = Appparam.create({name:"Kundenberater", description:"Kundenberater für Services", active:true})
appparams = Appparam.create({name:"Kundenstatus", description:"Kundenstatus für Kunden von Partner", active:true})
appparams = Appparam.create({name:"Accounts", description:"Konten für Kunden von Partner", active:true})
appparams = Appparam.create({name:"Transaktionen", description:"Transaktionen", active:true})

#OBJECT Branchen 1..27
mcategories = Mcategory.create({ctype:"Branche", name:"Bau- und Erdarbeiten"})
mcategories = Mcategory.create({ctype:"Branche", name:"Dachdeckerarbeiten"})
mcategories = Mcategory.create({ctype:"Branche", name:"EDV Telekommunikation"})
mcategories = Mcategory.create({ctype:"Branche", name:"Elektrikarbeiten"})
mcategories = Mcategory.create({ctype:"Branche", name:"Entsorgung"})
mcategories = Mcategory.create({ctype:"Branche", name:"Fenster, Türen, Glas"})
mcategories = Mcategory.create({ctype:"Branche", name:"Fliesen und Platten"})
mcategories = Mcategory.create({ctype:"Branche", name:"Garten und Landschaft"})
mcategories = Mcategory.create({ctype:"Branche", name:"KFZ, Motorrad, Boote"})
mcategories = Mcategory.create({ctype:"Branche", name:"Maler & Lackierer"})
mcategories = Mcategory.create({ctype:"Branche", name:"Maurer, Beton, Estrich"})
mcategories = Mcategory.create({ctype:"Branche", name:"Metallbau, Verarbeitung"})
mcategories = Mcategory.create({ctype:"Branche", name:"Parkettböden, Teppichböden"})
mcategories = Mcategory.create({ctype:"Branche", name:"Planung & Beratung"})
mcategories = Mcategory.create({ctype:"Branche", name:"Putz & Stuck"})
mcategories = Mcategory.create({ctype:"Branche", name:"Raumausstatter"})
mcategories = Mcategory.create({ctype:"Branche", name:"Sonstige Dienstleistungen"})
mcategories = Mcategory.create({ctype:"Branche", name:"Sonstige Handwerkerleistungen"})
mcategories = Mcategory.create({ctype:"Branche", name:"Treppen- & Innenausbau"})
mcategories = Mcategory.create({ctype:"Branche", name:"Umzüge, Transporte"})
mcategories = Mcategory.create({ctype:"Branche", name:"Wege- & Pflasterarbeiten"})
mcategories = Mcategory.create({ctype:"Branche", name:"Werbung, Druck, Schilder"})
mcategories = Mcategory.create({ctype:"Branche", name:"Zimmer, Holz, Tischler"})
mcategories = Mcategory.create({ctype:"Branche", name:"Essen Catering Lebensmittel"})
mcategories = Mcategory.create({ctype:"Branche", name:"Agrararbeiten"})
mcategories = Mcategory.create({ctype:"Branche", name:"Finanzberatung"})
mcategories = Mcategory.create({ctype:"Branche", name:"Vereine"})
    
#create Aktionen & Angebote 28 29
mcategories = Mcategory.create({ctype:"Angebote", name:"Standard"})
mcategories = Mcategory.create({ctype:"Angebote", name:"Aktion"})

#OBJECT Vermietungen 30..40
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Personentransport"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Gütertransport"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Werkzeuge"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Gartengeräte"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Elektronik"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Sportgeräte"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Event-Attraktionen"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Computer"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Catering"})
mcategories = Mcategory.create({ctype:"Vermietungen", name:"Tiere"})

#OBJECT Stellenanzeigen 41..48
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Ausstellung"})
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Sportanlass"})
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Konzert"})
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Vortrag"})
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Festwirtschaft"})
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Informationsveranstaltung"})
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Jubiläum"})
mcategories = Mcategory.create({ctype:"Veranstaltungen", name:"Flohmarkt"})

#OBJECT Ausflugsziele 49..55
mcategories = Mcategory.create({ctype:"Ausflugsziele", name:"Ausstellung"})
mcategories = Mcategory.create({ctype:"Ausflugsziele", name:"Landschaften"})
mcategories = Mcategory.create({ctype:"Ausflugsziele", name:"Historische Gebäude"})
mcategories = Mcategory.create({ctype:"Ausflugsziele", name:"Sportstätten"})
mcategories = Mcategory.create({ctype:"Ausflugsziele", name:"Freizeitparks"})
mcategories = Mcategory.create({ctype:"Ausflugsziele", name:"Bäder und Spa"})
mcategories = Mcategory.create({ctype:"Ausflugsziele", name:"Seen und Gewässer"})
    
#OBJECT Kleinanzeigen 56..64
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Sportgeräte"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Antiquitäten"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Spielzeuge"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Musikinstrumente"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Unterhaltungselektronik"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Haushaltsgeräte"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Gartengeräte"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"KFZ und Motorrad"})
mcategories = Mcategory.create({ctype:"Kleinanzeigen", name:"Tiere"})

mcategories = Mcategory.create({ctype:"Crowdfunding", name:"Crowdfunding"})

#create ticket categories 66..68
mcategories = Mcategory.create({ctype:"Ticket", name:"Eintritt"})
mcategories = Mcategory.create({ctype:"Ticket", name:"Gutschein"})
mcategories = Mcategory.create({ctype:"Ticket", name:"Rabatt"})

#create some users...
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"09.05.1963", anonymous:false, status:"ok", active:true, email:"horst.wurm@bluewin.ch", password:"password", name:"Horst", lastname:"Wurm", address1:"Hörnliblick 11", address2:"Zezikon", address3:"Thurgau", superuser:true, webmaster:true, avatar:File.open(path+'horst.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"11.2.1970", anonymous:false, status:"ok", active:true, email:"t.oschewsky@bluewin.ch", password:"password", name:"Tanja", lastname:"Oschewsky", address1:"Hörnliblick 11", address2:"Zezikon", address3:"Thurgau", superuser:false,avatar:File.open(path+'ma_3.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.12.2016", anonymous:false, status:"ok", active:true, email:"hans.wurst@gmx.com", password:"password", name:"Hans", lastname:"Wurst", address1:"Bahnhofstrasse 11", address2:"Frauenfeld", address3:"", superuser:false,avatar:File.open(path+'ma_2.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"2.10.2005", anonymous:false, status:"ok", active:true, email:"anton.meier@outlook.com", password:"password", name:"Anton", lastname:"Meier", address1:"Im Roos", address2:"Weinfelden", address3:"", superuser:false,avatar:File.open(path+'ma_4.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.9.2007", anonymous:false, status:"ok", active:true, email:"e.oschewsky@bluewin.ch", password:"password", name:"Emelie", lastname:"Oschewsky", address1:"Hörnliblick 11", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_8.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"11.5.1963", anonymous:false, status:"ok", active:true, email:"henning.gebert@outlook.com", password:"password", name:"Henning", lastname:"Gebert", address1:"Bahnhof", address2:"Pfäffikon SZ", address3:"", superuser:false,avatar:File.open(path+'ma_7.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"1.5.1970", anonymous:false, status:"ok", active:true, email:"heidi.hirsch@outlook.ch", password:"password", name:"Heidi", lastname:"Hirsch", address1:"Hauptstrasse 1", address2:"Amlikon", address3:"", superuser:false, avatar:File.open(path+'ma_9.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"14.4.2003", anonymous:false, status:"ok", active:true, email:"fred.gautschi@bluewin.ch", password:"password", name:"Fred", lastname:"Gautschi", address1:"Dorfplatz 1", address2:"Matzingen", address3:"", superuser:false,avatar:File.open(path+'ma_6.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"6.3.2004", anonymous:false, status:"ok", active:true, email:"christian.meier@gmx.com", password:"password", name:"Christian", lastname:"Meier", address1:"Alte Wilderenstrasse 4", address2:"Zezikon", address3:"", superuser:false,avatar:File.open(path+'ma_2.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.12.2008", anonymous:false, status:"ok", active:true, email:"barak@outlook.com", password:"password", name:"Barak", lastname:"Obama", address1:"Marktplatz", address2:"Frauenfeld", address3:"", superuser:false,avatar:File.open(path+'ma_10.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"26.4.2009", anonymous:false, status:"ok", active:true, email:"trump@bluewin.ch", password:"password", name:"Donald", lastname:"Trump", address1:"Hauptstrasse 1", address2:"Buch", address3:"Thurgau", superuser:false,avatar:File.open(path+'ma_11.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.2010", anonymous:false, status:"ok", active:true, email:"angela@outlook.com", password:"password", name:"Angela", lastname:"Merkel", address1:"Bahnhof", address2:"Wil SG", address3:"", superuser:false,avatar:File.open(path+'ma_12.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.1970", anonymous:false, status:"ok", active:true, email:"kurt.felix@outlook.com", password:"password", name:"Kurt", lastname:"Felix", address1:"Vadianstrasse 8", address2:"St Gallen", address3:"", superuser:false,avatar:File.open(path+'ma_5.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.1969", anonymous:false, status:"ok", active:true, email:"pierin.claglüna@outlook.com", password:"password", name:"Pierin", lastname:"Claglüna", address1:"Bahnhof", address2:"Chur", address3:"", superuser:false,avatar:File.open(path+'ma_13.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.7.1958", anonymous:false, status:"ok", active:true, email:"gregor.stuecheli@outlook.com", password:"password", name:"Gregor", lastname:"Stücheli", address1:"Bahnhof", address2:"Münchwilen", address3:"", superuser:false,avatar:File.open(path+'stuecheli.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"hans.nagel@outlook.com", password:"password", name:"Hans", lastname:"Nagel", address1:"Amriswil", address2:"Hauptstrasse 2", address3:"", superuser:false,avatar:File.open(path+'nagel.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"corinne@outlook.com", password:"password", name:"Corinne", lastname:"Iaonnidis-Sondereggert", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'Corinne-Ioannidis-Sonderegger.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"christoph@outlook.com", password:"password", name:"Christoph", lastname:"Sprenger", address1:"Marktstrasse 26", address2:"Bisseg", address3:"Thurgau", superuser:false,avatar:File.open(path+'Christoph-Sprenger.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"aron@outlook.com", password:"password", name:"Aron", lastname:"Gamba", address1:"Marktstrasse 26", address2:"Amlikon", address3:"Thurgau", superuser:false,avatar:File.open(path+'Aron_Gamba.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"fabio@outlook.com", password:"password", name:"Fabio", lastname:"Tauro", address1:"Marktstrasse 26", address2:"Busnang", address3:"Thurgau", superuser:false,avatar:File.open(path+'FabioTauro.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"isabelle@outlook.com", password:"password", name:"Isabelle", lastname:"Hugentobler", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'IsabelleHugentobler.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"marco@outlook.com", password:"password", name:"Marco", lastname:"Sonderegger", address1:"Marktstrasse 26", address2:"Kreuzlingen", address3:"Thurgau", superuser:false,avatar:File.open(path+'Marco-Sonderegger.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"melanie@outlook.com", password:"password", name:"Melanie", lastname:"Forster", address1:"Marktstrasse 26", address2:"Frauenfeld", address3:"Thurgau", superuser:false,avatar:File.open(path+'MelanieForster2015.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"nunzia@outlook.com", password:"password", name:"Nunzia", lastname:"Seiler", address1:"Marktstrasse 26", address2:"Matzingen", address3:"Thurgau", superuser:false,avatar:File.open(path+'NunziaSeiler.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"oliverp@outlook.com", password:"password", name:"Oliver", lastname:"Paulin", address1:"Marktstrasse 26", address2:"Wängi", address3:"Thurgau", superuser:false,avatar:File.open(path+'Oliver_Paulin.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"petrak@outlook.com", password:"password", name:"Petra", lastname:"Koch", address1:"Marktstrasse 26", address2:"Wil", address3:"St.Gallen", superuser:false,avatar:File.open(path+'PetraKoch.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"rschaelchi@outlook.com", password:"password", name:"Raymond", lastname:"Schaelchli", address1:"Marktstrasse 26", address2:"Effretikon", address3:"Zürich", superuser:false,avatar:File.open(path+'RaymondSchaelchli.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"rschoch@outlook.com", password:"password", name:"Remo", lastname:"Schoch", address1:"Marktstrasse 26", address2:"Ebmatingen", address3:"Thurgau", superuser:false,avatar:File.open(path+'RemoSchoch.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"sherzog@outlook.com", password:"password", name:"Stefanie", lastname:"Herzog", address1:"Marktstrasse 26", address2:"Stettfurt", address3:"Thurgau", superuser:false,avatar:File.open(path+'StefanieHerzog.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"vkirli@outlook.com", password:"password", name:"Vesile", lastname:"Kirli", address1:"Marktstrasse 26", address2:"Lommis", address3:"Thurgau", superuser:false,avatar:File.open(path+'VesileKirli.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"mbueschl@outlook.com", password:"password", name:"Manuela", lastname:"Bueschl", address1:"Marktstrasse 26", address2:"Bronschhofen", address3:"St.Gallen", superuser:false,avatar:File.open(path+'ManuelaBueschl.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"ppreite@outlook.com", password:"password", name:"Patric", lastname:"Preite", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'PatricPreite.jpg', 'rb')})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.5.1967", anonymous:false, status:"ok", active:true, email:"rruckstuhl@outlook.com", password:"password", name:"Ramona", lastname:"Ruckstuhl", address1:"Marktstrasse 26", address2:"Weinfelden", address3:"Thurgau", superuser:false,avatar:File.open(path+'RamonaRuckstuhl.jpg', 'rb')})

#create some appointments
usanz = User.all.count-1
random = Random.new(Time.new.to_i)
for i in 0..300
    ura1 = random.rand(usanz)+1
    ura2 = random.rand(usanz)+1
    tira1 = random.rand(24)+1
    tira2 = tira1 + 1
    appointments = Appointment.create({user_id1: ura1, user_id2: ura2, subject:"Termin "+Date.today.to_s, active:true, status:"angefragt", app_date:Date.today+ura1, time_from: tira1, time_to: tira2, channel:"Geschäftsstelle", channel_detail:""})
end

#create some favorits
usanz = User.all.count-1
random = Random.new(Time.new.to_i)
for i in 0..100
    ura1 = random.rand(usanz)+1
    ura2 = random.rand(usanz)+1
    favourits = Favourit.create({user_id: ura1, object_name:"User", object_id: ura2})
end

#create some companies...
companies = Company.create({status:"ok", active:true, user_id:1, name:"Fischzucht Hecht", mcategory_id:24 ,stichworte: "Fische, Zierfische, Angelbedarf", address1:"Bahnhof", address2:"Frauenfeld", address3:"Thurgau", avatar:File.open(path+'fischhaendler.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Alder Entsorgung", mcategory_id:11 ,stichworte: "Hocbau, Tiefbau", address1:"Bahnhof", address2:"Wil", address3:"Thurgau", avatar:File.open(path+'alder.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:3, name:"Eisenwaren Müller", mcategory_id:12 ,stichworte: "Hocbau, Tiefbau", address1:"Thurgauer Str", address2:"Matzingen", address3:"Thurgau", avatar:File.open(path+'eisenmueller.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Thurgauer Kantonalbank", partner:true, mcategory_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"Weinfelden", address3:"Thurgau", avatar:File.open(path+'tkb.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:4, name:"Prematic", mcategory_id:12 ,stichworte: "Luftdruck", address1:"Bahnhof", address2:"Wängi", address3:"Thurgau", avatar:File.open(path+'prematic.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:5, name:"Baufirma Meier", mcategory_id:11 ,stichworte: "Hocbau, Tiefbau", address1:"Hauptstrasse", address2:"Zezikon", address3:"Thurgau", avatar:File.open(path+'meier.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:5, name:"Lackierwerkstatt Manser", mcategory_id:9 ,stichworte: "Karosserie", address1:"Amlikon", address2:"Haupstrasse", address3:"Thurgau", avatar:File.open(path+'mazda-mx-5-cabriolet-2006-occasion.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:6, name:"Malermeister Painter", mcategory_id:10 ,stichworte: "Malerarbeiten", address1:"Gartenstrasse 2", address2:"Lommis", address3:"Thurgau", avatar:File.open(path+'maler.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:7, name:"Tierschutzbund Weinfelden", mcategory_id:25 ,stichworte: "Tiere", address1:"Gartenstrasse 2", address2:"Lommis", address3:"Thurgau", social:true, avatar:File.open(path+'tierschutz.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:8, name:"Blindenverein Wängi", mcategory_id:9 ,stichworte: "Verein", address1:"Wängi", address2:"Haupstrasse", address3:"Thurgau", avatar:File.open(path+'blindenverein.jpg', 'rb'), social:true}) 
companies = Company.create({status:"ok", active:true, user_id:9, name:"Kosmetikstudio Jasmine", mcategory_id:10 ,stichworte: "Kosmetik", address1:"Gartenstrasse 2", address2:"Bürglen", address3:"Thurgau", avatar:File.open(path+'kosmetik.jpg', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:10, name:"Autohaus Hummel", mcategory_id:25 ,stichworte: "Auto KFZ", address1:"Hauptstrasse", address2:"Bissegg", address3:"Thurgau", avatar:File.open(path+'autobissegg.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:11, name:"Valiant Bank", mcategory_id:26 ,stichworte: "Bank Finanz Geld", address1:"Bahnhof", address2:"Bern", address3:"Bern", avatar:File.open(path+'valiant.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:12, name:"St.Galler Kantonalbank", partner:true, mcategory_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"St.Gallen", address3:"St.gallen", avatar:File.open(path+'sgkb.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:14, name:"Graubündner Kantonalbank", partner:true, mcategory_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"Chur", address3:"Graubünden", avatar:File.open(path+'grkb.png', 'rb')}) 
companies = Company.create({status:"ok", active:true, user_id:14, name:"Sonderegger publish", partner:false, mcategory_id:22 ,stichworte: "Copyshop Drucken Druckerei Publish Webdesign", address1:"Marktstrasse 26", address2:"8570 Weinfelden", address3:"Thurgau", avatar:File.open(path+'sonderegger.tiff', 'rb')}) 

#create some customer relationships
usanz = User.all.count-1
capanz = Company.all.count-1
@partners = Company.where('active=? and partner=?', true, true).all
random = Random.new(Time.new.to_i)
@partners.each do |p|
    for i in 0..20
        ura1 = random.rand(usanz)+1
        cra1 = random.rand(capanz)+1

        #User
        @customer = Customer.where('owner_type=? and owner_id=? and partner_id=?', "User", ura1,p.id)
        if @customer.count == 0
            customers = Customer.create({owner_type:"User", owner_id:ura1, partner_id: p.id, customer_number:"Kunden-Nr PK5962356326"+i.to_s})
            @cac = Customer.where('customer_number=? and partner_id=?',"Kunden-Nr PK5962356326"+i.to_s, p.id).first
            if @cac.accounts.count == 0
                for k in 1..2
                    if k == 2
                        gk = true
                    else
                        gk = false
                    end
                    accounts = Account.create({customer_id:  @cac.id, name:"Konto-Nr."+k.to_s, iban:"IBANPK1234567890"+k.to_s, is_account_ver: gk})
                end
            end
        end 

        # Companies
        @customer = Customer.where('owner_type=? and owner_id=? and partner_id=?', "Company", cra1,p.id)
        if @customer.count == 0
            customers = Customer.create({owner_type:"Company", owner_id:cra1, partner_id: p.id, customer_number:"Kunden-Nr FK5962356326"+i.to_s})
            @cac = Customer.where('customer_number=? and partner_id=?',"Kunden-Nr FK5962356326"+i.to_s, p.id).first
            if @cac.accounts.count == 0
                for k in 1..5
                    if k == 2
                        gk = true
                    else
                        gk = false
                    end
                    accounts = Account.create({customer_id:  @cac.id, name:"Konto-Nr."+k.to_s, iban:"IBANFK1234567890"+k.to_s, is_account_ver: gk})
                end
            end
        end 

    end
end

#create some transactions
if false
    transactions = Transaction.create({user_id: ura1, company_id:nil, account_ver:1, account_bel:2, trx_date:Date.today, valuta:Date.today+1, status:"erfasst", ref: "dies ist eine Test-Transaktion", object_name:"User", object_id:1, amount:100})
end

#create Links for TKB
@comp = Company.where('name=?',"Thurgauer Kantonalbank").first
if @comp
    for i in 2..5
        partnerlinks = PartnerLink.create({active:true, company_id: @comp.id, name:"eBanking", link:"www.tkb.ch/ebanking"})
    end
end

usanz = User.all.count-1
capanz = Company.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..20
    cra1 = random.rand(capanz)+1
    @comp = Company.find(cra1)
    mobjects = Mobject.create({active:true, mtype:"Angebote", msubtype:"Aktion", name:"Sonderaktion "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id:29})
    @mob = Mobject.where('name=?', "Sonderaktion "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
    mobjects = Mobject.create({active:true, mtype:"Angebote", msubtype:"Standard", name:"Angebot "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id:28})
    @mob = Mobject.where('name=?', "Angebot "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end
for i in 1..20
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Angebote", msubtype:"Aktion", name:"Sonderaktion "+i.to_s+" von "+@user.lastname, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id:29})
    @mob = Mobject.where('name=?', "Sonderaktion "+i.to_s+" von " + @user.lastname).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
    mobjects = Mobject.create({active:true, mtype:"Angebote", msubtype:"Standard", name:"Angebot "+i.to_s+" von "+@user.lastname, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1,  mcategory_id:28})
    @mob = Mobject.where('name=?', "Angebot "+i.to_s+" von " + @user.lastname).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end

usanz = User.all.count-1
capanz = Company.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..20
    cra1 = random.rand(capanz)+1
    cat = random.rand(10)+1+30
    @comp = Company.find(cra1)
    mobjects = Mobject.create({active:true, mtype:"Vermietungen", msubtype: nil, name:"Vermietobjekt "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id:30})
    @mob = Mobject.where('name=?', "Vermietobjekt "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Vermietungen", msubtype: nil, name:"Vermietobjekt "+i.to_s+" von "+@user.name, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id:30})
    @mob = Mobject.where('name=?', "Vermietobjekt "+i.to_s+" von " + @user.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end

#OBJECT Ausschreibungen 30..40
usanz = User.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..20
    cat = random.rand(30)+1
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Ausschreibungen", msubtype: nil, name:"Ausschreibungslos "+i.to_s+" von "+@user.name, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id: cat})
    @mob = Mobject.where('name=?', "Ausschreibungslos "+i.to_s+" von " + @user.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end

#OBJECT Stellenanzeigen 30..40
capanz = Company.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..20
    cra1 = random.rand(capanz)+1
    cat = random.rand(30)+1
    @comp = Company.find(cra1)
    mobjects = Mobject.create({active:true, mtype:"Stellenanzeigen", msubtype: "Anbieten", name:"Stelle "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id: cat})
    @mob = Mobject.where('name=?', "Stelle "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end

capanz = Company.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..20
    cra1 = random.rand(capanz)+1
    cat = random.rand(8)+1+40
    @comp = Company.find(cra1)
    mobjects = Mobject.create({active:true, mtype:"Veranstaltungen", msubtype: nil, name:"Event "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id: cat})
    @mob = Mobject.where('name=?', "Event "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end

usanz = User.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..20
    cat = random.rand(6)+1+48
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Ausflugsziele", msubtype: nil, name:"Ausflug "+i.to_s+" von "+@user.name, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id: cat})
    @mob = Mobject.where('name=?', "Ausflug "+i.to_s+" von " + @user.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end
    
usanz = User.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..20
    cat = random.rand(8)+1+55
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Kleinanzeigen", msubtype: "Anbieten", name:"Kleinanzeige "+i.to_s+" von "+@user.name, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id: cat})
    @mob = Mobject.where('name=?', "Kleinanzeige "+i.to_s+" von " + @user.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end

usanz = User.all.count-1
capanz = Company.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..10
    cra1 = random.rand(capanz)+1
    cat = 65
    @comp = Company.find(cra1)
    mobjects = Mobject.create({active:true, mtype:"Crowdfunding", msubtype: "Spenden", name:"Spendeninitiative "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id:cat, amount:1000, reward: "Test-CD", due_date: Date.today+365, interest_rate: 3.5, price:100})
    @mob = Mobject.where('name=?', "Spendeninitiative "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Crowdfunding", msubtype: "Spenden", name:"Spendeninitiative "+i.to_s+" von "+@user.name, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id:cat, amount:1000, reward: "Test-CD", due_date: Date.today+365, interest_rate: 3.5, price:100})
    @mob = Mobject.where('name=?', "Spendeninitiative "+i.to_s+" von " + @user.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end
usanz = User.all.count-1
capanz = Company.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..10
    cra1 = random.rand(capanz)+1
    cat = 65
    @comp = Company.find(cra1)
    mobjects = Mobject.create({active:true, mtype:"Crowdfunding", msubtype: "Belohnungen", name:"Rewardinitiative "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id:cat, amount:1000, reward: "Test-CD", due_date: Date.today+365, interest_rate: 3.5, price:100})
    @mob = Mobject.where('name=?', "Rewardinitiative "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... " })
    end
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Crowdfunding", msubtype: "Belohnungen", name:"Rewardinitiative "+i.to_s+" von "+@user.name, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id:cat, amount:1000, reward: "Test-CD", due_date: Date.today+365, interest_rate: 3.5, price:100})
    @mob = Mobject.where('name=?', "Rewardinitiative "+i.to_s+" von " + @user.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... " })
    end
end
usanz = User.all.count-1
capanz = Company.all.count-1
random = Random.new(Time.new.to_i)
for i in 1..10
    cra1 = random.rand(capanz)+1
    cat = 65
    @comp = Company.find(cra1)
    mobjects = Mobject.create({active:true, mtype:"Crowdfunding", msubtype: "Zinsen", name:"Kreditinitiative "+i.to_s+" von "+@comp.name, date_from:Date.today, date_to:Date.today+30, owner_type:"Company", owner_id: cra1, mcategory_id:cat, amount:1000, reward: "Test-CD", due_date: Date.today+365, interest_rate: 3.5, price:100})
    @mob = Mobject.where('name=?', "Kreditinitiative "+i.to_s+" von " + @comp.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
    ura1 = random.rand(usanz)+1
    @user = User.find(ura1)
    mobjects = Mobject.create({active:true, mtype:"Crowdfunding", msubtype: "Zinsen", name:"Kreditinitiative "+i.to_s+" von "+@user.name, date_from:Date.today, date_to:Date.today+30, owner_type:"User", owner_id: ura1, mcategory_id:cat, amount:1000, reward: "Test-CD", due_date: Date.today+365, interest_rate: 3.5, price:100})
    @mob = Mobject.where('name=?', "Kreditinitiative "+i.to_s+" von " + @user.name).first
    for k in 1..3
        mdetails = Mdetail.create({mobject_id: @mob.id, name:"Kurzbezeichnung Detail... ", description:"dies ist die Beschreibung Detail... "})
    end
end

#create Stats
@cfs = Mobject.where('mtype=?',"Crowdfunding")
@cfs.each do |c|
    usanz = User.all.count-1
    capanz = Company.all.count-1
    for i in 1..20
        cra1 = random.rand(capanz)+1
        ura1 = random.rand(usanz)+1
        dat = random.rand(200)-200
        mstats = Mstat.create({mobject_id: c.id, owner_type:"User", owner_id: ura1, amount:100, created_at:Date.today-dat})
        mstats = Mstat.create({mobject_id: c.id, owner_type:"Company", owner_id: cra1, amount:250, created_at:Date.today-dat})
    end
end

if false

    rats = Rating.create({status:"ok", service_id:14, user_id:1, user_rating:4, user_comment:"Wahnsinn für den Preis" })
    calenders = Calender.create({status:"ok", active:true, vehicle_id:1, user_id:4, date_from:DateTime.now, date_to:DateTime.now+1, time_from:10, time_to:12})

end