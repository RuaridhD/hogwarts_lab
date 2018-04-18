require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/student.rb")
require_relative("./models/house.rb")



#index
get "/hogwarts" do
  @students = Student.all()
  # @houses = House.all()
  erb(:index)
end

#new
get "/hogwarts/new" do
  erb(:new)
end

#show
get "/hogwarts/:id" do
  @student = Student.find(params[:id])
  # @houses = House.find(params[:id])
  erb(:show)
end

#create
post "/hogwarts" do
  students = Student.new(params)
  students.save()
  redirect to "/hogwarts"
end

#edit
get "/hogwarts/:id/edit" do
  @student = Student.find(params[:id])
  erb(:edit)
  # redirect to "/hogwarts/"
  end

#update
post "/hogwarts/:id/edit" do
  @student = Student.new(params)
  @student.update()
  redirect to "/hogwarts/students"
end

#destroy
post "/hogwarts/:id/delete" do
  students = Student.new(params)
  students.delete()
  redirect to "/hogwarts"
end
