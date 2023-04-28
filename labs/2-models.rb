# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

new_salespeople = Salesperson.new
new_salespeople["first_name"] = "Ting"
new_salespeople["last_name"] = "Huang"
new_salespeople["email"] = "ting.huang@kellogg.northwestern.edu"
new_salespeople.save

new_salespeople_2 = Salesperson.new
new_salespeople_2["first_name"] = "Kevin"
new_salespeople_2["last_name"] = "Liao"
new_salespeople_2["email"] = "helo831203@gmail.com"
new_salespeople_2.save

# 3. write code to display how many salespeople rows are in the database
puts "There are #{Salesperson.all.count} salespeople in the table."

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

Kevin = Salesperson.find_by ({"first_name" => "Kevin"})
Kevin["email"] = "kevin.liao@kellogg.northwestern.edu"
Kevin.save
puts Kevin.inspect

Ting = Salesperson.find_by ({"first_name" => "Ting"})
Ting["first_name"] = "Ting Yu"
Ting.save
puts Ting.inspect

Hsin = Salesperson.new
Hsin["first_name"] = "Hsin"
Hsin.save

Hsin.destroy

# CHALLENGE:
# 5. write code to display each salesperson's full name
Salespeople = Salesperson.all

for Salesperson in Salespeople
    #for each salesperson in salespeople
    puts "#{Salesperson["first_name"]}, #{Salesperson["last_name"]}"
end

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
