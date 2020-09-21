class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, "public"
        set :views, "app/views"
        enable :sessions
        set :sessions_secret, "SantasGotABrandNewBag"
    end

    get '/' do
        "Hello World!"
    end

end