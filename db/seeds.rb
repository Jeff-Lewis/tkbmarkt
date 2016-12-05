# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

path = Rails.root.to_s + "/app/assets/images/"
path2 = Rails.root.to_s + "/app/assets/images/"

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

users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"09.05.1963", anonymous:false, status:"ok", active:true, email:"horst.wurm@bluewin.ch", password:"password", name:"Horst", lastname:"Wurm", address1:"Hörnliblick 11", address2:"Zezikon", address3:"Thurgau", superuser:true, webmaster:true})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"11.2.1970", anonymous:false, status:"ok", active:true, email:"t.oschewsky@bluewin.ch", password:"password", name:"Tanja", lastname:"Oschewsky", address1:"Hörnliblick 11", address2:"Zezikon", address3:"Thurgau", superuser:false})
users = User.create({calendar:true, time_from:8, time_to:20, dateofbirth:"12.12.2016", anonymous:false, status:"ok", active:true, email:"hans.wurst@gmx.com", password:"password", name:"Hans", lastname:"Wurst", address1:"Bahnhofstrasse 11", address2:"Frauenfeld", address3:"", superuser:false})

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
    
#create some companies...
companies = Company.create({status:"ok", active:true, user_id:1, name:"Fischzucht Hecht", mcategory_id:24 ,stichworte: "Fische, Zierfische, Angelbedarf", address1:"Bahnhof", address2:"Frauenfeld", address3:"Thurgau"}) 
companies = Company.create({status:"ok", active:true, user_id:2, name:"Alder Entsorgung", mcategory_id:11 ,stichworte: "Hocbau, Tiefbau", address1:"Bahnhof", address2:"Wil", address3:"Thurgau"}) 
companies = Company.create({status:"ok", active:true, user_id:3, name:"Eisenwaren Müller", mcategory_id:12 ,stichworte: "Hocbau, Tiefbau", address1:"Thurgauer Str", address2:"Matzingen", address3:"Thurgau"}) 
companies = Company.create({status:"ok", active:true, user_id:1, name:"Thurgauer Kantonalbank", partner:true, mcategory_id:26 ,stichworte: "Banken", address1:"Bahnhof", address2:"Weinfelden", address3:"Thurgau"}) 

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
