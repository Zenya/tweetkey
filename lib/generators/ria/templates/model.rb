class <%=file_name.capitalize%>
  include Mongoid::Document
  include Mongoid::Timestamps
  <% @fields.each do |field| p = field.split(":") %>
  <%="field :#{p.first}, type: #{p.last.capitalize}" if p.last == 'string' %><%="field :#{p.first}, type: #{p.last.capitalize}, default: \"0\"" if p.last == 'integer' %><%="field :#{p.first}, type: #{p.last.capitalize}, default: []" if p.last == 'array' %><% end %>

end
