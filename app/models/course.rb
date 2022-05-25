class Course < ApplicationRecord
    has_many :chapters
    has_many :contents, through: :chapters

    include AASM
    
    aasm do 
        # States declarations
        state :in_draft, initial: true
        state :published

        # Events declarations
        event :publish do
            transitions from: :in_draft, to: :published
          end
       
          event :unpublish do
            transitions from: :published, to: :in_draft
          end
    end
end

