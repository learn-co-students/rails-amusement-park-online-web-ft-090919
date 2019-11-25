
[1mFrom:[0m /mnt/c/users/Danny.Dannys_PC/dev/flatiron/labs/rails-amusement-park-online-web-ft-090919/app/controllers/rides_controller.rb @ line 23 RidesController#create:

     [1;34m6[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m7[0m:   @attraction = [1;34;4mAttraction[0m.find(params[[33m:attraction_id[0m])
     [1;34m8[0m:   @user = current_user
     [1;34m9[0m: 
    [1;34m10[0m:   errors = [1;34;4mRide[0m.check(@user, @attraction)
    [1;34m11[0m:   [32mif[0m !errors.nil?
    [1;34m12[0m:     @errors = errors
    [1;34m13[0m:     redirect_to user_path(@user)
    [1;34m14[0m:   [32melse[0m
    [1;34m15[0m: 
    [1;34m16[0m:     [1;34m#Ride.create_ride(@user, @attraction)[0m
    [1;34m17[0m:     user_tickets = @user.tickets
    [1;34m18[0m:     attraction_tickets = @attraction.tickets
    [1;34m19[0m:     total = user_tickets - attraction_tickets
    [1;34m20[0m:     @user.tickets = total
    [1;34m21[0m:     @user.save
    [1;34m22[0m:     require [31m[1;31m'[0m[31mpry[1;31m'[0m[31m[0m
 => [1;34m23[0m:     binding.pry
    [1;34m24[0m:     [1;34;4mRide[0m.create([35mattraction_id[0m: @attraction.id, [35muser_id[0m: @user.id)
    [1;34m25[0m:     
    [1;34m26[0m:     redirect_to user_path(@user), [35malert[0m: [31m[1;31m"[0m[31mThank you for riding #{@attraction.name}[0m[31m[1;31m"[0m[31m[0m
    [1;34m27[0m:   [32mend[0m
    [1;34m28[0m: [32mend[0m

