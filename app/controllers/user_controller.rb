class UserController < ApplicationController

    get '/signup' do
        erb :'user/signup'
    end
   
    post '/signup' do
        binding.pry
        @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])

        
    end

end
