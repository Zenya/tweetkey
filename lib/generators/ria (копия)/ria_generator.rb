class String
  def initial
    self[0,1]
  end
end

class RiaGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :name, :type => :string
  argument :args_all, :type => :array, :default => [], :banner => 'controller_actions and model:attributes'
  #class_option :stylesheet, :type => :boolean, :default => true, :description => "Include stylesheet file"
  
  def initialize(*args, &block)
    super
    @fields = []
    args_all.each do |arg|
      @fields << arg if arg.include?(':')
    end
  end

  def generate_layout
    template "_model.html.haml", "app/views/#{plural_name}/_#{file_name}.html.haml"
    template "index.js.haml", "app/views/#{plural_name}/index.js.haml"
    template "index.html.haml", "app/views/#{plural_name}/index.html.haml"
    template "controller.rb", "app/controllers/#{plural_name}_controller.rb"
    template "model.rb", "app/models/#{file_name}.rb"
    route "resources :#{plural_name}"
  end
  
  private
  def file_name
    name.underscore
  end

  def plural_name
    name.pluralize
  end
  
#   create app/models/proposal.rb
#   route  resources :proposals
#   create app/controllers/proposals_controller.rb
#   create app/views/proposals
#   create app/views/proposals/index.html.erb
#   create app/views/proposals/edit.html.erb
#   create app/views/proposals/show.html.erb
#   create app/views/proposals/new.html.erb
#   create app/views/proposals/_form.html.erb
#   create app/assets/javascripts/proposals.js

end
