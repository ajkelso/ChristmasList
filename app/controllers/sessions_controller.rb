class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/sessions' do
        
    end
end
