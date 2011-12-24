class RiaGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :layout_name, :type => :string, :default => "proposal"
  class_option :stylesheet, :type => :boolean, :default => true, :description => "Include stylesheet file"
  
  def generate_layout
    copy_file "stylesheet.css", "app/assets/stylesheets/#{file_name}.sass" if options.stylesheet?
    template "layout.html.erb", "app/#{file_name}/views/index.html.haml"
  end
  
  private
  def file_name
    layout_name.underscore
  end
  
 #     invoke  mongoid
 #     create    app/models/proposal.rb
  #    invoke    test_unit
  #    create      test/unit/proposal_test.rb
  #    create      test/fixtures/proposals.yml
   #    route  resources :proposals
    #  invoke  scaffold_controller
     # create    app/controllers/proposals_controller.rb
 #     invoke    erb
  #    create      app/views/proposals
   #   create      app/views/proposals/index.html.erb
    #  create      app/views/proposals/edit.html.erb
     # create      app/views/proposals/show.html.erb
 #     create      app/views/proposals/new.html.erb
  #    create      app/views/proposals/_form.html.erb
   #   invoke    test_unit
    #  create      test/functional/proposals_controller_test.rb
    #  invoke    helper
     # create      app/helpers/proposals_helper.rb
  #    invoke      test_unit
 #     create        test/unit/helpers/proposals_helper_test.rb
   #   invoke  assets
  #    invoke    js
   #   create      app/assets/javascripts/proposals.js
   #   invoke    scss
   #   create      app/assets/stylesheets/proposals.css.scss
   #   invoke  scss
  # identical    app/assets/stylesheets/scaffolds.css.scss

end
