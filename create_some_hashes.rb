# A movie collection that organizes by genres
# Recipes with ingredients
# User profiles where each user has a list of favorite colors along with 3 personal essays, essay_1, essay_2, essay_3

movies = {
  :comedy => ["50 First Dates", "Pulp Fiction", "Anchorman"],
  :action => ["Lion King", "TMNJ", "Top Gun", "Batman", "The Dark Knight"],
  :drama => ["Citizen Kane", "Terminator", "Cool Hand Luke"],
  :mind_bender => ["Requiem for a Dream", "Life of Pi", "Minority Report", "Memento"]
  }

recipes = {
  :cajun_chicken => [
    {:chicken => "2 pounds"},
    {:paprika => "1 tablespoon"},
    {:salt => "dash"},
    {:pepper => "1 teaspoon"},
    {:old_bay => "1 gallon"},
    {:flour => "3 cups"},
    {:corn_oil => "8 cups"},
    {:spice => "mucho"}
  ],
  :shrimp_scampi => [
    {:shrimp => "20 ounces"},
    {:scampi => ""}
    ]
}

user_profiles = [
    { username:         "Matt",
      favorite_colors: ["green", "blue", "yellow"],
      essays:          ["essay1", "essay2", "essay3"] 
    },

    { username:         "Logan",
    favorite_colors: ["purple", "pink", "blood"],
    essays:          ["essay3", "essay4", "essay5"] 
  },

  { username:         "Manu",
    favorite_colors: ["alpine green", "earth brown", "banana yellow"],
    essays:          ["essay6", "essay7", "essay8"] 
  }
]