module UsersHelper
  
def carousel2(mobject, size)
      case size
        when :small
            si = "50x50"
        when :thumb
            si = "100x100"
        when :medium
            si = "250x250"
        when :big
            si = "500x500"
    end
    html = ""
    if mobject.mdetails == nil
      html = html + image_tag(image_def("Object", mobject.mtype, mobject.msubtype), :size => size, class:"card-img-top img-responsive" )
    else
      if mobject.mdetails.count == 0
        html = html + image_tag(image_def("Object", mobject.mtype, mobject.msubtype), :size => size, class:"card-img-top img-responsive" )
      else
        html = html +  "<ul class='bxslider'>"
        mobject.mdetails.each do |p|
          if p.avatar_file_name == nil
            html = html + image_tag(image_def("Object", mobject.mtype, mobject.msubtype), :size => size, class:"card-img-top img-responsive" )
          else
            html = html + (image_tag p.avatar(size), class:"img-rounded")
          end
        end
        html = html +  "</ul>"
      end
    end
    return html.html_safe
end

def align_text(txt)
    len = 30
    if txt == nil
        text = ""
    else
        if txt.length >= len
          text = txt[0,len]
        else
          text = txt
        end
    end
    return text + "..."
end

def build_medialist(md_string, items, cname, panel)
    
    if panel
        html_string = '<div class="panel-body">'
    else
        html_string =""
    end
        html_string = html_string + "<div class='row'>"
        items.each do |item|
            html_string = html_string + '<div class="' + md_string.to_s + '">'
                html_string = html_string + "<div class='media'>"
                    html_string = html_string + "<div class='media-left'>"
                        case cname
                            when "actions"
                                html_string = html_string + "<a href=/services/"+item.id.to_s+">"
                            else 
                                html_string = html_string + "<a href=/"+cname+"/"+item.id.to_s+">"
                        end
                        case items.table_name
                            when "requests"
                                html_string = html_string + showFirstImage(:small, item, item.request_details)
                                #html_string = html_string + carousel2(item.request_details,:small)
                            when "hotspots"
                                html_string = html_string + showFirstImage(:small,item, item.hotspot_details)
                                #html_string = html_string + carousel2(item.hotspot_details,:small)
                            when "bids"
                                html_string = html_string + showFirstImage(:small, item, item.bid_details)
                                #html_string = html_string + carousel2(item.bid_details,:small)
                            when "events"
                                html_string = html_string + showFirstImage(:small, item, item.event_details)
                                #html_string = html_string + carousel2(item.event_details,:small)
                            when "donations"
                                html_string = html_string + showFirstImage(:small, item, item.donation_details)
                                #html_string = html_string + carousel2(item.donation_details,:small)
                            when "jobs"
                                if item.company.avatar_file_name
                                    html_string = html_string + (image_tag item.company.avatar(:small), class:'img-rounded')
                                else
                                    html_string = html_string + (image_tag 'company_a.png', :size => '50x50', class:'img-rounded')
                                end
                            else
                                if item.avatar_file_name
                                    html_string = html_string + (image_tag item.avatar(:small), class:'img-rounded')
                                else
                                    html_string = html_string + (image_tag 'user_a.png', :size => '50x50', class:'img-rounded')
                                end
                        end
                        html_string = html_string + "</a>"
                    html_string = html_string + "</div>"
                    html_string = html_string + "<div class='media-body'>"
                        if (Date.today - item.created_at.to_date).to_i < 5
                            html_string = html_string + (image_tag 'neu.png', :size => '30x30', class:'img-rounded')
                        else
#                            if item.updated_at.to_date == Date.today
#                                html_string = html_string + (image_tag 'update.jpg', :size => '30x30', class:'img-rounded')
#                            end
                        end 
                      case items.table_name
                      when "requests"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
  					      if !item.social
          					  if item.price
    					        html_string = html_string + "<preiss><b>" + sprintf("%05.2f CHF", item.price) + "</b></preiss>"
    					      end
    					  else
    					      html_string = html_string + "<preiss><b><i class='glyphicon glyphicon-heart'></i></b></preiss>"
    					  end
                          html_string = html_string + "<br>"    					  
                          if item.date_to != nil
                              html_string = html_string + "<b><ntext>noch </ntext></b><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits> <b><ntext> Tage</ntext></b>"
                          end
                          #html_string = html_string + "<br>"    					  
                          #if !item.user.anonymous
                          #  if item.user.avatar_file_name == nil
                          #    html_string = html_string + (image_tag "user_a.png", :size => "50x50", class:"img-rounded")
                          #  else
                          #    html_string = html_string + (image_tag item.user.avatar(:small), class:"img-rounded") + "<br>"
                          #    html_string = html_string + item.user.name + " " + item.user.lastname
                          #  end
                          #end

                      when "users"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " " + item.lastname + " "
                          if item.services.where("social=?",true).count > 0
                                html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"
                          end
                          html_string = html_string + "</h4>"
                          html_string = html_string + item.geo_address
                      when "companies"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          if item.services.where("social=?",true).count > 0
                                html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"
                          end
                          html_string = html_string + "</h4>"
                          html_string = html_string + item.geo_address
                      when "services"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
                          avg_rating(item.id).times do
                            html_string = html_string + "<i class='glyphicon glyphicon-star'></i>" 
                          end
                          if item.social
                            html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"+ " "
                          end
                          if item.company_id != nil
                              html_string = html_string + item.company.name + "<br>"
                          end
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname + "<br>"
                          end
                          if item.date_to != nil
                            html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                          end
                      when "bids"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname + "<br>"
                          end
                          if item.date_to != nil
                            html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                          end
                      when "events"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
                          if item.company_id != nil
                              html_string = html_string + item.company.name
                          end
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname
                          end
                          html_string = html_string + "<br>"
                          if item.date_to != nil
                            html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                          end
                          #if item.sponsors.count > 0
                          #  html_string = html_string + "Sponsoren:<br>"
                          #end
                          #item.sponsors.each do |s|
                          #  html_string = html_string + (image_tag s.company.avatar(:small), class:'img-rounded')
                          #end

                      when "vehicles"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          if item.company_id != nil
                              html_string = html_string + item.company.name
                          end
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname
                          end
                      when "jobs"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          if item.company_id != nil
                              html_string = html_string + item.company.name + "<br>"
                              html_string = html_string + item.company.category.name
                          end
                      when "hotspots"
                          HsRating.avg_rating(item).to_i.times do
                            html_string = html_string + "<i class='glyphicon glyphicon-star'></i>" + " "
                          end
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          html_string = html_string + item.user.name + " "+ item.user.lastname
                      when "donations"
                          if item.date_to != nil
                              html_string = html_string + "<b><ntext>noch </ntext></b><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits> <b><ntext> Tage</ntext></b>"
                          end
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          if item.company_id
                              html_string = html_string + item.company.name
                          end
                          if item.user_id
                              html_string = html_string + item.user.name + " " + item.user.lastname
                          end
                          soll = item.amount
                          if item.donation_stats != nil
                            ist  = item.donation_stats.sum(:amount)
                          else
                            ist = 0
                          end
                          if item.dtype == "Donation"
                              html_string = html_string + "<br>Spendenstand<br>"
                          end
                          if item.dtype == "Reward"
                              html_string = html_string + "<br>Stand Unterstützung<br>"
                          end
                          if item.dtype == "Loan"
                              html_string = html_string + "<br>Stand Kreditsumme<br>"
                          end
                          html_string = html_string + "<preiss>" + sprintf("%05.2f CHF",ist) + "</preiss><br>"
                          html_string = html_string + '<div class="progress">'
                              html_string = html_string + '<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="' + ist.to_s + '" aria-valuemin="0" aria-valuemax="' + soll.to_s + '" style="width: ' + (ist/soll*100).to_s + '%">'
                                  html_string = html_string + '<span class="sr-only">40% Complete (success)</span>'
                              html_string = html_string + "</div>"
                          html_string = html_string + "</div>"
                          if item.dtype == "Reward"
                              if item.price > 0 
                                  if ist > 0
                                      anz = ((item.amount-ist)/item.price).to_i
                                  else
                                      anz = (item.amount/item.price).to_i
                                  end
                              else
                                  anz = 0
                              end
                              html_string = html_string + "noch "+ anz.to_s + " Unterstützer gesucht"
                          end
                      end
                    html_string = html_string + "</div>"
                html_string = html_string + "<br></div>"
            html_string = html_string + "</div>"
        end
        html_string = html_string + "</div>"
    if panel
        html_string = html_string + "</div>"
    end
    html_string.html_safe
end

def build_medialist2(items, cname, par)

  html_string = "<br>"
  items.each do |item|
    
    show = true
    if cname == "nopartners"
      if par[:user_id]
        @customer = Customer.where('owner_type=? and owner_id=? and partner_id=?', "User", par[:user_id], item.id).first
      end
      if par[:company_id]
        @customer = Customer.where('owner_type=? and owner_id=? and partner_id=?', "Company", par[:company_id], item.id).first
      end
      if @customer
        show = false
      end
    end
    
    if item and show
    html_string = html_string + '<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">'
        html_string = html_string + '<div class="row">'
            html_string = html_string + '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">'
                html_string = html_string + '<div class="panel panel-default">'
                    html_string = html_string + '<div class="row padall">'
                      html_string = html_string + '<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
                          html_string = html_string + '<span></span>'
                          case items.table_name
                            when "users", "companies"
                              html_string = html_string + showImage2(:medium, item, true)
                            when "mobjects"
                              html_string = html_string + showFirstImage2(:medium, item, item.mdetails)
                            when "madvisors", "mratings", "msponsors", "mstats"
                              html_string = html_string + showFirstImage2(:medium, item, item.mobject.mdetails)
                            when "favourits"
                              @item = Object.const_get(item.object_name).find(item.object_id)
                              if @item
                                html_string = html_string + showImage2(:medium, @item, true)
                              end
                            when "customers"
                                @comp = Company.find(item.partner_id)
                                if @comp
                                  html_string = html_string + showImage2(:medium, @comp, true)
                                end
                            when "searches"
                                case item.search_domain
                                  when "Privatpersonen"
                                    html_string = html_string + link_to(users_path(:filter_id => item.id)) do
                                      image_tag(image_def(item.search_domain, item.mtype, item.msubtype))
                                    end
                                  when "Institutionen"
                                    html_string = html_string + link_to(companies_path(:filter_id => item.id)) do
                                      image_tag(image_def(item.search_domain, item.mtype, item.msubtype))
                                    end
                                  when "Object"
                                    html_string = html_string + link_to(mobjects_path(:filter_id => item.id)) do
                                      image_tag(image_def(item.search_domain, item.mtype, item.msubtype))
                                    end
                                end
                          end
                      html_string = html_string + "</div>"
                      html_string = html_string + '<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
                        html_string = html_string + '<div class="clearfix">'
                            html_string = html_string + '<div class="pull-left">'
                              case items.table_name
                                  when "users"
                                    html_string = html_string + '<list-h1>' + item.name + " " + item.lastname + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-home"></i>'
                                    html_string = html_string + "<list>" + item.geo_address + '</list><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i>'
                                    html_string = html_string + "<list>" + item.email + '</list><br>'
                                  when "companies"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + "<list>" + item.mcategory.name + '</list><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-home"></i>'
                                    html_string = html_string + "<list>" + item.geo_address + '</list><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i>'
                                    html_string = html_string + "<list>" + item.user.email + '</list><br>'
                                  when "customers"
                                    html_string = html_string + '<list-h1>' + @comp.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + "<list>" + @comp.mcategory.name + '</list><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-home"></i>'
                                    html_string = html_string + "<list>" + @comp.geo_address + '</list><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i>'
                                    html_string = html_string + "<list>" + @comp.user.email + '</list><br>'
                                  when "mobjects"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + "<list>" + item.mcategory.name + '</list><br>'
                                    if item.owner_type == "Company"
                                        html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                        html_string = html_string + "<list>" + item.owner.name + "</list><br>"
                                    end
                                    if item.owner_type == "User"
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + "<list>" + item.owner.name + " "+ item.owner.lastname + "</list><br>"
                                    end
                                  when "madvisors", "msponsors", "mstats"
                                    html_string = html_string + '<list-h1>' + item.mobject.name + '<br></list-h1><br>'
                                    if items.table_name == "mstats"
                                      if item.owner_type == "Company"
                                          html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                          html_string = html_string + "<list>" + item.owner.name + "</list><br>"
                                      end
                                      if item.owner_type == "User"
                                          html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                          html_string = html_string + "<list>" + item.owner.name + " "+ item.owner.lastname + "</list><br>"
                                      end
                                    else
                                      if item.mobject.company_id
                                          html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                          html_string = html_string + "<list>" + item.mobject.company.name + "</list><br>"
                                      end
                                      if item.mobject.user_id
                                          html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                          html_string = html_string + "<list>" + item.mobject.user.name + " "+ item.mobject.user.lastname + "</list><br>"
                                      end
                                    end
                                  when "favourits"
                                    if Object.const_get(item.object_name).to_s == "User"
                                        html_string = html_string + '<list-h1>' + @item.name + " " + @item.lastname + '</list-h1><br>'
                                    end
                                    if Object.const_get(item.object_name).to_s == "Company"
                                        html_string = html_string + '<list-h1>' + @item.name + '</list-h1><br>'
                                    end
                                    html_string = html_string + "<list>" + @item.geo_address + '</list><br>'

                                  when "searches"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    if item.search_domain == "Object"
                                      html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i> '
                                      html_string = html_string + "<list>" + item.mtype + "</list><br>" 
                                      html_string = html_string + "<list>" + item.msubtype.to_s + '</list><br>'
                                    end
                                    html_string = html_string + '<i class="glyphicon glyphicon-question-sign"></i> '
                                    html_string = html_string + "<list>"+'Anzahl ' + item.counter.to_s + '</list><br>'

                              end
                            html_string = html_string + "</div>"
                        html_string = html_string + "</div>"
                      html_string = html_string + "</div>"
                    html_string = html_string + "</div>"
                html_string = html_string + '<div class="panel panel-list nopadding" onclick="return init_map(0);">'
                  html_string = html_string + '<div class="list-banner">'
                    if (Date.today - item.created_at.to_date).to_i < 5
                        html_string = html_string + (image_tag 'neu.png', :size => '30x30', class:'img-rounded')
                    end 
                    html_string = html_string + item.created_at.strftime("%d.%m.%Y")
                    case cname 
                      when "favourits"
          	            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do 
                          content_tag(:i, nil, class:"btn btn-danger glyphicon glyphicon-trash")
                        end
                        if Object.const_get(item.object_name).to_s == "User"
                          html_string = html_string + "<a href=/users/"+@item.id.to_s + ">"
                        end
                        if Object.const_get(item.object_name).to_s == "Company"
                          html_string = html_string + "<a href=/companies/"+@item.id.to_s + ">"
                        end
                      when "partners"
          	            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do 
                          content_tag(:i, nil, class:"btn btn-danger glyphicon glyphicon-trash")
                        end
          	            html_string = html_string + link_to(edit_customer_path(:id => item)) do 
                          content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
                        end
          	            html_string = html_string + link_to(accounts_path(:customer_id => item)) do 
                          content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
                        end
                        html_string = html_string + "<a href=/companies/"+item.partner_id.to_s + ">"
                      when "nopartners"
                        if par[:user_id]
            	            html_string = html_string + link_to(new_customer_path(:user_id => par[:user_id], :partner_id => item)) do 
                            content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-pencil")
                          end
                        end
                        if par[:company_id]
            	            html_string = html_string + link_to(new_customer_path(:company_id => par[:company_id], :partner_id => item)) do 
                            content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-pencil")
                          end
                        end
                        html_string = html_string + "<a href=/companies/"+item.id.to_s + ">"
                      when "searches"
          	            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do 
                          content_tag(:i, nil, class:"btn btn-danger glyphicon glyphicon-trash")
                        end
          	            html_string = html_string + link_to(edit_search_path(:id => item)) do 
                          content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
                        end
                        case item.search_domain
                          when "Privatpersonen"
              	            html_string = html_string + link_to(users_path(:filter_id => item.id)) do 
                              content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-filter")
                            end
                          when "Institutionen"
              	            html_string = html_string + link_to(companies_path(:filter_id => item.id)) do 
                              content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-filter")
                            end
                          when "Object"
              	            html_string = html_string + link_to(mobjects_path(:filter_id => item.id)) do 
                              content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-filter")
                            end
                        end 
                        html_string = html_string + "<a href=/searches/"+item.id.to_s + "/edit>"
                      else
                          html_string = html_string + "<a href=/"+items.table_name+"/"+item.id.to_s + ">"
                    end
                    html_string = html_string + '<i class="btn btn-primary glyphicon glyphicon-circle-arrow-right pull-right"></i>'
                    html_string = html_string + "</a>"
                  html_string = html_string + "</div>"
                html_string = html_string + "</div>"
                html_string = html_string + "</div>"
            html_string = html_string + "</div>"
        html_string = html_string + "</div>"
    html_string = html_string + "</div>"
  end
  end
  return html_string.html_safe
end

def showFirstImage2(size, item, details)
      case size
        when :small
            si = "50x50"
        when :thumb
            si = "100x100"
        when :medium
            si = "250x250"
        when :big
            si = "500x500"
    end
    link_to item do
      if details.count > 0
        pic = details.first
        if pic.avatar_file_name
          image_tag pic.avatar(size), class:"img-rounded"
        else
          image_tag(image_def("Object", item.mtype, item.msubtype), :size => si, class:"card-img-top img-responsive" )
        end
      else
        image_tag(image_def("Object", item.mtype, item.msubtype), :size => si, class:"card-img-top img-responsive" )
      end
    end
end

def showImage2(size, item, linkit)
    case size
        when :small
            si = "50x50"
        when :thumb
            si = "100x100"
        when :medium
            si = "250x250"
        when :big
            si = "500x500"
    end
    if linkit
      link_to item do
        if item.avatar_file_name
            image_tag item.avatar(size), class:"card-img-top img-responsive"
        else
          case item.class.name
            when "User"
              image_tag(image_def("Privatpersonen", nil, nil), :size => si, class:"card-img-top img-responsive" )
            when "Company"
              image_tag(image_def("Institutionen", nil, nil), :size => si, class:"card-img-top img-responsive" )
            else
              image_tag("no_pic.jpg", :size => si, class:"card-img-top img-responsive" )
          end
        end
      end
    else
      if item.avatar_file_name
          image_tag item.avatar(size), class:"card-img-top img-responsive"
      else
        case item.class.name
          when "User"
            image_tag(image_def("Privatpersonen", nil, nil), :size => si, class:"card-img-top img-responsive" )
          when "Company"
            image_tag(image_def("Institutionen", nil, nil), :size => si, class:"card-img-top img-responsive" )
          else
            image_tag("no_pic.jpg", :size => si, class:"card-img-top img-responsive" )
        end
      end
    end
end

def header(header, format)
    if format
      html_string = "<div class='col-xs-12'><div class='panel-heading header'><li_header>" + header + "</li_header></div></div>"
    else
      html_string = "<div class='panel-heading header'><li_header>" + header + "</li_header></div>"
    end
    return html_string.html_safe
end

def navigate(object,item)
    
    html_string = "<navigate><div class='col-xs-12'><div class='panel-body'>"
    html_string = "<navigate>"
    
    case object
      when "User"
        html_string = html_string + build_nav("User",item,"User","user",item)
        html_string = html_string + build_nav("User",item,"Kalendereintraege","calendar",Appointment.where('user_id1=? or user_id2=?',item,item).count > 0)
        html_string = html_string + build_nav("User",item,"Angebote","shopping-cart",item.mobjects.where('mtype=?',"Angebote").count > 0)
        html_string = html_string + build_nav("User",item,"Ansprechpartner","question-sign",item.madvisors.count > 0)
        html_string = html_string + build_nav("User",item,"Institutionen","copyright-mark",item.companies.count > 0)
        html_string = html_string + build_nav("User",item,"Stellenanzeigen","briefcase",item.mobjects.where('mtype=?',"Stellenanzeigen").count > 0)
        html_string = html_string + build_nav("User",item,"Kleinanzeigen","pushpin",item.mobjects.where('mtype=?',"Kleinanzeigen").count > 0)
        html_string = html_string + build_nav("User",item,"Vermietungen","retweet",item.mobjects.where('mtype=?',"Vermietungen").count > 0)
        html_string = html_string + build_nav("User",item,"Veranstaltungen","glass",item.mobjects.where('mtype=?',"Veranstaltungen").count > 0)
        html_string = html_string + build_nav("User",item,"Tickets","barcode",item.user_tickets.count > 0)
        html_string = html_string + build_nav("User",item,"Ausflugsziele","camera",item.mobjects.where('mtype=?',"Ausflugsziele").count > 0)
        html_string = html_string + build_nav("User",item,"Ausschreibungen","pencil",item.mobjects.where('mtype=?',"Ausschreibungen").count > 0)
        html_string = html_string + build_nav("User",item,"Crowdfunding","globe", item.mobjects.where('mtype=?',"Crowdfunding").count > 0)
        html_string = html_string + build_nav("User",item,"Crowdfunding Beitraege","gift", item.mstats.count > 0)
        html_string = html_string + build_nav("User",item,"Bewertungen","star", item.mratings.count > 0)
        html_string = html_string + build_nav("User",item,"Favoriten","heart", item.favourits.count > 0)
        html_string = html_string + build_nav("User",item,"Kundenstatus","check", item.customers.count > 0)
        html_string = html_string + build_nav("User",item,"Transaktionen","list", item.transactions.where('ttype=?', "Payment").count > 0)
        html_string = html_string + build_nav("User",item,"Email","envelope", Email.where('m_to=? or m_from=?', item.id, item.id).count > 0)

      when "Company"
        html_string = html_string + build_nav("Company",item,"Company","copyright-mark",item)
        html_string = html_string + build_nav("Company",item,"Angebote","shopping-cart",item.mobjects.where('mtype=?',"Angebote").count > 0)
        html_string = html_string + build_nav("Company",item,"Stellenanzeigen","briefcase",item.mobjects.where('mtype=?',"Stellenanzeigen").count > 0)
        html_string = html_string + build_nav("Company",item,"Kleinanzeigen","pushpin",item.mobjects.where('mtype=?',"Kleinanzeigen").count > 0)
        html_string = html_string + build_nav("Company",item,"Vermietungen","retweet",item.mobjects.where('mtype=?',"Vermietungen").count > 0)
        html_string = html_string + build_nav("Company",item,"Veranstaltungen","glass",item.mobjects.where('mtype=?',"Veranstaltungen").count > 0)
        html_string = html_string + build_nav("Company",item,"Sponsorenengagements","barcode",item.msponsors.count > 0)
        html_string = html_string + build_nav("Company",item,"Ausflugsziele","camera",item.mobjects.where('mtype=?',"Ausflugsziele").count > 0)
        html_string = html_string + build_nav("Company",item,"Ausschreibungen","pencil",item.mobjects.where('mtype=?',"Ausschreibungen").count > 0)
        html_string = html_string + build_nav("Company",item,"Crowdfunding","globe", item.mobjects.where('mtype=?',"Crowdfunding").count > 0)
        html_string = html_string + build_nav("Company",item,"Crowdfunding Beitraege","gift", item.mstats.count > 0)
        html_string = html_string + build_nav("Company",item,"Kundenstatus","check", item.customers.count > 0)
        html_string = html_string + build_nav("Company",item,"Transaktionen","list", item.transactions.where('ttype=?', "Payment").count > 0)
        html_string = html_string + build_nav("Company",item,"Email","envelope", Email.where('m_to=? or m_from=?', item.user.id, item.user.id).count > 0)
        if item.partner
          html_string = html_string + build_nav("Company",item,"Links", "volume-up", PartnerLink.where('company_id=?', item.id).count > 0)
        end

      when "Object"
        html_string = html_string + build_nav("Object",item,"Informationen","info-sign",item)
        html_string = html_string + build_nav("Object",item,"Details","book",item.mdetails.count > 0)
        if item.mtype == "Veranstaltungen"
          html_string = html_string + build_nav("Object",item,"Sponsoren","heart",item.msponsors.count > 0)
        end
        if item.mtype == "Angebote" or item.mtype == "Stellenanzeigen"
          html_string = html_string + build_nav("Object",item,"Advisors","user",item.madvisors.count > 0)
        end
        if item.mtype == "Vermietungen"
          html_string = html_string + build_nav("Object",item,"Kalender","calendar",item.mcalendars.count > 0)
        end
        if item.mtype == "Ausschreibungen"
          html_string = html_string + build_nav("Object",item,"Ausschreibungsangebote","inbox",item.mdetails.count > 0)
        end
        if item.mtype == "Crowdfunding"
          html_string = html_string + build_nav("Object",item,"CF_Statistik","stats",item.mstats.count > 0)
          html_string = html_string + build_nav("Object",item,"CF_Transaktionen","user",item.mstats.count > 0)
        end
        html_string = html_string + build_nav("Object",item,"Ratings","star",item.mratings.count > 0)

    end
    
    #html_string = html_string + "</div></div></navigate>"
    html_string = html_string + "</navigate>"
    return html_string.html_safe
    
end

def build_nav(object, item, topic, glyphicon, condition)
  if condition
    btn = "active"
  else
    btn = "inactive"
  end
  
  case object
    when "User"
      html_string = link_to(user_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Company"
      html_string = link_to(company_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Object"
      html_string = link_to(mobject_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
  end
  return html_string.html_safe
end

def action_buttons2(object, item, topic)
    html_string = "<div class='col-xs-12'><div class='panel-body'>"
    
    case object 
      when "User"
        html_string = html_string + link_to(users_path :page => session[:page]) do
          content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-list")
        end
        if user_signed_in?
          html_string = html_string + link_to(new_favourit_path :object_name => "User", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-heart")
          end
          if current_user.id == item.id or current_user.superuser
              html_string = html_string + link_to(edit_user_path(item)) do
              content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-wrench")
            end
            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                content_tag(:i, nil, class: "btn btn-danger pull-right glyphicon glyphicon-trash")
            end
          end
          html_string = html_string + link_to(new_webmaster_path :object_name => "User", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-warning pull-right glyphicon glyphicon-eye-open")
          end
          html_string = html_string + link_to(listaccount_index_path :user_id => current_user.id, :user_id_ver => item.id, :company_id_ver => nil, :ref => "Vergütung an "+item.name + " " + item.lastname, :object_name => "User", :object_id => item.id, :amount => nil) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-euro")
          end
          html_string = html_string + link_to(new_user_position_path(:user_id => current_user.id)) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-map-marker")
          end
          
          case topic
            when "Kalendereintraege"
              html_string = html_string + link_to(user_path(:user_id => item.id, :dir => "<", :topic => topic)) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-left")
              end
              html_string = html_string + link_to(user_path(:user_id => item.id, :dir => ">", :topic => topic)) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-right")
              end
              html_string = html_string + link_to(new_appointment_path :user_id1 => current_user.id, :user_id2 => @user.id) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
            when "Angebote", "Kleinanzeigen", "Stellenanzeigen", "Crowdfunding"
              html_string = html_string + link_to(home_index8_path :user_id => current_user.id, :mtype => topic) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
            when "Institutionen"
              html_string = html_string + link_to(new_company_path :user_id => current_user.id) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
            when "Vermietungen", "Veranstaltungen", "Ausflugsziele", "Ausschreibungen"
              html_string = html_string + link_to(new_mobject_path :user_id => current_user.id, :mtype => topic, :msubtype => nil) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
            when "Kundenstatus"
              html_string = html_string + link_to(new_customer_path :user_id => item.id) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
            when "Email"
              html_string = html_string + link_to(new_email_path(:m_from_id => current_user.id, :m_to_id => item.id)) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
          end
          
        end

      when "Company"
        html_string = html_string + link_to(companies_path :page => session[:page]) do
          content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-list")
        end
        if user_signed_in?
          html_string = html_string + link_to(new_favourit_path :object_name => "Company", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-heart")
          end
          if current_user.id == item.user_id or current_user.superuser
            if item.partner
              #html_string = html_string + link_to(customer_advisor_index2_path :partner_id => item.id) do
                #content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-user")
              #end
            end
            html_string = html_string + link_to(edit_company_path(item)) do
              content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-wrench")
            end
            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
              content_tag(:i, nil, class: "btn btn-danger pull-right glyphicon glyphicon-trash")
            end
          end
          html_string = html_string + link_to(new_webmaster_path :object_name => "Company", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-warning pull-right glyphicon glyphicon-eye-open")
          end
          html_string = html_string + link_to(listaccount_index_path :user_id => current_user.id, :user_id_ver => nil, :company_id_ver => item.id, :ref => "Vergütung an "+item.name, :object_name => "Company", :object_id => item.id, :amount => nil) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-euro")
          end
          case topic
            when "Angebote", "Kleinanzeigen", "Crowdfunding","Stellenanzeigen"
              html_string = html_string + link_to(home_index8_path :company_id => item.id, :mtype => topic) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
            when "Vermietungen", "Veranstaltungen", "Ausflugsziele", "Ausschreibungen"
              html_string = html_string + link_to(new_mobject_path :company_id => item.id, :mtype => topic, :msubtype => nil) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
            when "Kundenstatus"
              html_string = html_string + link_to(customers_path :company_id => item.id) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-plus")
              end
          end
        end
        
      when "Object"
         html_string = html_string + link_to(mobjects_path :mtype => item.mtype, :msubtype => item.msubtype, :page => session[:page]) do
          content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         case topic
            when "Informationen"
               if user_signed_in?
                 if (item.owner_type == "User" and item.owner_id == current_user.id) or (item.owner_type == "Company" and item.owner.user_id == current_user.id)
           	        html_string = html_string + link_to(edit_mobject_path(item)) do
                       content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
                     end
           	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                       content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
                     end
                 end
                 html_string = html_string + link_to(new_webmaster_path :object_name => "Mobject", :object_id => item.id, :user_id => current_user.id) do
                   content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
                 end
               end
            when "Details"
                if user_signed_in?
                  #html_string = html_string + item.owner_id.to_s + item.owner_type 
                 if (item.owner_type == "User" and item.owner_id == current_user.id) or (item.owner_type == "Company" and item.owner.user_id == current_user.id)
                    html_string = html_string + link_to(new_mdetail_path(:mobject_id => item.id)) do
                      content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                    end
                 end
                end
            when "Ausschreibungsangebote"
                if user_signed_in?
                 if (item.user_id and current_user.id == item.user.id) or (item.company_id and current_user.id == item.company.user_id)
                    html_string = html_string + link_to(new_mdetail_path(:mobject_id => item.id)) do
                      content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                    end
                 end
                end
            when "Sponsoren"
              if user_signed_in?
                html_string = html_string + link_to(new_msponsor_path(:mobject_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "Ratings"
              if user_signed_in?
      	        html_string = html_string + link_to(new_mrating_path :mobject_id => item.id, :user_id => current_user.id) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "Advisors"
              if user_signed_in?
                if (item.user_id and current_user.id == item.user_id or current_user.superuser)
                  html_string = html_string + link_to(madvisors_path :mobject_id => item.id) do
                    content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                  end
                end
              end
            when "Kalender"
              html_string = html_string + link_to(mobject_path(:mobject_id => item.id, :dir => "<", :topic => topic)) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-left")
              end
              html_string = html_string + link_to(mobject_path(:mobject_id => item.id, :dir => ">", :topic => topic)) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-right")
              end
              if user_signed_in?
                html_string = html_string + link_to(new_mcalendar_path(:user_id => current_user.id, :mobject_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "CF_Statistik"
            when "CF_Transaktionen"
              if item.mstats.sum(:amount) < item.amount
                html_string = html_string + link_to(new_mstat_path(:mobject_id => item.id, :dontype => "User")) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-user")
                end
                html_string = html_string + link_to(new_mstat_path(:mobject_id => item.id, :dontype => "Company")) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-copyright-mark")
                end
              end
            when "Standort"
         end
        
    end
    html_string = html_string + "</div></div>"
    return html_string.html_safe
end

def build_stats(array, records, label)
  if records != nil
    anz = records.count
    if anz > 0
      hash = Hash.new
      hash = {"label" => label, "value" => anz}
      array << hash
      return array
    end
  end
  return array
end

def build_kachel_color(domain, name, path_param, logon, user_id, company_id)
  if logon and !user_signed_in?
    return
  else
    case domain
      when "mein xConnect"
        path = home_index6_path
        pic = image_def(domain, domain, nil)  

      when "Privatpersonen"
        path = users_path(:mtype => nil, :msubtype => nil)
        pic = image_def(domain, domain, nil)
      when "Institutionen"
        path = companies_path(:mtype => nil, :msubtype => nil)
        pic = image_def(domain, domain, nil)

      when "Angebote"
        path = mobjects_path(:mtype => "Angebote", :msubtype => "Standard")
        pic = image_def("Object", "Angebote", "Standard")
      when "Aktionen"
        path = mobjects_path(:mtype => "Angebote", :msubtype => "Aktion")
        pic = image_def("Object", "Angebote", "Aktion")
      when "Vermietungen"
        path = mobjects_path(:mtype => "Vermietungen", :msubtype => nil)
        pic = image_def("Object", "Vermietungen", nil)
      when "Ausschreibungen"
        path = mobjects_path(:mtype => "Ausschreibungen", :msubtype => nil)
        pic = image_def("Object", "Ausschreibungen", nil)
      when "Stellenanzeigen (Suchen)"
        path = mobjects_path(:mtype => "Stellenanzeigen", :msubtype => "Suchen")
        pic = image_def("Object", "Stellenanzeigen", "Suchen")
      when "Stellenanzeigen (Anbieten)"
        path = mobjects_path(:mtype => "Stellenanzeigen", :msubtype => "Anbieten")
        pic = image_def("Object", "Stellenanzeigen", "Anbieten")
      when "Veranstaltungen"
        path = mobjects_path(:mtype => "Veranstaltungen", :msubtype => nil)
        pic = image_def("Object", "Veranstaltungen", nil)
      when "Ausflugsziele"
        path = mobjects_path(:mtype => "Ausflugsziele", :msubtype => nil)
        pic = image_def("Object", "Ausflugsziele", nil)
      when "Kleinanzeigen (Suchen)"
        path = mobjects_path(:mtype => "Kleinanzeigen", :msubtype => "Suchen")
        pic = image_def("Object", "Kleinanzeigen", "Suchen")
      when "Kleinanzeigen (Anbieten)"
        path = mobjects_path(:mtype => "Kleinanzeigen", :msubtype => "Anbieten")
        pic = image_def("Object", "Kleinanzeigen", "Anbieten")
      when "Crowdfunding (Spenden)"
        path = mobjects_path(:mtype => "Crowdfunding", :msubtype => "Spenden")
        pic = image_def("Object", "Crowdfunding", "Spenden")
      when "Crowdfunding (Belohnungen)"
        path = mobjects_path(:mtype => "Crowdfunding", :msubtype => "Belohnungen")
        pic = image_def("Object", "Crowdfunding", "Belohnungen")
      when "Crowdfunding (Zinsen)"
        path = mobjects_path(:mtype => "Crowdfunding", :msubtype => "Zinsen")
        pic = image_def("Object", "Crowdfunding", "Zinsen")
      when "Kalender (Aktionen)"
        path = showcal_index_path(:mtype => "Angebote", :msubtype => "Aktion")
        pic = "calendar.jpg"
      when "Kalender (Veranstaltungen)"
        path = showcal_index_path(:mtype => "Veranstaltungen", :msubtype => nil)
        pic = "calendar.jpg"
      when "Kalender (Ausschreibungen)"
        path = showcal_index_path(:mtype => "Ausschreibungen", :msubtype => nil)
        pic = "calendar.jpg"

      when "Neues Angebot"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Angebote", :msubtype => "Standard")
        pic = "angebot.jpg"
      when "Neue Aktion"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Angebote", :msubtype => "Aktion")
        pic = "aktion.jpg"

      when "Neue Kleinanzeige (Anbieten)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Kleinanzeigen", :msubtype => "Anbieten")
        pic = "kleinanzeige.jpg"
      when "Neue Kleinanzeige (Suchen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Kleinanzeigen", :msubtype => "Suchen")
        pic = "kleinanzeige.jpg"

      when "Neue Stellenanzeige (Anbieten)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Stellenanzeigen", :msubtype => "Anbieten")
        pic = "stellenanzeige.jpg"
      when "Neue Stellenanzeige (Suchen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Stellenanzeigen", :msubtype => "Suchen")
        pic = "stellenanzeige.jpg"

      when "Neue Crowdfunding-Initiative (Spenden)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id,  :mtype => "Crowdfunding", :msubtype => "Spenden")
        pic = "spende.jpg"
      when "Neue Crowdfunding-Initiative (Belohnungen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Crowdfunding", :msubtype => "Belohnungen")
        pic = "belohnung.jpg"
      when "Neue Crowdfunding-Initiative (Zinsen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Crowdfunding", :msubtype => "Zinsen")
        pic = "kredit.jpg"

    end
    if path_param
      path = path_param
    end
    html_string = ""
    html_string = html_string + link_to(path) do
      content_tag(:div, nil, class:"col-xs-4 col-sm-4 col-md-3 col-lg-2") do 
        content_tag(:div, nil, class:"thumbnail kachel_min_height kachel_text", align:"center") do
          content_tag(:span, nil) do
            #content_tag(:i, nil, class:"glyphicon glyphicon-" + glyphicon, style:"font-size:" + icon_size + "em") + content_tag(:small_cal, "<br>".html_safe+object)
            #content_tag(:listh1, domain) + "<br><br>".html_safe + image_tag(glyphicon+".png", :size => "45x45") + "<br><br>".html_safe + content_tag(:listh3, object)
            if name and name.length > 0
              content_tag(:listh1, domain) + "<br><br>".html_safe + image_tag(pic, :size => "100x100") + "<br><br>".html_safe + content_tag(:listh3, name)
            else
              content_tag(:listh1, domain) + "<br><br>".html_safe + image_tag(pic, :size => "100x100")
            end
          end
        end
      end
    end

    return html_string.html_safe
    
  end
end

def image_def (domain, mtype, msubtype)
    case domain
      when "mein xConnect"
        pic = "connect.jpg"
      when "Privatpersonen"
        pic = "user.jpg"
      when "Institutionen"
        pic = "company.jpg"
        
      when "Object"
        case mtype
          when "Angebote"
            if msubtype == "Standard"
              pic = "angebot.jpg"
            else
              pic = "aktion.jpg"
            end

          when "Vermietungen"
            pic = "vermietung.jpg"

          when "Ausschreibungen"
            pic = "ausschreibung.jpg"

          when "Ausflugsziele"
            pic = "ausflug.jpg"

          when "Veranstaltungen"
            pic = "veranstaltung.jpg"

          when "Stellenanzeigen"
            if msubtype == "Suchen"
              pic = "stellenanzeige.jpg"
            else
              pic = "stellenanzeige.jpg"
            end

          when "Kleinanzeigen"
            if msubtype == "Suchen"
              pic = "kleinanzeige.jpg"
            else
              pic = "kleinanzeige.jpg"
            end

          when "Crowdfunding"
            case msubtype
              when "Spenden"
                pic = "spende.jpg"
              when "Belohnungen"
                pic = "belohnung.jpg"
              when "Zinsen"
                pic = "kredit.jpg"
            end

          when "Kalender (Aktionen)"
            pic = "calendar.jpg"
          when "Kalender (Veranstaltungen)"
            pic = "calendar.jpg"
          when "Kalender (Ausschreibungen)"
            pic = "calendar.jpg"
    
          when "Neues Angebot"
            pic = "angebot.jpg"
          when "Neue Aktion"
            pic = "aktion.jpg"
    
          when "Neue Kleinanzeige (Anbieten)"
            pic = "kleinanzeige.jpg"
          when "Neue Kleinanzeige (Suchen)"
            pic = "kleinanzeige.jpg"
    
          when "Neue Stellenanzeige (Anbieten)"
            pic = "stellenanzeige.jpg"
          when "Neue Stellenanzeige (Suchen)"
            pic = "stellenanzeige.jpg"
    
          when "Neue Crowdfunding-Initiative (Spenden)"
            pic = "spende.jpg"
          when "Neue Crowdfunding-Initiative (Belohnungen)"
            pic = "belohnung.jpg"
          when "Neue Crowdfunding-Initiative (Zinsen)"
            pic = "kredit.jpg"
          else
            pic = "no_pic.jpg"
        end
    end

end

def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
end

def avg_rating2(mobject)
    rat = Mrating.where("mobject_id=?", mobject).average(:rating)
    if rat != nil
        return rat.round
    else
        return 0
    end
end

def AktionDatum2(datum, mobject)
    if datum >= mobject.date_from and datum <= mobject.date_to
        return true
    else
        return false
    end
end

end    