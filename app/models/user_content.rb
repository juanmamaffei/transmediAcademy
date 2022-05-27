class UserContent < ApplicationRecord
  belongs_to :user
  belongs_to :content

  acts_as_votable

  include AASM

  aasm do
    # Declaramos los estados

    state :published, initial: true
    state :featured, :banned

    # Declaramos los eventos
    # GET banear
    event :ban do
      transitions from: %i[published featured], to: :banned
    end
    # GET publicar
    event :publish do
      transitions from: :banned, to: :published
    end
    # GET fijar
    event :pinup do
      transitions from: :published, to: :featured
    end
    # GET fijar
    event :unpinup do
      transitions from: :featured, to: :published
    end
  end
end
