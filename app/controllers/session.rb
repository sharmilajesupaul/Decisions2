# User session authentication.
post '/sessions' do
  # @error = false
  # p params[:username]
  # p params[:password]
  @user = User.find_by(username: params[:username])
  p @user
  p @user.authenticate(params[:password])
  if @user
    if @user.authenticate(params[:password])
      session['user_id'] = @user.id

      redirect "/users/#{@user.id}"
    end
  else
    @error = true
    redirect "/"
  end
end

delete '/sessions/:id' do
  session['user_id'] = nil

  redirect '/'
end

