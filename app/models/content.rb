class Content < ApplicationRecord
  belongs_to :course
  belongs_to :chapter
  has_rich_text :richContent
  has_many :contents

  include AASM
    
  aasm do 
      #Declaramos los estados
      state :in_draft, initial: true
      state :published

      #Declaramos los eventos
      event :publish do
          transitions from: :in_draft, to: :published
        end
     
        event :unpublish do
          transitions from: :published, to: :in_draft
        end
  end

end
