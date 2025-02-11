# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

50.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.unique.email,
      password: "asdzxc123",
      password_confirmation: "asdzxc123",
      gender: [1, 2].sample, # Assuming gender is an integer (0 for Male, 1 for Female)
      phone_number: Faker::PhoneNumber.phone_number
    )
  end



# Policy.create!(name: "Auto Insurance Basic", description: "Covers liability and collision for personal vehicles.", policy_type: "Auto")
# Policy.create!(name: "Auto Comprehensive", description: "Covers theft, fire, and other non-collision damages.", policy_type: "Auto")
# Policy.create!(name: "Property Homeowners", description: "Covers damages and liability for homeowners.", policy_type: "Property")
# Policy.create!(name: "Property Renters", description: "Provides coverage for renters’ personal property and liability.", policy_type: "Property")
# Policy.create!(name: "General Liability", description: "Covers business-related liabilities.", policy_type: "General")

# Policy.create!(name: "Health Basic Plan", description: "Covers hospitalization and basic medical expenses.", policy_type: "Health")
# Policy.create!(name: "Health Premium Plan", description: "Includes specialist consultations, surgeries, and prescriptions.", policy_type: "Health")
# Policy.create!(name: "Health Family Plan", description: "Comprehensive coverage for the entire family.", policy_type: "Health")
# Policy.create!(name: "Auto Third-Party Liability", description: "Covers damages to others' property and injuries.", policy_type: "Auto")
# Policy.create!(name: "Auto Full Coverage", description: "Provides full protection including personal injury and collision.", policy_type: "Auto")
# Policy.create!(name: "Auto Classic Car Insurance", description: "Specialized coverage for classic and vintage vehicles.", policy_type: "Auto")
# Policy.create!(name: "Property Landlord Insurance", description: "Covers property owners renting out homes or apartments.", policy_type: "Property")
# Policy.create!(name: "Property Condo Insurance", description: "Covers condo owners’ personal property and liability.", policy_type: "Property")
# Policy.create!(name: "Property Flood Insurance", description: "Protects against flood damage not covered by standard policies.", policy_type: "Property")
# Policy.create!(name: "Health Senior Citizen Plan", description: "Designed for seniors with additional medical benefits.", policy_type: "Health")
