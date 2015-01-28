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

# Route that makes a new user
post '/users/new' do
  @user = User.create(params[:user])
  session['user_id'] = @user.id

  redirect "/users/#{@user.id}"
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

