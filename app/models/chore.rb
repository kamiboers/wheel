class Chore < ApplicationRecord
   validates :title,  presence: true, 
                        uniqueness: true,
                        on: :create
end
