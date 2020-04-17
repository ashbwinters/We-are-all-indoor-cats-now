# Player Seeds

player1 = Player.create(
    name: "Lynn Amsbury"
)

player2 = Player.create(
    name: "Ashley Winters"
)

player3 = Player.create(
    name: "Bob Winters"
)

player4 = Player.create(
    name: "Lizzie Borden"
)

player5 = Player.create(
    name: "Freddie Krueger"
)

player6 = Player.create(
    name: "Harley Quinn"
)
























# Game Seeds

catan = Game.create(
    name: "Settlers Of Catan",
    players_min: 3,
    players_max: 4,
    setup_time: 5,
    play_time: 45,
    genre: "Resource Gathering",
    age_min: 8,
    competative: 1,
    learning_curve: 5,
    family_friendly: 1,
    expansions: 1,
    description: "Picture yourself in the era of discoveries: after a long voyage of great deprivation, your ships have finally reached the coast of an uncharted island. Its name shall be Catan! But you are not the only discoverer. Other fearless seafarers have also landed on the shores of Catan: the race to settle the island has begun!"
)

cards_against = Game.create(
    name: "Cards Against Humanity",
    players_min: 4,
    players_max: 20,
    setup_time: 5,
    play_time: 45,
    genre: "Party",
    age_min: 18,
    competative: 1,
    learning_curve: 3,
    family_friendly: 0,
    expansions: 1,
    description: "Cards Against Humanity is a party game for horrible people. Unlike most of the party games you've played before, Cards Against Humanity is as despicable and awkward as you and your friends."
)

ticket_to_ride = Game.create(
    name: "Ticket To Ride",
    players_min: 2,
    players_max: 5,
    setup_time: 5,
    play_time: 60,
    genre: "Strategy",
    age_min: 8,
    competative: 1,
    learning_curve: 3,
    family_friendly: 1,
    expansions: 0,
    description: "Ticket to Ride is a cross-country train adventure in which players collect and play matching train cards to claim railway routes connecting cities throughout North America."
)

unstable_unicorns = Game.create(
    name: "Unstable Unicorns",
    players_min: 2,
    players_max: 8,
    setup_time: 3,
    play_time: 30,
    genre: "Strategy",
    age_min: 14,
    competative: 1,
    learning_curve: 4,
    family_friendly: 1,
    expansions: 1,
    description: "Build a Unicorn army. Betray your friends. Unicorns are your friends now."
)

munchkin = Game.create(
    name: "Munchkins",
    players_min: 3,
    players_max: 6,
    setup_time: 2,
    play_time: 60,
    genre: "Card",
    age_min: 10,
    competative: 1,
    learning_curve: 4,
    family_friendly: 1,
    expansions: 1,
    description: "Go down in the dungeon. Kill everything you meet. Backstab your friends and steal their stuff. Grab the treasure and run. Admit it. You love it."
)

gloomhaven = Game.create(
    name: "Gloomhaven",
    players_min: 1,
    players_max: 4,
    setup_time: 20,
    play_time: 60,
    genre: "Rolepaying",
    age_min: 12,
    competative: 0,
    learning_curve: 8,
    family_friendly: 0,
    expansions: 0,
    description: "Euro-inspired tactical combat in an evolving campaign."
)