# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Policy.create!(name: "Auto Insurance Basic", description: "Covers liability and collision for personal vehicles.", policy_type: "Auto")
Policy.create!(name: "Auto Comprehensive", description: "Covers theft, fire, and other non-collision damages.", policy_type: "Auto")
Policy.create!(name: "Property Homeowners", description: "Covers damages and liability for homeowners.", policy_type: "Property")
Policy.create!(name: "Property Renters", description: "Provides coverage for renters’ personal property and liability.", policy_type: "Property")
Policy.create!(name: "General Liability", description: "Covers business-related liabilities.", policy_type: "General")
