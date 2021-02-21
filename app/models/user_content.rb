class UserContent < ApplicationRecord
  belongs_to :user
  belongs_to :content

  acts_as_votable

  include AASM
    
  aasm do 
      #Declaramos los estados
      
      state :published, initial: true
      state :featured, :banned

      #Declaramos los eventos
      event :ban do
          transitions from: :published, to: :banned
      end
      event :publish do
        transitions from: :banned, to: :published
      end
      event :pinup do
        transitions from: :published, to: :featured
      end

      event :unpinup do
        transitions from: :featured, to: :published
      end
  end
end
