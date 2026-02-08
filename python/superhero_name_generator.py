import random

print("🦸 Welcome to the Superhero Name Generator 🦸")
print("Answer a few questions and discover your heroic identity.\n")

while True:
    first_name = input("Enter your first name (or press Enter to quit): ").strip()
    if first_name == "":
        print("\nMission aborted. Stay safe out there, hero.")
        break

    favorite_thing = input("Enter something you like (animal, object, element, etc.): ").strip()
    power = input("Enter a power or trait (strength, speed, stealth, fire, etc.): ").strip()

    # Clean and format inputs
    first_name = first_name.capitalize()
    favorite_thing = favorite_thing.capitalize()
    power = power.capitalize()

    # Generate randomized name patterns
    patterns = [
        f"{power} {favorite_thing}",
        f"The {favorite_thing} of {power}",
        f"{first_name} the {power}",
        f"{favorite_thing} Knight",
        f"{power} {first_name}",
        f"{first_name}, Master of {power}"
    ]

    superhero_name = random.choice(patterns)

    print(f"\n🦸 Your superhero name is: **{superhero_name}** 🦸\n")
