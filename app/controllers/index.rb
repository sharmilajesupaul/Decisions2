get '/' do
  # displays the index with user login
  if session['user_id'] != nil
    user_id = session['user_id']
    p user_id
    redirect "/users/#{user_id}"
  else
    # p sessions
    erb :index
  end
end

get '/users/:id' do
  # @all_the_things = []
  user_id = params[:id]
  @user = User.find(user_id)
  # @users = User.all
  # @posts = Post.all
  # @weights = Weight.all

  # @all_the_things << @posts.flatten
  # @all_the_things << @weights.flatten
  # @timeline_objs = @all_the_things.flatten.sort_by{|thing| thing.created_at}.reverse
  # p @timeline_objss
  erb :profile
end


post '/sessions' do
  # @error = false
  p params[:username]
  p params[:password]
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