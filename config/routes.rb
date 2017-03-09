Rails.application.routes.draw do

  %w(about donate
    terms message_received jobs).each do |page|
      get page.gsub("_","-"), to: "static##{page}", as: page
  end

  resources :enquiries, path: 'contact-us' do
    get 'preview', on: :member
  end

  # Mount all the registered PushType Rails Engines. This should be placed
  # at the end of your routes.rb file to ensure your application routes are
  # not overidden by PushType.
  #
  # Overide the default mount points by passing a hash of options.
  # Example:
  #
  #   mount_push_type admin: 'cms', front_end: 'blog'
  #
  mount_push_type

end
