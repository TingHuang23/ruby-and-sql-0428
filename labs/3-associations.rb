# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

ting = Salesperson.find_by({"first_name" => "Ting Yu", "last_name" => "Huang" })
tim = Contact.find_by({"first_name" => "Tim", "last_name" => "Cook"})

activity = Activity.new
activity["salesperson_id"] = ting["id"]
activity["contact"] = tim["id"]
activity["note"] = "Coffee Chat"
activity.save

activity_2 = Activity.new
activity_2["salesperson_id"] = ting["id"]
activity_2["contact"] = tim["id"]
activity_2["note"] = "Coffee Chat again"
activity_2.save

##prob wrong
# amazon = Company.find_by({"name" => "Amazon"})
# new_contact = Contact.new
# new_contact["first_name"] = "Jeff"
# new_contact["last_name"] = "Bezos"
# new_contact["email"] = "JB@apple.com"
# new_contact["company_id"] = amazon["id"]
# new_contact.save


# amazon = Company.find_by({"name" => "Amazon"})
# new_contact_2 = Contact.new
# new_contact_2["first_name"] = "Andy"
# new_contact_2["last_name"] = "Jassy"
# new_contact_2["email"] = "Andy.J@apple.com"
# new_contact_2["company_id"] = amazon["id"]
# new_contact_2.save

# new_salesperson = Salesperson.new
# new_salesperson["first_name"] = "Dav"
# new_salesperson["last_name"] = "Ig"
# new_salesperson["email"] = "Dav.ig@gamil.com"
# puts "Dav created!" 


###

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

activities = Activity.where({
    "salesperson_id" => ting["id"],
    "contact" => tim["id"]
})

for activity in activities
    puts "- #{activity["note"]}"
end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
