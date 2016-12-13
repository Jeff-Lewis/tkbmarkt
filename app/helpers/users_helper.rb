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
        html = html +  '<div class="owl-show">'
        mobject.mdetails.each do |p|
          if p.avatar_file_name == nil
            html = html + "<div>" + image_tag(image_def("Object", mobject.mtype, mobject.msubtype), :size => size, class:"card-img-top img-responsive" ) + "</div>"
          else
            html = html + "<div>"+ (image_tag p.avatar(size), class:"img-rounded") + "</div>"
          end
        end
        html = html +  "</div>"
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

def build_medialist(items, cname, par)

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
                              html_string = html_string + showFirstImage2(:medium, item.mobject, item.mobject.mdetails)
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
        html_string = html_string + '<div class="thumbnail thumbnail-list">'
        
          html_string = html_string + '<div class="panel-body panel-listhead">'

            case items.table_name
                when "users"
                  html_string = html_string + item.name + " " + item.lastname
                when "companies", "mobjects", "searches"
                  html_string = html_string + item.name
                when "customers"
                  @comp = Company.find(item.partner_id)
                  html_string = html_string + @comp.name
                when "madvisors", "msponsors", "mstats"
                  html_string = html_string + item.mobject.name
                when "favourits"
                  @item = Object.const_get(item.object_name).find(item.object_id)
                  if Object.const_get(item.object_name).to_s == "User"
                      html_string = html_string + @item.name + " " + @item.lastname 
                  end
                  if Object.const_get(item.object_name).to_s == "Company"
                      html_string = html_string + @item.name 
                  end
            end

          html_string = html_string + '</div>'

          html_string = html_string + '<div class="row">'
            html_string = html_string + '<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">'
              html_string = html_string + '<div class="panel-header pull-left">'

                case items.table_name
                  when "users", "companies"
                    html_string = html_string + showImage2(:medium, item, true)
                  when "mobjects"
                    html_string = html_string + showFirstImage2(:medium, item, item.mdetails)
                  when "madvisors", "mratings", "msponsors", "mstats"
                    html_string = html_string + showFirstImage2(:medium, item.mobject, item.mobject.mdetails)
                  when "favourits"
                    @item = Object.const_get(item.object_name).find(item.object_id)
                    if @item
                      html_string = html_string + showImage2(:medium, @item, true)
                    end
                  when "customers"
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

              html_string = html_string + '</div>'
            html_string = html_string + '</div>'

            html_string = html_string + '<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xl-8">'
              html_string = html_string + '<div class="panel-header pull-left"><list>'
                case items.table_name
                    when "users"
                      html_string = html_string + '<i class="glyphicon glyphicon-home"></i> '
                      html_string = html_string + item.geo_address + '<br>'
                      html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i> '
                      html_string = html_string +  item.email
                    when "companies"
                      html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i> '
                      html_string = html_string + item.mcategory.name + '<br>'
                      html_string = html_string + '<i class="glyphicon glyphicon-home"></i> '
                      html_string = html_string + item.geo_address + '<br>'
                      html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i> '
                      html_string = html_string + item.user.email
                    when "customers"
                      html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i> '
                      html_string = html_string + @comp.mcategory.name + '<br>'
                      html_string = html_string + '<i class="glyphicon glyphicon-home"></i> '
                      html_string = html_string + @comp.geo_address + '<br>'
                      html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i> '
                      html_string = html_string + @comp.user.email + '<br>'
                    when "mobjects"
                      html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i> '
                      html_string = html_string + item.mcategory.name + '<br>'
                      if item.owner_type == "Company"
                          html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i> '
                          html_string = html_string + item.owner.name + "<br>"
                      end
                      if item.owner_type == "User"
                          html_string = html_string + '<i class="glyphicon glyphicon-user"></i> '
                          html_string = html_string + item.owner.name + " "+ item.owner.lastname + "<br>"
                      end
                    when "madvisors", "msponsors", "mstats"
                      if items.table_name == "mstats"
                        if item.mobject.owner_type == "Company"
                            html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i> '
                            html_string = html_string + item.mobject.owner.name + "<br>"
                        end
                        if item.mobject.owner_type == "User"
                            html_string = html_string + '<i class="glyphicon glyphicon-user"></i> '
                            html_string = html_string + item.mobject.owner.name + " "+ item.mobject.owner.lastname + "<br>"
                        end
                      else
                        if item.mobject.company_id
                            html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i> '
                            html_string = html_string + item.mobject.company.name + "<br>"
                        end
                        if item.mobject.user_id
                            html_string = html_string + '<i class="glyphicon glyphicon-user"></i> '
                            html_string = html_string + item.mobject.user.name + " "+ item.mobject.user.lastname + "<br>"
                        end
                      end
                    when "favourits"
                      html_string = html_string + @item.geo_address + '<br>'
    
                    when "searches"
                      if item.search_domain == "Object"
                        html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i> '
                        html_string = html_string + item.mtype + "<br>" 
                        html_string = html_string + item.msubtype.to_s + '<br>'
                      end
                      html_string = html_string + '<i class="glyphicon glyphicon-question-sign"></i> '
                      html_string = html_string + 'Anzahl ' + item.counter.to_s + '<br>'
    
                end
              html_string = html_string + '</list></div>'
            html_string = html_string + '</div>'
          html_string = html_string + '</div>'

          html_string = html_string + '<div class="panel panel-listfoot">'

            if (Date.today - item.created_at.to_date).to_i < 5
                html_string = html_string + (image_tag 'neu.png', :size => '30x30', class:'img-rounded')
            end 
            #html_string = html_string + item.created_at.strftime("%d.%m.%Y")
            case cname 
              when "favourits"
  	            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do 
                  content_tag(:i, nil, class:"btn btn-danger glyphicon glyphicon-trash pull-right")
                end
              when "partners"
  	            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do 
                  content_tag(:i, nil, class:"btn btn-danger glyphicon glyphicon-trash pull-right")
                end
  	            html_string = html_string + link_to(edit_customer_path(:id => item)) do 
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
                end
  	            html_string = html_string + link_to(accounts_path(:customer_id => item)) do 
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
                end
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
              when "searches"
  	            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do 
                  content_tag(:i, nil, class:"btn btn-danger glyphicon glyphicon-trash pull-right")
                end
  	            html_string = html_string + link_to(edit_search_path(:id => item)) do 
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
                end
            end

          html_string = html_string + '</div>'

        html_string = html_string + '</div>'
      html_string = html_string + '</div>'

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
        html_string = html_string + build_nav("User",item,"Crowdfunding","grain", item.mobjects.where('mtype=?',"Crowdfunding").count > 0)
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
        html_string = html_string + build_nav("Company",item,"Crowdfunding","grain", item.mobjects.where('mtype=?',"Crowdfunding").count > 0)
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
                    html_string = html_string + link_to(new_mdetail_path(:mobject_id => item.id, :type => "Details")) do
                      content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                    end
                 end
                end
            when "Ausschreibungsangebote"
                if user_signed_in?
                 if (item.owner_type == "User" and item.owner_id == current_user.id) or (item.owner_type == "Company" and item.owner.user_id == current_user.id)
                    html_string = html_string + link_to(new_mdetail_path(:mobject_id => item.id, :type => "Angebote")) do
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
                if (item.owner_type == "User" and item.owner_id == current_user.id)
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
        icon = "question-sign"

      when "Privatpersonen"
        path = users_path(:mtype => nil, :msubtype => nil)
        pic = image_def(domain, domain, nil)
        icon = "user"
      when "Institutionen"
        path = companies_path(:mtype => nil, :msubtype => nil)
        pic = image_def(domain, domain, nil)
        icon = "copyright-mark"

      when "Angebote"
        path = mobjects_path(:mtype => "Angebote", :msubtype => "Standard")
        pic = image_def("Object", "Angebote", "Standard")
        icon = "shopping-cart"
      when "Aktionen"
        path = mobjects_path(:mtype => "Angebote", :msubtype => "Aktion")
        pic = image_def("Object", "Angebote", "Aktion")
        icon = "shopping-cart"
      when "Vermietungen"
        path = mobjects_path(:mtype => "Vermietungen", :msubtype => nil)
        pic = image_def("Object", "Vermietungen", nil)
        icon = "retweet"
      when "Ausschreibungen"
        path = mobjects_path(:mtype => "Ausschreibungen", :msubtype => nil)
        pic = image_def("Object", "Ausschreibungen", nil)
        icon = "pencil"
      when "Stellenanzeigen (Suchen)"
        path = mobjects_path(:mtype => "Stellenanzeigen", :msubtype => "Suchen")
        pic = image_def("Object", "Stellenanzeigen", "Suchen")
        icon = "briefcase"
      when "Stellenanzeigen (Anbieten)"
        path = mobjects_path(:mtype => "Stellenanzeigen", :msubtype => "Anbieten")
        pic = image_def("Object", "Stellenanzeigen", "Anbieten")
        icon = "briefcase"
      when "Veranstaltungen"
        path = mobjects_path(:mtype => "Veranstaltungen", :msubtype => nil)
        pic = image_def("Object", "Veranstaltungen", nil)
        icon = "glass"
      when "Ausflugsziele"
        path = mobjects_path(:mtype => "Ausflugsziele", :msubtype => nil)
        pic = image_def("Object", "Ausflugsziele", nil)
        icon = "map-marker"
      when "Kleinanzeigen (Suchen)"
        path = mobjects_path(:mtype => "Kleinanzeigen", :msubtype => "Suchen")
        pic = image_def("Object", "Kleinanzeigen", "Suchen")
        icon = "align-justify"
      when "Kleinanzeigen (Anbieten)"
        path = mobjects_path(:mtype => "Kleinanzeigen", :msubtype => "Anbieten")
        pic = image_def("Object", "Kleinanzeigen", "Anbieten")
        icon = "align-justify"
      when "Crowdfunding (Spenden)"
        path = mobjects_path(:mtype => "Crowdfunding", :msubtype => "Spenden")
        pic = image_def("Object", "Crowdfunding", "Spenden")
        icon = "grain"
      when "Crowdfunding (Belohnungen)"
        path = mobjects_path(:mtype => "Crowdfunding", :msubtype => "Belohnungen")
        pic = image_def("Object", "Crowdfunding", "Belohnungen")
        icon = "grain"
      when "Crowdfunding (Zinsen)"
        path = mobjects_path(:mtype => "Crowdfunding", :msubtype => "Zinsen")
        pic = image_def("Object", "Crowdfunding", "Zinsen")
        icon = "grain"
      when "Kalender (Aktionen)"
        path = showcal_index_path(:mtype => "Angebote", :msubtype => "Aktion")
        pic = "calendar.jpg"
        icon = "calendar"
      when "Kalender (Veranstaltungen)"
        path = showcal_index_path(:mtype => "Veranstaltungen", :msubtype => nil)
        pic = "calendar.jpg"
        icon = "calendar"
      when "Kalender (Ausschreibungen)"
        path = showcal_index_path(:mtype => "Ausschreibungen", :msubtype => nil)
        pic = "calendar.jpg"
        icon = "calendar"

      when "Neues Angebot"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Angebote", :msubtype => "Standard")
        pic = "angebot.jpg"
        icon = "shopping-cart"
      when "Neue Aktion"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Angebote", :msubtype => "Aktion")
        pic = "aktion.jpg"
        icon = "shopping-cart"

      when "Neue Kleinanzeige (Anbieten)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Kleinanzeigen", :msubtype => "Anbieten")
        pic = "kleinanzeige.jpg"
        icon = "align-justify"
      when "Neue Kleinanzeige (Suchen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Kleinanzeigen", :msubtype => "Suchen")
        pic = "kleinanzeige.jpg"
        icon = "align-justify"

      when "Neue Stellenanzeige (Anbieten)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Stellenanzeigen", :msubtype => "Anbieten")
        pic = "stellenanzeige.jpg"
        icon = "briefcase"
      when "Neue Stellenanzeige (Suchen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Stellenanzeigen", :msubtype => "Suchen")
        pic = "stellenanzeige.jpg"
        icon = "briefcase"

      when "Neue Crowdfunding-Initiative (Spenden)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id,  :mtype => "Crowdfunding", :msubtype => "Spenden")
        pic = "spende.jpg"
        icon = "grain"
      when "Neue Crowdfunding-Initiative (Belohnungen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Crowdfunding", :msubtype => "Belohnungen")
        pic = "belohnung.jpg"
        icon = "grain"
      when "Neue Crowdfunding-Initiative (Zinsen)"
        path = new_mobject_path(:user_id => user_id, :company_id => company_id, :mtype => "Crowdfunding", :msubtype => "Zinsen")
        pic = "kredit.jpg"
        icon = "grain"

    end
    if path_param
      path = path_param
    end
    html_string = ""
    if false
    html_string = html_string + link_to(path) do
      content_tag(:div, nil, class:"col-xs-4 col-sm-4 col-md-3 col-lg-2") do 
        content_tag(:div, nil, class:"thumbnail kachel_min_height kachel_text", align:"center") do
          content_tag(:span, nil) do
            #content_tag(:i, nil, class:"glyphicon glyphicon-" + glyphicon, style:"font-size:" + icon_size + "em") + content_tag(:small_cal, "<br>".html_safe+object)
            #content_tag(:listh1, domain) + "<br><br>".html_safe + image_tag(glyphicon+"-question-mark.png", :size => "45x45") + "<br><br>".html_safe + content_tag(:listh3, object)
            if name and name.length > 0
              content_tag(:listh1, domain) + "<br><br>".html_safe + image_tag(pic, :size => "100x100") + "<br><br>".html_safe + content_tag(:listh3, name)
            else
              content_tag(:listh1, domain) + "<br><br>".html_safe + image_tag(pic, :size => "100x100")
            end
          end
        end
      end
    end
    end
    html_string = html_string + link_to(path) do
      content_tag(:div, nil, class:"col-xs-4 col-sm-4 col-md-3 col-lg-2") do 
        content_tag(:div, nil, class:"thumbnail", align:"center") do
          content_tag(:span, nil) do
            icon_size = "4"
            content_tag(:i, nil, class:"glyphicon glyphicon-" + icon, style:"font-size:" + icon_size + "em") + content_tag(:small_cal, "<br>".html_safe+domain)
            #content_tag(:listh1, domain) + "<br><br>".html_safe + image_tag(glyphicon+".png", :size => "45x45") + "<br><br>".html_safe + content_tag(:listh3, name)
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