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

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end

        def login(user_id)
            session[:user_id] = user_id
        end

        def create_user(params)
            @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
            if User.all.find {|u| u.username == @user.username}
                redirect '/signup'
            elsif @user.save
                login(@user.id)
                redirect '/welcome'
            else
                redirect '/signup'
            end
        end

    end

end