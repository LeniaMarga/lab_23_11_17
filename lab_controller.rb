require('sinatra')
require('sinatra/reloader')
require( 'pry-byebug' )

require_relative('./models/house')
require_relative('./models/student')


#index
get '/students' do
  @students = Student.all
  erb(:index)
end

#new
get '/students/new' do # new ----it calls the post (create)
  @houses = House.all
  erb(:new)
end

#show
get '/students/:id' do  #---it calls the delete
  @student = Student.find(params[:id])
  erb(:show)
end


#create
post '/students' do
  @student = Student.new()
  @student.save
  redirect to '/students'
end


#edit ---- calls the put(update)
get '/students/:id/edit' do
  @student = Student.find(params[:id])
  @houses = House.all()
  erb(:edit)
end

#update
put '/students/:id' do
  Student.new(params).update
  redirect to '/students'
end

#delete
delete '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete
  redirect to '/students'
end



# binding.pry
# nil
