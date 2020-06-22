# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ////////////////////////////
# Seeding Organisers (5)
# ////////////////////////////
sda = Organiser.new
sda.email = 'sda@example.com'
sda.encrypted_password = '$2a$11$QiljViOCofykuZktz7X9hefuYaLg5Ru9vnF6kem4DaYfcwYig7u2i'
sda.save!(validate: false)

scs = Organiser.new
scs.email = 'scs@example.com'
scs.encrypted_password = '$2a$11$QiljViOCofykuZktz7X9hefuYaLg5Ru9vnF6kem4DaYfcwYig7u2i'
scs.save!(validate: false)

bluecross = Organiser.new
bluecross.email = 'bluecross@example.com'
bluecross.encrypted_password = '$2a$11$QiljViOCofykuZktz7X9hefuYaLg5Ru9vnF6kem4DaYfcwYig7u2i'
bluecross.save!(validate: false)

pet_shelter = Organiser.new
pet_shelter.email = 'petshelter@example.com'
pet_shelter.encrypted_password = '$2a$11$QiljViOCofykuZktz7X9hefuYaLg5Ru9vnF6kem4DaYfcwYig7u2i'
pet_shelter.save!(validate: false)

environmentalist = Organiser.new
environmentalist.email = 'environ@example.com'
environmentalist.encrypted_password = '$2a$11$QiljViOCofykuZktz7X9hefuYaLg5Ru9vnF6kem4DaYfcwYig7u2i'
environmentalist.save!(validate: false)

# ////////////////////////////
# Seeding Volunteers (2)
# ////////////////////////////
alice = Volunteer.new
alice.email = 'alice@example.com'
alice.encrypted_password = '$2a$11$QiljViOCofykuZktz7X9hefuYaLg5Ru9vnF6kem4DaYfcwYig7u2i'
alice.save!(validate: false)

bob = Volunteer.new
bob.email = 'bob@example.com'
bob.encrypted_password = '$2a$11$QiljViOCofykuZktz7X9hefuYaLg5Ru9vnF6kem4DaYfcwYig7u2i'
bob.save!(validate: false)

# //////////////////////////////////
# Seeding Activity Categories (6)
# /////////////////////////////////
community = Category.new
community.category = 'Community'
community.save!(validate: false)

children = Category.new
children.category = 'Children'
children.save!(validate: false)

elderly = Category.new
elderly.category = 'Elderly'
elderly.save!(validate: false)

low_income = Category.new
low_income.category = 'Low Income'
low_income.save!(validate: false)

animals = Category.new
animals.category = 'Animals'
animals.save!(validate: false)

environment = Category.new
environment.category = 'Environment'
environment.save!(validate: false)

# # ////////////////////////////
# # Seeding Activities (9)
# # ////////////////////////////
sda_activity_1 = Activity.new
sda_activity_1.title = 'Social Distancing @ Northpoint'
sda_activity_1.description = 'Volunteers will be assisting as Social Distancing Ambassadors to remind members of public to maintain a safe distance from each other.'
sda_activity_1.requirements = 'None'
sda_activity_1.date = '2020-06-30'
sda_activity_1.volunteer_count = 0
sda_activity_1.total_volunteer = 30
sda_activity_1.organiser_id = 1
sda_activity_1.category_id = 1
sda_activity_1.img_url = 'https://static.mothership.sg/1/2020/03/social-distancing-hawker-centres.jpg'
sda_activity_1.save!

sda_activity_2 = Activity.new
sda_activity_2.title = 'Social Distancing @ Parkway Parade'
sda_activity_2.description = 'Volunteers will be assisting as Social Distancing Ambassadors to remind members of public to maintain a safe distance from each other.'
sda_activity_2.requirements = 'None'
sda_activity_2.date = '2020-07-04'
sda_activity_2.volunteer_count = 0
sda_activity_2.total_volunteer = 20
sda_activity_2.organiser_id = 1
sda_activity_2.category_id = 1
sda_activity_2.img_url = 'https://static.mothership.sg/1/2020/03/social-distancing-hawker-centres.jpg'
sda_activity_2.save!

sda_activity_3 = Activity.new
sda_activity_3.title = 'Social Distancing @ Junction 8'
sda_activity_3.description = 'Volunteers will be assisting as Social Distancing Ambassadors to remind members of public to maintain a safe distance from each other.'
sda_activity_3.requirements = 'None'
sda_activity_3.date = '2020-07-15'
sda_activity_3.volunteer_count = 0
sda_activity_3.total_volunteer = 25
sda_activity_3.organiser_id = 1
sda_activity_3.category_id = 1
sda_activity_3.img_url = 'https://static.mothership.sg/1/2020/03/social-distancing-hawker-centres.jpg'
sda_activity_3.save!

# //
scs_activity_1 = Activity.new
scs_activity_1.title = 'Avengers Assemble @ Youngster Joey Centre'
scs_activity_1.description = 'Volunteers will be dressed up as Avengers characters to visit children at BCC. Costume will be provided.'
scs_activity_1.requirements = 'None'
scs_activity_1.date = '2020-08-20'
scs_activity_1.volunteer_count = 0
scs_activity_1.total_volunteer = 8
scs_activity_1.organiser_id = 2
scs_activity_1.category_id = 2
scs_activity_1.img_url = 'https://i.ytimg.com/vi/nmvJ57HebXU/maxresdefault.jpg'
scs_activity_1.save!

scs_activity_2 = Activity.new
scs_activity_2.title = 'Koding For Kidz'
scs_activity_2.description = 'Help kids learn the basics of coding! Prior knowledge in basic coding concepts is preferred but not required.'
scs_activity_2.requirements = 'Basic understanding of coding concepts'
scs_activity_2.date = '2020-07-14'
scs_activity_2.volunteer_count = 0
scs_activity_2.total_volunteer = 4
scs_activity_2.organiser_id = 2
scs_activity_2.category_id = 2
scs_activity_2.img_url = 'https://s3-ap-southeast-1.amazonaws.com/singapores-child/uploads/2019/05/22184903/singapores-child-why-parents-send-their-kids-to-coding-lab.jpg'
scs_activity_2.save!

#//
bluecross_activity_1 = Activity.new
bluecross_activity_1.title = 'Elderly Meet Up @ Silver Home'
bluecross_activity_1.description = 'Volunteers will interact with seniors at the center, and support our programme coordinator with the planned activities. Volunteers should preferably be able to converse in basic Mother Tongue or Dialect'
bluecross_activity_1.requirements = 'Able to converse in basic Mother Tongue or Dialect'
bluecross_activity_1.date = '2020-09-08'
bluecross_activity_1.volunteer_count = 0
bluecross_activity_1.total_volunteer = 8
bluecross_activity_1.organiser_id = 3
bluecross_activity_1.category_id = 3
bluecross_activity_1.img_url = 'https://cdn.shopify.com/s/files/1/0096/6162/articles/Zumba_for_seniors_and_elderly_47b01211-644d-4a97-860f-5925574acf14_1200x1200.jpg?v=1563396000'
bluecross_activity_1.save!

bluecross_activity_2 = Activity.new
bluecross_activity_2.title = 'Goodie Pack Distribution @ Blk 1000'
bluecross_activity_2.description = 'Volunteers will be assisting to pack and distribute goodie packs with daily essentials to residents of Blk 1000.'
bluecross_activity_2.requirements = 'None'
bluecross_activity_2.date = '2020-07-22'
bluecross_activity_2.volunteer_count = 0
bluecross_activity_2.total_volunteer = 8
bluecross_activity_2.organiser_id = 3
bluecross_activity_2.category_id = 4
bluecross_activity_2.img_url = 'https://sgvolunteer.com/wp-content/uploads/2012/10/Giving-food-from-the-heart.jpg'
bluecross_activity_2.save!

#//
pet_shelter_activity_1 = Activity.new
pet_shelter_activity_1.title = 'Animal Walk & Talk'
pet_shelter_activity_1.description = 'Volunteers will be tending to our animals, and perform tasks such as bringing them for walks and basic grooming.'
pet_shelter_activity_1.requirements = 'Prior experience in handling animals is preferred.'
pet_shelter_activity_1.date = '2020-07-29'
pet_shelter_activity_1.volunteer_count = 0
pet_shelter_activity_1.total_volunteer = 5
pet_shelter_activity_1.organiser_id = 4
pet_shelter_activity_1.category_id = 5
pet_shelter_activity_1.img_url = 'https://insurancemarket.sg/articles/wp-content/uploads/Dog-day-care-Singapore.jpg'
pet_shelter_activity_1.save!

#//
environmentalist_activity_1 = Activity.new
environmentalist_activity_1.title = 'Beach Clean Up @ Changi Beach'
environmentalist_activity_1.description = 'Volunteers will be assisting to clean up the coastline along Changi Beach. Proper equipment will be provided.'
environmentalist_activity_1.requirements = 'None'
environmentalist_activity_1.date = '2020-09-08'
environmentalist_activity_1.volunteer_count = 0
environmentalist_activity_1.total_volunteer = 5
environmentalist_activity_1.organiser_id = 5
environmentalist_activity_1.category_id = 6
environmentalist_activity_1.img_url = 'https://www.rythmfoundation.org/wp-content/uploads/2019/04/pick-up-the-rubbish.jpg'
environmentalist_activity_1.save!

# # ///////////////////////////
# # Seeding Participation (1)
# # //////////////////////////
participation_1a = Participation.new
participation_1a.activity_id = 1
participation_1a.volunteer_id = 1
participation_1a.save!

participation_1b = Participation.new
participation_1b.activity_id = 1
participation_1b.volunteer_id = 2
participation_1b.save!

participation_4 = Participation.new
participation_4.activity_id = 4
participation_4.volunteer_id = 1
participation_4.save!