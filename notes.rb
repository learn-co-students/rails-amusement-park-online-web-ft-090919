rspec spec/models



Test user for test_ride method:
  :name => "Mindy",
  :password => "password",
  :nausea => 5,
  :happiness => 3,
  :tickets => 4, updated to => 10 
  :height => 34

Test attraction for test_ride method:
  :name => "Roller Coaster",
  :tickets => 5,
  :nausea_rating => 2,
  :happiness_rating => 4,
  :min_height => 32

*After taking ride:
  -User's tickets update. (Subtract user's tickets from attraction tickets.)
  -User's nausea update. (User nausea plus attraction nausea.)
  -User's happienss update. (User happiness plus attraction nausea.)



Models:

-Attraction
-User
-Ride 

Attraction:
  has_many rides
  has_many users, through rides 

    -name - string
    -tickets - integer
    -nausea_rating - integer
    -happiness_rating - integer
    -min_height - integer 


User:
  has_many rides
  has_many attractions, through rides

    -name - string 
    -password_digest - string
    -nausea - integer 
    -happiness - integer 
    -tickets - integer 
    -height - integer 
    -admin - boolean (default to false)


Ride:
  belongs_to attraction 
  belongs_to user


  signin form:

  <%= form_for :user, url: '/users' do |f| %>
    Name: <%= f.collection_select :name, @users, :id, :name %>
    password: <%= f.password_field :password %>
    <%= f.submit "Submit" %>
  <% end %>


<h1>Sign In</h1>
<%= form_tag("/signin", method: "post") do %>
  <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
  <p>Select a User:</p>
  <%= collection_select(:user, :name, User.all, :name, :name) %><br />
  <p>Password: <%= password_field_tag :password %></p>
  <%= submit_tag "Sign In" %>
<% end %>
  

attraction show:
<%= @attraction.name %>

attraction index:
<% @attractions.each do |attraction| %> 
  <h3> <%= link_to "Go on #{attraction.name}", attraction_path(attraction) %> </h3>
  <% end %>


User ride info:
  
<% if @user.rides.take_ride %>
<p> "Thanks for riding the #{@user.rides.attraction.name}!" </p>
<% end %>



User Show form:
<h1> Hello <%= @user.name %>! </h1>
Current Mood: <%= @user.mood %>
Tickets: <%= @user.tickets %>
Height: <%= @user.height %>

<% if @ride %>
<p> "Thanks for riding the <%= @ride.attraction.name %>!" </p>
<% end %>

<% if @user.admin %>
<h3> ADMIN </h3>
<% end %>

<%= form_tag ({controller: 'sessions', action: 'destroy', method: 'post'}) do %>
    <br>
 <p>Log Out:</p>    
 <input type=submit value='Log Out'>
<% end %>

<%= link_to "See attractions", attractions_path %>


<%= link_to "Log Out", sessions_path, method: 'delete' %>


<h1>Welcome <%= @user.name %></h1>
<p>Mood: <%= @user.mood %></p>
<p>Tickets: <%= @user.tickets %></p>
<p>Nausea: <%= @user.nausea %></p>
<p>Height: <%= @user.height %></p>
<% if @user.admin %>
<p>ADMIN</p>
<% end %>
<%= link_to "See attractions", attractions_path %>




<% if @ride %>
<p> "Thanks for riding the <%= @ride.attraction.name %>!" </p>
<% end %>



<% @attractions.each do |attraction| %> 
  <h3> <%= link_to "Go on #{attraction.name}", attraction_path(attraction) %> </h3>
  <% end %>