class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :messages, join_table: :users_messages

    validates :email , presence: true, uniqueness: true
end