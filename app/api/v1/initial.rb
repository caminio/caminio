module Caminio::API
  
  class Initial < Grape::API
  
    include Caminio::API::Container
    caminio_mountpoint :api
      
    prefix '/v1/initial'

    #
    # POST /init
    #
    desc "initial setup (allows you to create your first user account and organization)"
    params do
      requires :organization_name
      requires :email
      requires :username
      requires :password
    end
    post :init do
      return error!('SetupIsCompletedAlready',403) if Caminio::User.count > 0
      org = Caminio::Organization.create( name: params.organization_name )
      Caminio::User.create( organization_id: org.id, username: params.username, password: params.password, email: params.email )
    end

  end
end
