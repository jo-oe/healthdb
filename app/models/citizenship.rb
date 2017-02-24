class Citizenship < ApplicationRecord
  searchkick word_start: [:title, :director]
end
