module AppointmentsHelper
    
    def AppItem(user, appointments, start)

        if user.time_from
            start_stunde = user.time_from
        else
            start_stunde = 8
        end
        if user.time_to
            ende_stunde = user.time_to
        else
            ende_stunde = 18
        end
        
        anz_stunden = ende_stunde - start_stunde
        anz_tage = 7
        array = Array.new(anz_stunden+1) {Array.new(anz_tage)}
        
        for stunde in 0..anz_stunden
            for tag in 0..anz_tage-1
                array[stunde][tag] = 0
            end
        end
        
        appointments.each do |c|
            for tag in 0..anz_tage-1
                if c.app_date.to_date == (start+tag).to_date
                    for stunde in 0..anz_stunden
                        if (stunde+start_stunde) >= c.time_from and (stunde+start_stunde) < c.time_to
                            array[stunde][tag] = Hash.new
                            array[stunde][tag] = {"key" => c.id, "status" => c.status, "channel" => c.channel}
                        end
                    end
                end
            end
        end
        
        html_string = ""
        for stunde in 0..anz_stunden
            html_string = html_string + "<tr>"
                html_string = html_string + "<td>"
                    html_string = html_string + (stunde+start_stunde).to_s + " Uhr"
                html_string = html_string + "</td>"
                for tag in 0..anz_tage-1
                    html_string = html_string + "<td>"
                        if array[stunde][tag] != 0
                          html_string = html_string + appointment_details(array[stunde][tag]["status"], array[stunde][tag]["channel"])
                        end
                    html_string = html_string + "</td>"
                end
            html_string = html_string + "</tr>"
        end
        return html_string.html_safe
    end
    
    def appointment_details(status, channel)
      html_string = ""
      case status
        when "angefragt"
           html_string = html_string + "<angefragt>"
        when "leider nicht möglich"
           html_string = html_string + "<abgelehnt>"
        when "bestaetigt"
           html_string = html_string + "<bestaetigt>"
        when "nicht verfügbar"
           html_string = html_string + "<geblockt>"
        else
      end
      if status != "nicht verfügbar"
          case channel
            when "Geschäftsstelle"
               html_string = html_string + '<i class="glyphicon glyphicon-briefcase"></i>'
            when "Treffpunkt"
               html_string = html_string + '<i class="glyphicon glyphicon-map-marker"></i>'
            when "Wohnort Berater"
               html_string = html_string + '<i class="glyphicon glyphicon-home"></i>'
            when "Wohnort Kunde"
               html_string = html_string + '<i class="glyphicon glyphicon-home"></i>'
            when "Telefon"
               html_string = html_string + '<i class="glyphicon glyphicon-phone-alt"></i>'
            when "VideoChat"
               html_string = html_string + '<i class="glyphicon glyphicon-facetime-video"></i>'
            else
          end
      else
          html_string = html_string + '<i class="glyphicon glyphicon-remove"></i>'
      end
      case status
        when "angefragt"
           html_string = html_string + "</angefragt>"
        when "leider nicht möglich"
           html_string = html_string + "</abgelehnt>"
        when "bestaetigt"
           html_string = html_string + "</bestaetigt>"
        when "nicht verfügbar"
           html_string = html_string + "</geblockt>"
        else
      end
      return html_string.html_safe
    end
    
end
