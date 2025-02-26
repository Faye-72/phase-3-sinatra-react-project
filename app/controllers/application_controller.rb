class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post '/signup' do
    request.body.rewind
    data = JSON.parse(request.body.read)
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    password = params[:password]

    # Check if the email already exists in the database
    existing_user = User.find_by(email: email)

    if existing_user
      status 409 # Conflict
      return { error: 'Email already exists' }.to_json
    else
      user = User.new(name: name, email: email, phone: phone, password: password)
      if user.save
        status 201 # Created
        return { message: 'User created successfully' }.to_json
      else
        status 500 # Internal Server Error
        return { error: 'Unable to create user' }.to_json
      end
    end
  end


  post "/login" do
    email = params[:email]
    password = params[:password]
 
     user = User.find_by(email: email)
      if user && user.password == password
         session[:authenticated] = true 
        return{message: "successfully logged in!"}.to_json
      else
        status 401 # Unauthorized
      { error: 'Invalid email or password' }.to_json
    end
   end
  

    get "/profile" do
      if session[:authenticated] = true 
       erb :profile
         else
          redirect'/login'
        end
      end

   post '/ratings' do
      request.body.rewind
      data = JSON.parse(request.body.read)
      value = data['value']
      label = data['label']
      
      feedback = Feedback.new(label: label, value: value)
      feedback.save
      content_type :json
      { message: 'Rating submitted successfully' }.to_json
      end
    end
  