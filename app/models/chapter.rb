class Chapter < ApplicationRecord
  belongs_to :course
  has_many :contents

  include AASM

  aasm do
    # Declaramos los estados
    state :in_draft, initial: true
    state :published

    # Declaramos los eventos
    event :publish do
      transitions from: :in_draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :in_draft
    end
  end
end
