class Content < ApplicationRecord
  belongs_to :course
  belongs_to :chapter
  has_rich_text :richContent
  has_many :contents

  include AASM
    
  aasm do 
      #Declaramos los estados
      state :in_draft, initial: true
      state :published, :disabled

      #Declaramos los eventos
      event :publish do
        transitions from: [:in_draft, :disabled], to: :published
      end
     
      event :unpublish do
        transitions from: [:published, :disabled], to: :in_draft
      end
      
      event :disable do
        transitions from: [:published, :in_draft], to: :disabled
      end
  end

end
